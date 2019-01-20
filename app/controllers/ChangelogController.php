<?php

namespace kDNS\Controllers;

// Models
use kDNS\Models\Changelog;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class ChangelogController extends ControllerBase
{
  public function initialize()
  {
    $this->view->setVar('logged_in', is_array($this->auth->getIdentity()));
    $this->view->setTemplateBefore('private');
    $this->view->setVar('identity', $this->auth->getIdentity());
  }

  public function indexAction()
  {
    if(empty($this->request->get("page")))
    {
      $currentPage = 0;
    }
    else
    {
      $currentPage = (int) $this->request->get("page");
    }
    $changelog = Changelog::find();
    $paginator=new PaginatorModel(
      [
        "data"  => $changelog,
        "limit" => 10,
        "page"  => $currentPage
      ]
    );
    $this->view->changelogs=$paginator->getPaginate();
  }

  public function showAction($id=null)
  {
    if($id==null)
    {
      $this->flash->error('Couln\'t find changelog.');
      return $this->dispatcher->forward([
        'controller' => 'changelog',
        'action' => 'index'
      ]);
    }
    $this->view->changelog=Changelog::findFirst($id);
    if($this->view->changelog===false)
    {
      $this->flash->error('Couln\'t find changelog.');
      return $this->dispatcher->forward([
        'controller' => 'changelog',
        'action' => 'index'
      ]);
    }
    var_dump($this->view->changelog);
  }
}
