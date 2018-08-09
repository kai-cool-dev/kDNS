<?php
namespace kDNS\Controllers;

use kDNS\Models\Domains;
use kDNS\Models\Records;
use kDNS\Forms\CreateDomainForm;
use kDNS\Forms\CreateRecordForm;
use kDNS\Forms\CreateSOAForm;

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
    $this->view->domains = Domains::find([
      "account = ".$this->view->identity["id"]
    ]);
  }

  /**
  * Displays Search Page
  */
  public function searchAction()
  {

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
            'action' => 'edit',
            'params' => [
              $domain->id
            ]
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
    if(count($this->view->records) == 0)
    {
      $this->view->form=new CreateSOAForm();
    }
    if($this->request->isPost())
    {
      $data=$this->request->getPost();
      switch($data["action"])
      {
        case 'create':
          $this->createRecord($data);
        break;
      }
    }
    $this->view->form=new CreateRecordForm();
  }

  private function createRecord($data)
  {
    $record = new Records();
    $record->domain_id=$this->view->domain->id;
    date_default_timezone_set("UTC");
    $record->change_date=time();
    $record->auth=1;
    $record->type=$data["type"];
    $record->ttl=$data["ttl"];
    if(empty($data["name"]))
    {
      $record->name=$this->view->domain->name;
    }
    else
    {
      $record->name=$data["name"].".".$this->view->domain->name;
    }
    switch($data["type"]) {
      case 'SOA':
        $data["email"]=str_replace("@",".",$data["email"]);
        $serial=date("Ymd")."00";
        $record->content=$data["nameserver"]." ".$data["email"]." ".$serial." ".$data["refresh"]." ".$data["retry"]." ".$data["expire"]." ".$data["ttl"];
        $record->disabled=0;
        $record->prio=0;
      break;
      default:
        $record->content=$data["content"];
      break;
    }
    if(!empty(Records::find('name = "'.$record->name.'" AND type = "'.$record->type.'"')[0]))
    {
      $this->flash->error('Record already exists.');
      return $this->dispatcher->forward([
          'action' => 'index'
      ]);
    }
    if($this->view->form->isValid($this->request->getPost()) == false)
    {
      $this->flash->error('Record could not be stored.');
      foreach ($this->view->form->getMessages() as $message) {
          $this->flash->error($message);
      }
      return $this->dispatcher->forward([
          'action' => 'index'
      ]);
    }
    if ($record->save() === false) {
      $this->flash->error('Record could not be stored.');
      $messages = $record->getMessages();
      foreach ($messages as $message) {
        $this->flash->error($message);
      }
      return $this->dispatcher->forward([
          'action' => 'index'
      ]);
    } else {
      $this->flash->success('Record created.');
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
