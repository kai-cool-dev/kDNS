<?php
namespace kDNS\Controllers;

use kDNS\Models\Nameserver;

/**
 * Display the "About" page.
 */
class AboutController extends ControllerBase
{
  /**
  * Default action. Set the public layout (layouts/public.volt)
  */
  public function indexAction()
  {
    $this->view->setVar('logged_in', is_array($this->auth->getIdentity()));
    $this->view->setTemplateBefore('public');
  }

  public function serverAction()
  {
    $this->view->setVar('logged_in', is_array($this->auth->getIdentity()));
    $this->view->setTemplateBefore('public');
    $this->view->nameservers=Nameserver::find();
  }
}
