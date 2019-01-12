<?php

namespace kDNS\Controllers;

// Models
use kDNS\Models\Domains;
use kDNS\Models\Changelog;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

// GUI Forms
use kDNS\Forms\CreateDomainForm;
use kDNS\Forms\EditDomainDescriptionForm;
use kDNS\Forms\SearchTLDForm;
use kDNS\Forms\CreateTLDForm;

// Other Stuff
use Phalcon\Filter;


class DomainController extends ControllerBase
{
  public function initialize()
  {
    $this->view->setVar('logged_in', is_array($this->auth->getIdentity()));
    $this->view->setTemplateBefore('private');
  }
  /**
  * List Domains
  */
  public function indexAction()
  {

  }
  
  /**
  * Edit Domain Page
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
    $this->view->descriptionform=new EditDomainDescriptionForm($this->view->domain);
  }

  /**
  * Updates Description for Domain
  */
  private function updateDescriptionAction($id)
  {
    $this->view->domain=Domains::findFirst($id);
    $data=$this->request->getPost();
    $this->view->domain->description=$data["description"];
    if ($this->view->domain->save() === false) {
      $this->flash->error('Domain not updated.');
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
    return $this->dispatcher->forward([
        'action' => 'edit',
        'params' => [$id]
    ]);
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
      if($data["description"])
      {
        $domain->description=$data["description"];
      }
      if($data["id"])
      {
        $domain->id=$data["id"];
      }
      if ($domain->save() === false) {
        $this->flash->error('Domain could not be stored.');
        $messages = $domain->getMessages();
        foreach ($messages as $message) {
          $this->flash->error($message);
        }
      } else {
        $this->flash->success('Domain created.');
        $changelog = new Changelog();
        $changelog->type="CREATE";
        $changelog->data=json_encode($domain);
        $changelog->uid=$this->view->identity["id"];
        $changelog->save();
        return $this->dispatcher->forward([
            'action' => 'edit',
            'params' => [$domain->id]
        ]);
      }
    }
  }

  /**
  * Delete Domain
  */
  public function deleteAction()
  {

  }
}
