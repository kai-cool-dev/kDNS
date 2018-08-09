<?php
namespace kDNS\Controllers;

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
}
