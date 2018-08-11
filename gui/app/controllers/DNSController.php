<?php
/* TODO:

- Add search for own domains
  - Add function for admin to show "admin-mode"-domains

- DNS Edit Page:
  - Add domain_description (used in whois)

*/
namespace kDNS\Controllers;

// Models
use kDNS\Models\Domains;
use kDNS\Models\Records;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

// GUI Forms
use kDNS\Forms\CreateDomainForm;
use kDNS\Forms\CreateRecordForm;
use kDNS\Forms\CreateSOAForm;
use kDNS\Forms\NameserverSelectForm;
use kDNS\Forms\CreateMXForm;
use kDNS\Forms\SearchDomainForm;

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
  * Displays Search Page
  */
  public function searchAction()
  {
    $filter = new Filter();
    if(empty($_GET["page"]))
    {
      $currentPage = 0;
    }
    else
    {
      $currentPage = (int) $_GET["page"];
    }
    // SQL Building 101
    if($this->view->identity["profile"] == "Administrators")
    {
      // Admin
      $sql="account";
    }
    else
    {
      // Normal User
      $sql="account = ".$this->view->identity["id"];
    }
    if(!empty($this->request->get("name")))
    {
      $sql=$sql.' AND name LIKE "%'.$filter->sanitize($this->request->get("name"),"string").'%"';
    }
    $domains = Domains::find([$sql]);
    $paginator = new PaginatorModel(
      [
        "data"  => $domains,
        "limit" => 10,
        "page"  => $currentPage,
      ]
    );
    $this->view->domains = $paginator->getPaginate();
    $this->view->form = new SearchDomainForm();
    $this->view->name=$filter->sanitize($this->request->get("name"),"string");
  }

  /**
  * Create new Domain
  */
  public function createAction()
  {
    $this->view->form=new CreateDomainForm();
    if($this->request->isPost())
    {
      $data=$this->request->getPost();
      $domain_name=$data["name"].".".$data["tld"];
      if($this->view->form->isValid($this->request->getPost()) == false)
      {
        $this->flash->error('Domain could not be stored.');
        foreach ($this->view->form->getMessages() as $message) {
            $this->flash->error($message);
        }
        return ;
      }
      if(!empty(Domains::find('name = "'.$domain_name.'"')[0]))
      {
        $this->flash->error('Domain already exists.');
        return ;
      }
      $domain = new Domains();
      $domain->name=$domain_name;
      $domain->type="NATIVE";
      $domain->account=$this->view->identity["id"];
      $domain->created=time();
      if ($domain->create() === false) {
        $this->flash->error('Domain could not be stored.');
        $messages = $domain->getMessages();
        foreach ($messages as $message) {
          $this->flash->error($message);
        }
      } else {
        $this->flash->success('Domain created.');
        return $this->dispatcher->forward([
            'action' => 'index'
        ]);
      }
    }
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

        case 'update':
          $this->createRecord($data);
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
      }
      if($mx<1)
      {
        $this->flash->notice('Atleast one MX Record pointing to your mailserver is required for recieving mails.');
      }
      $this->view->form=$data;
    }
    // Shows general new record creation form
    $this->view->newform=new CreateRecordForm(null,true);
    // Shows Nameserver Select for Modal
    $this->view->nameserverform=new NameserverSelectForm();
    $this->view->mxserverform=new CreateMXForm();
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
      // Record was added
      $this->flash->success('Record created/updated.');
      // Update Records
      $this->view->records=Records::find('domain_id = '.$this->view->domain->id);
    }

  }

  /**
  * Delete Domain
  */
  public function deleteAction()
  {

  }

  /**
  * Administrate DNS
  */
  public function administrateAction()
  {

  }
}
