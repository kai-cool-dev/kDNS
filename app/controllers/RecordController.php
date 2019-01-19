<?php
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
use kDNS\Forms\CreateRecordForm;
use kDNS\Forms\CreateSOAForm;
use kDNS\Forms\NameserverSelectForm;
use kDNS\Forms\CreateMXForm;

// Other Stuff
use Phalcon\Filter;

/**
 * Display the default index page.
 */
class RecordController extends ControllerBase
{
  /**
  * Default action. Set the private layout (layouts/private.volt)
  */
  public function initialize()
  {
    $this->view->setVar('logged_in', is_array($this->auth->getIdentity()));
    $this->view->setTemplateBefore('private');
    $this->view->identity=$this->auth->getIdentity();
  }

  /**
  * Displays Index Page
  */
  public function indexAction($id=null)
  {
    if($id==null)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
    $this->view->domain=Domains::findFirst($id);
    if($this->auth->getIdentity()["profile"] == "Administrators")
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
        if($this->view->domain->account != $this->auth->getIdentity()["id"])
        {
          $this->flash->notice('You don\'t have access to this module: private');
          return $this->dispatcher->forward([
            'controller' => 'domain',
            'action' => 'index'
          ]);
        }
      }
    }

    var_dump($this->view->domain);

    $this->view->records=Records::find('domain_id = '.$this->view->domain->id);

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
  }

  private function enableRecord($data)
  {
    $data["disabled"]="0";
    $this->createRecord($data);
  }

  public function disableAction($data)
  {
    $data["disabled"]="1";
    $this->createRecord($data);
  }

  public function deleteAction($data)
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

  public function createAction($data)
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
}
