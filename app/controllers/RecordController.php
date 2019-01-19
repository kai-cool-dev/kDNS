<?php
namespace kDNS\Controllers;

// Models
use kDNS\Models\Domains;
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
    $filter = new Filter();
    if(empty($this->request->get("page")))
    {
      $currentPage = 0;
    }
    else
    {
      $currentPage = (int) $this->request->get("page");
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
          $this->flash->error('Sorry you are not allowed to access this domain.');
          return $this->dispatcher->forward([
            'controller' => 'domain',
            'action' => 'index'
          ]);
        }
      }
    }
    $paginator=new PaginatorModel(
      [
        "data"  => $this->view->domain->records(),
        "limit" => 10,
        "page"  => $currentPage,
      ]
    );
    $this->view->records=$paginator->getPaginate();
  }

  private function enableAction($data)
  {
  }

  public function disableAction($data)
  {
  }

  public function createAction($data)
  {
  }

  public function deleteAction($data)
  {
  }
}
