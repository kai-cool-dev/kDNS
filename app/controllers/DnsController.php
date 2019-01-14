<?php
/* TODO:

- DNS Edit Page:
  - Add domain_description (used in whois)
  - update soa serial
- Domain Deletion
  - Automatically purge all records

*/
namespace kDNS\Controllers;

// Models
use kDNS\Models\Domains;
use kDNS\Models\Records;
use kDNS\Models\Recursor;
use kDNS\Models\Nameserver;
use kDNS\Models\TopDomains;
use kDNS\Models\RecordTypes;
use kDNS\Models\Changelog;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

// GUI Forms
use kDNS\Forms\CreateNameserverForm;
use kDNS\Forms\CreateRecordForm;
use kDNS\Forms\CreateSOAForm;
use kDNS\Forms\NameserverSelectForm;
use kDNS\Forms\CreateMXForm;
use kDNS\Forms\CreateRecordTypeForm;
use kDNS\Forms\CreateRecursorForm;

// Other Stuff
use Phalcon\Filter;

/**
 * Display the default index page.
 */
class DnsController extends ControllerBase
{
  /**
  * Default action. Set the private layout (layouts/private.volt)
  */
  public function initialize()
  {
    $this->view->setVar('logged_in', is_array($this->auth->getIdentity()));
    $this->view->setTemplateBefore('private');
  }

  /**
  * Displays Index Page
  */
  public function indexAction()
  {
    if(empty($_GET["page"]))
    {
      $currentPage = 0;
    }
    else
    {
      $currentPage = (int) $_GET["page"];
    }
    $domains = Domains::find([
      "account = ".$this->view->identity["id"]
    ]);
    $paginator = new PaginatorModel(
      [
        "data"  => $domains,
        "limit" => 10,
        "page"  => $currentPage,
      ]
    );
    $this->view->domains = $paginator->getPaginate();
  }

  /**
  * Edit Domain Name Entries
  */
  public function editAction($id)
  {
    $this->view->domain=Domains::findFirst($id);
    if($this->view->identity["profile"] == "Administrators")
    {
      $this->flash->notice('You are in admin modus.');
    }
    else
    {
      if($this->view->domain->account == "0")
      {
        $this->flash->notice('This is a public domain');
      }
      else
      {
        if($this->view->domain->account != $this->view->identity["id"])
        {
          $this->flash->notice('You don\'t have access to this module: private');
          return $this->dispatcher->forward([
              'action' => 'index'
          ]);
        }
      }
    }
    $this->view->records=Records::find('domain_id = '.$this->view->domain->id);
    if($this->request->isPost())
    {
      $data=$this->request->getPost();
      switch($data["action"])
      {
        case 'create':
          $this->createRecord($data);
        break;

        case 'createSOA':
          $this->createSOARecord($data);
        break;

        case 'enable':
          $this->enableRecord($data);
        break;

        case 'disable':
          $this->disableRecord($data);
        break;

        case 'updateDescription':
          $this->updateDescription($data);
        break;

        case 'delete':
          $this->deleteRecord($data);
        break;
      }
    }

    // Checks if a record exists, if no, then display a SOA creation wizard
    if(count($this->view->records) == 0)
    {
      $this->view->form=new CreateSOAForm();
    }
    else
    {
      // Count Nameserver (at least 2 needed!)
      $ns=0;
      // Count Mailserver (at least 1 needed!)
      $mx=0;
      foreach($this->view->records as $record)
      {
        if($record->type=="NS")
        {
          $ns++;
        }
        if($record->type=="MX")
        {
          $mx++;
        }
        $data[$record->id]=new CreateRecordForm($record);
      }
      if($ns<2)
      {
        $this->flash->error('Please add at least two NS Records. These Records points to the nameservers. And required for reachability of the domain.');
        echo '<script>var nserror=true;</script>';
      }
      if($mx<1)
      {
        $this->flash->notice('Atleast one MX Record pointing to your mailserver is required for recieving mails.');
        echo '<button type="button" class="form-control btn btn-primary" data-toggle="modal" data-target="#mxserverModal"><i class="fas fa-plus"></i> Create MX Record Now</button>';
      }
      $this->view->form=$data;
    }
    // Shows general new record creation form
    $this->view->soaform=new CreateSOAForm();
    $this->view->newform=new CreateRecordForm(null,true);
    // Shows Nameserver Select for Modal
    $this->view->nameserverform=new NameserverSelectForm();
    $this->view->mxserverform=new CreateMXForm();
    $this->view->descriptionform=new EditDomainDescriptionForm($this->view->domain);
  }

  private function updateDescription($data)
  {
    $this->view->domain->description=$data["description"];
    if ($this->view->domain->save() === false) {
      $this->flash->error('Domain updated.');
      $messages = $this->view->domain->getMessages();
      foreach ($messages as $message) {
        $this->flash->error($message);
      }
    } else {
      $changelog = new Changelog();
      $changelog->type="UPDATED";
      $changelog->data=json_encode($this->view->domain);
      $changelog->uid=$this->view->identity["id"];
      $changelog->save();
      $this->flash->success('Domain updated.');
    }
  }

  private function createSOARecord($data)
  {
    // Add Type
    $ndata["type"]=$data["type"];
    // Add TTL
    $ndata["ttl"]=$data["ttl"];
    // Prepare Email for insertion into content
    $data["email"]=str_replace("@",".",$data["email"]);
    // Prepare Serial Number
    $serial=date("Ymd")."00";
    // Insert everything in a valid SOA Record
    $ndata["content"]=$data["nameserver"]." ".$data["email"]." ".$serial." ".$data["refresh"]." ".$data["retry"]." ".$data["expire"]." ".$data["ttl"];
    // Create SOA Record with valid data
    $this->createRecord($ndata);
  }

  private function enableRecord($data)
  {
    $data["disabled"]="0";
    $this->createRecord($data);
  }

  private function disableRecord($data)
  {
    $data["disabled"]="1";
    $this->createRecord($data);
  }

  private function deleteRecord($data)
  {
    $record = new Records($data);
    if ($record->delete() === false) {
      $this->flash->error('Record could not be deleted.');
      $messages = $record->getMessages();
      foreach ($messages as $message) {
        $this->flash->warning($message);
      }
    } else {
      $changelog = new Changelog();
      $changelog->type="PURGED";
      $changelog->data=json_encode($record);
      $changelog->uid=$this->view->identity["id"];
      $changelog->save();
      // Record was added
      $this->flash->success('Record deleted.');
      // Update Records
      $this->view->records=Records::find('domain_id = '.$this->view->domain->id);
    }
  }

  private function createRecord($data)
  {
    // Init Record Model whith given data
    $record = new Records($data);
    // If Record ID Exists (it exists in the update of one record)
    if(!empty($data["id"]))
    {
      $record->id=$data["id"];
    }
    // Adds the domain_id
    $record->domain_id=$this->view->domain->id;
    // Check if name is empty, if yes, then use the default domain name
    if(empty($data["name"]))
    {
      $data["name"]=$this->view->domain->name;
    }
    elseif($data["name"]==$this->view->domain->name)
    {
      $data["name"]=$this->view->domain->name;
    }
    else
    {
      // Dirty Hack. Replaces the Domain Name with nothing in the name
      $data["name"]=str_replace(".".$this->view->domain->name,"",$data["name"]);

      // And now we adding it again. It is weird but working.
      $data["name"]=$data["name"].".".$this->view->domain->name;
    }
    // Uses the given name
    $record->name=$data["name"];
    // Adds the change_date as current UTC timestamp
    date_default_timezone_set("UTC");
    $record->change_date=time();
    // Authentication: Yes please
    $record->auth=1;
    // Adds the Record Type
    $record->type=$data["type"];
    // Adds the TTL of a Record
    $record->ttl=$data["ttl"];
    // If a record is not disabled or enabled, enable the record
    if(empty($data["disabled"]))
    {
      // This happens only on creation
      $record->disabled=0;
    }
    else
    {
      // Otherwise just add the given data.
      // This happens only on update
      $record->disabled=$data["disabled"];
    }
    // Adds the given content
    $record->content=$data["content"];
    // Creates the Form for validation
    $this->view->form=new CreateRecordForm($record);
    // Check if form is valid, aka if everything is okay (filter and so on)
    if($this->view->form->isValid($data) == false)
    {
      // Ups, something is not valid.
      $this->flash->error('Record is not valid.');
      foreach ($this->view->form->getMessages() as $message) {
        // Displays all Warnings from the validation
        $this->flash->warning($message);
      }
      // And exists the function
      return false;
    }
    // If SOA Record, then check if one is already existing.
    if($record->type=="SOA")
    {
      if(!empty(Records::find('name = "'.$record->name.'" AND type = "'.$record->type.'"')[0]))
      {
        $this->flash->error('Record already exists.');
        return false;
      }
    }
    // Okay, everything is fine. Now save the object in the database.
    if ($record->save() === false) {
      $this->flash->error('Record could not be stored.');
      $messages = $record->getMessages();
      foreach ($messages as $message) {
        $this->flash->warning($message);
      }
    } else {
      $changelog = new Changelog();
      $changelog->type="EDITED";
      $changelog->data=json_encode($record);
      $changelog->uid=$this->view->identity["id"];
      $changelog->save();
      // Record was added
      $this->flash->success('Record created/updated.');
      // Update Records
      $this->view->records=Records::find('domain_id = '.$this->view->domain->id);
    }

  }

  /**
  * Delete Domain
  */
  public function deleteAction($id)
  {
    
  }

  /**
  * Administrate Home
  */
  public function administrateAction()
  {

  }

  /**
  * Administrate Nameservers
  */
  public function administrateNSAction()
  {
    $this->view->form = new CreateNameserverForm();
    if($this->request->isPost())
    {
      $data=$this->request->getPost();
      switch($data["action"])
      {
        case 'create':
          if($this->view->form->isValid($data) == false)
          {
            // Ups, something is not valid.
            $this->flash->error('Nameserver is not valid.');
            foreach ($this->view->form->getMessages() as $message) {
              // Displays all Warnings from the validation
              $this->flash->warning($message);
            }
          }
          else
          {
            $nameserver = new Nameserver($data);
            if ($nameserver->save() === false) {
              $this->flash->error('Nameserver could not be stored.');
              $messages = $nameserver->getMessages();
              foreach ($messages as $message) {
                $this->flash->warning($message);
              }
            } else {
              // Record was added
              $this->flash->success('Nameserver created.');
            }
          }
        break;

        case 'delete':
          $nameserver = Nameserver::find($data["id"]);
          if ($nameserver->delete() === false) {
            $this->flash->error('Nameserver could not be beleted.');
            $messages = $nameserver->getMessages();
            foreach ($messages as $message) {
              $this->flash->warning($message);
            }
          } else {
            // Record was added
            $this->flash->success('Nameserver deleted.');
          }
        break;
      }
    }
    $this->view->nameservers = Nameserver::find();
  }
  /**
  * Administrate Top Level Domains
  */
  public function administrateTLDAction()
  {
    $this->view->form = new CreateTLDForm();
    if($this->request->isPost())
    {
      $data=$this->request->getPost();
      switch($data["action"])
      {
        case 'create':
          if($this->view->form->isValid($data) == false)
          {
            // Ups, something is not valid.
            $this->flash->error('TLD is not valid.');
            foreach ($this->view->form->getMessages() as $message) {
              // Displays all Warnings from the validation
              $this->flash->warning($message);
            }
          }
          else
          {
            $topdomain = new TopDomains($data);
            if ($topdomain->save() === false) {
              $this->flash->error('TLD could not be stored.');
              $messages = $topdomain->getMessages();
              foreach ($messages as $message) {
                $this->flash->warning($message);
              }
            } else {
              // Record was added
              $this->flash->success('TLD created.');
            }
          }
        break;

        case 'delete':
          $nameserver = Nameserver::find($data["id"]);
          if ($nameserver->delete() === false) {
            $this->flash->error('Nameserver could not be beleted.');
            $messages = $nameserver->getMessages();
            foreach ($messages as $message) {
              $this->flash->warning($message);
            }
          } else {
            // Record was added
            $this->flash->success('Nameserver deleted.');
          }
        break;
      }
    }
    $this->view->tlds = TopDomains::find();
  }
  /**
  * Administrate Type
  */
  public function administrateTypeAction()
  {
    $this->view->form = new CreateRecordTypeForm();
    if($this->request->isPost())
    {
      $data=$this->request->getPost();
      switch($data["action"])
      {
        case 'create':
          if($this->view->form->isValid($data) == false)
          {
            // Ups, something is not valid.
            $this->flash->error('Record Type is not valid.');
            foreach ($this->view->form->getMessages() as $message) {
              // Displays all Warnings from the validation
              $this->flash->warning($message);
            }
          }
          else
          {
            $recordtype = new RecordTypes($data);
            if ($recordtype->save() === false) {
              $this->flash->error('Record Type could not be stored.');
              $messages = $recordtype->getMessages();
              foreach ($messages as $message) {
                $this->flash->warning($message);
              }
            } else {
              // Record was added
              $this->flash->success('Record Type created.');
            }
          }
        break;

        case 'delete':
          $recordtype = RecordTypes::find($data["id"]);
          if ($recordtype->delete() === false) {
            $this->flash->error('Record Type could not be beleted.');
            $messages = $recordtype->getMessages();
            foreach ($messages as $message) {
              $this->flash->warning($message);
            }
          } else {
            // Record was added
            $this->flash->success('Record Type deleted.');
          }
        break;
      }
    }
    $this->view->types = RecordTypes::find();
  }
  /**
  * Administrate Recursor
  */
  public function administrateRecursorAction()
  {
    $this->view->form = new CreateRecursorForm();
    if($this->request->isPost())
    {
      $data=$this->request->getPost();
      switch($data["action"])
      {
        case 'create':
          if($this->view->form->isValid($data) == false)
          {
            // Ups, something is not valid.
            $this->flash->error('Recursor is not valid.');
            foreach ($this->view->form->getMessages() as $message) {
              // Displays all Warnings from the validation
              $this->flash->warning($message);
            }
          }
          else
          {
            $recursor = new Recursor($data);
            if ($recursor->save() === false) {
              $this->flash->error('Recursor could not be stored.');
              $messages = $recursor->getMessages();
              foreach ($messages as $message) {
                $this->flash->warning($message);
              }
            } else {
              // Record was added
              $this->flash->success('Recursor created.');
            }
          }
        break;

        case 'delete':
          $recursor = Recursor::find($data["id"]);
          if ($recursor->delete() === false) {
            $this->flash->error('Recursor could not be beleted.');
            $messages = $recursor->getMessages();
            foreach ($messages as $message) {
              $this->flash->warning($message);
            }
          } else {
            // Record was added
            $this->flash->success('Recursor deleted.');
          }
        break;
      }
    }
    $this->view->recursors = Recursor::find();
  }
  /**
  * Administrate ChangeLog
  */
  public function administrateChangelogAction()
  {
    $this->view->changelog=Changelog::find();
  }
}
