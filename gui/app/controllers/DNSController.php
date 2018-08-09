<?php
namespace kDNS\Controllers;

use kDNS\Models\Domains;
use kDNS\Forms\CreateDomainForm;

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
  public function editAction()
  {

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
