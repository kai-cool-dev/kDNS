<?php
namespace kDNS\Controllers;

use kDNS\Models\Nameserver;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

use Phalcon\Filter;

class NameserverController extends ControllerBase
{
  public function initialize()
  {
    $this->view->setVar('logged_in', is_array($this->auth->getIdentity()));
    $this->view->setTemplateBefore('private');
    $this->view->setVar('identity', $this->auth->getIdentity());
  }

  public function indexAction()
  {
    $filter = new Filter();
    if(empty($this->request->get("page")))
    {
      $currentPage = 0;
    }
    else
    {
      $currentPage = (int) $this->request->get("page");
    }
    $cache_key="nameserver_get.cache";
    $nameserver=$this->cache->get($cache_key);
    if($nameserver===null)
    {
      $nameserver = Nameserver::find();
      $this->cache->save($cache_key,$nameserver);
    }
    $paginator=new PaginatorModel(
      [
        "data"  => $nameserver,
        "limit" => 10,
        "page"  => $currentPage
      ]
    );
    $this->view->nameservers=$paginator->getPaginate();
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
