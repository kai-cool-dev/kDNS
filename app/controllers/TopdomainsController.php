<?php
namespace kDNS\Controllers;

class TopdomainsController extends ControllerBase
{
  public function initialize()
  {
    $this->view->setVar('logged_in', is_array($this->auth->getIdentity()));
    $this->view->setTemplateBefore('private');
    $this->view->setVar('identity', $this->auth->getIdentity());
  }

  public function indexAction()
  {
  }

  public function createAction()
  {
  }

  public function deleteAction()
  {
  }

  public function updateAction()
  {
  }

  public function editAction()
  {
  }
}
