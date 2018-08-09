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
      var_dump($this->request->getPost());
      $domain = new Domains();
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
