<?php
namespace kDNS\Controllers;

// Models
use kDNS\Models\Nameserver;
use kDNS\Models\Changelog;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

// GUI Forms
use kDNS\Forms\NameserverForm;

// Other Stuff
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
    $filter = new Filter();
    $this->view->nameserverform=new NameserverForm();
    if($this->request->isPost())
    {
      if($this->view->nameserverform->isValid($this->request->getPost())==false)
      {
        $this->flash->error('Couln\'t save nameserver.');
        foreach ($this->view->nameserverform->getMessages() as $message) {
          $this->flash->error($message);
        }
        return ;
      }
      $nameserver=new Nameserver();
      if(!empty($filter->sanitize($this->request->get("name"),"string")))
      {
        $nameserver->name=$filter->sanitize($this->request->get("name"),"string");
      }
      if(!empty($filter->sanitize($this->request->get("fqdn"),"string")))
      {
        $nameserver->fqdn=$filter->sanitize($this->request->get("fqdn"),"string");
      }
      if(!empty($filter->sanitize($this->request->get("ip4"),"string")))
      {
        $nameserver->ip4=$filter->sanitize($this->request->get("ip4"),"string");
      }
      if(!empty($filter->sanitize($this->request->get("ip6"),"string")))
      {
        $nameserver->ip6=$filter->sanitize($this->request->get("ip6"),"string");
      }
      if(!empty($filter->sanitize($this->request->get("description"),"string")))
      {
        $nameserver->description=$filter->sanitize($this->request->get("description"),"string");
      }
      if(!empty($filter->sanitize($this->request->get("topdomains"),"string")))
      {
        $nameserver->topdomains=json_encode($filter->sanitize($this->request->get("topdomains"),"string"));
      }
      if(!empty($filter->sanitize($this->request->get("type"),"string")))
      {
        $nameserver->type=$filter->sanitize($this->request->get("type"),"string");
      }
      if ($nameserver->create() === false) {
        $this->flash->error('Nameserver couldn\'t be saved.');
        $messages = $nameserver->getMessages();
        foreach ($messages as $message) {
          $this->flash->warning($message);
        }
      } else {
        // Clear Cache
        $this->cache->save("nameserver_get.cache",null);
        $changelog = new Changelog();
        $changelog->type="UPDATED";
        $changelog->data=json_encode($nameserver);
        $changelog->uid=$this->view->identity["id"];
        $changelog->save();
        // Record was added
        $this->flash->success('Nameserver created.');
      }
      return $this->dispatcher->forward([
        'action' => 'edit',
        'params' => [$nameserver->id]
      ]);
    }
  }

  public function deleteAction($id=null)
  {
    $filter = new Filter();
    if($id==null)
    {
      $this->flash->error('Couln\'t find nameserver.');
      return $this->dispatcher->forward([
        'controller' => 'nameserver',
        'action' => 'index'
      ]);
    }
    $cache_key="nameserver_get_".$id.".cache";
    $nameserver=$this->cache->get($cache_key);
    if($nameserver===null)
    {
      $nameserver = Nameserver::findFirst($id);
      $this->cache->save($cache_key,$nameserver);
    }
    if($this->request->isPost())
    {
      if ($nameserver->delete() === false) {
        $this->flash->error('Nameserver could not be deleted.');
        $messages = $nameserver->getMessages();
        foreach ($messages as $message) {
          $this->flash->warning($message);
        }
      } else {
        // Clear Cache
        $this->cache->save($cache_key,null);
        $this->cache->save("nameserver_get.cache",null);
        $changelog = new Changelog();
        $changelog->type="DELETE";
        $changelog->data=json_encode($nameserver);
        $changelog->uid=$this->view->identity["id"];
        $changelog->save();
        $this->flash->success('Nameserver deleted.');
        return $this->dispatcher->forward([
          "action" => "index"
        ]);
      }
    }
    $this->view->nameserver=$nameserver;
  }

  public function updateAction($id=null)
  {
    $filter = new Filter();
    if($id==null)
    {
      $this->flash->error('Couln\'t find nameserver.');
      return $this->dispatcher->forward([
        'controller' => 'nameserver',
        'action' => 'index'
      ]);
    }
    if(!$this->request->isPost())
    {
      return $this->dispatcher->forward([
        'action' => 'edit',
        'params' => [$id]
      ]);
    }
    $cache_key="nameserver_get_".$id.".cache";
    $nameserver=$this->cache->get($cache_key);
    if($nameserver===null)
    {
      $nameserver = Nameserver::findFirst($id);
      $this->cache->save($cache_key,$nameserver);
    }
    if(!empty($filter->sanitize($this->request->get("name"),"string")))
    {
      $nameserver->name=$filter->sanitize($this->request->get("name"),"string");
    }
    if(!empty($filter->sanitize($this->request->get("fqdn"),"string")))
    {
      $nameserver->fqdn=$filter->sanitize($this->request->get("fqdn"),"string");
    }
    if(!empty($filter->sanitize($this->request->get("ip4"),"string")))
    {
      $nameserver->ip4=$filter->sanitize($this->request->get("ip4"),"string");
    }
    if(!empty($filter->sanitize($this->request->get("ip6"),"string")))
    {
      $nameserver->ip6=$filter->sanitize($this->request->get("ip6"),"string");
    }
    if(!empty($filter->sanitize($this->request->get("description"),"string")))
    {
      $nameserver->description=$filter->sanitize($this->request->get("description"),"string");
    }
    if(!empty($this->request->get("topdomains")))
    {
      $nameserver->topdomains=json_encode($this->request->get("topdomains"));
    }
    if(!empty($filter->sanitize($this->request->get("type"),"string")))
    {
      $nameserver->type=$filter->sanitize($this->request->get("type"),"string");
    }
    if ($nameserver->save() === false) {
      $this->flash->error('Nameserver could not be updated.');
      $messages = $nameserver->getMessages();
      foreach ($messages as $message) {
        $this->flash->warning($message);
      }
    } else {
      // Clear Cache
      $this->cache->save($cache_key,null);
      $this->cache->save("nameserver_get.cache",null);
      $changelog = new Changelog();
      $changelog->type="UPDATED";
      $changelog->data=json_encode($nameserver);
      $changelog->uid=$this->view->identity["id"];
      $changelog->save();
      // Record was added
      $this->flash->success('Nameserver updated.');
    }
    return $this->dispatcher->forward([
      'action' => 'edit',
      'params' => [$id]
    ]);
  }

  public function editAction($id=null)
  {
    if($id==null)
    {
      $this->flash->error('Couln\'t find nameserver.');
      return $this->dispatcher->forward([
        'controller' => 'nameserver',
        'action' => 'index'
      ]);
    }
    $cache_key="nameserver_get_".$id.".cache";
    $this->view->nameserver=$this->cache->get($cache_key);
    if($this->view->nameserver===null)
    {
      $this->view->nameserver = Nameserver::findFirst($id);
      $this->cache->save($cache_key,$this->view->nameserver);
    }
    $this->view->nameserverform=new NameserverForm($this->view->nameserver);
  }
}
