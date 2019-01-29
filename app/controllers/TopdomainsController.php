<?php
namespace kDNS\Controllers;


// Models
use kDNS\Models\TopDomains;
use kDNS\Models\Changelog;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

// GUI Forms
use kDNS\Forms\TopDomainForm;

// Other Stuff
use Phalcon\Filter;

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
    $filter = new Filter();
    if(empty($this->request->get("page")))
    {
      $currentPage = 0;
    }
    else
    {
      $currentPage = (int) $this->request->get("page");
    }
    $cache_key="topdomains_get.cache";
    $topdomains=$this->cache->get($cache_key);
    if($topdomains===null)
    {
      $topdomains = TopDomains::find();
      $this->cache->save($cache_key,$topdomains);
    }
    $paginator=new PaginatorModel(
      [
        "data"  => $topdomains,
        "limit" => 10,
        "page"  => $currentPage,
      ]
    );
    $this->view->topdomains=$paginator->getPaginate();
  }

  public function createAction()
  {
    $filter = new Filter();
    $this->view->topdomainform=new TopDomainForm($this->view->topdomain);
    if($this->request->isPost())
    {
      if($this->view->topdomainform->isValid($this->request->getPost())==false)
      {
        $this->flash->error('Couln\'t save top level domain.');
        foreach ($this->view->topdomainform->getMessages() as $message) {
          $this->flash->error($message);
        }
        return ;
      }
      $topdomain =new TopDomains();
      if(!empty($filter->sanitize($this->request->get("name"),"string")))
      {
        $topdomain->name=$filter->sanitize($this->request->get("name"),"string");
      }
      if(!empty($filter->sanitize($this->request->get("description"),"string")))
      {
        $topdomain->description=$filter->sanitize($this->request->get("description"),"string");
      }
      if(!empty($filter->sanitize($this->request->get("domain"),"string")))
      {
        $topdomain->domain=$filter->sanitize($this->request->get("domain"),"string");
      }
      if ($topdomain->create() === false) {
        $this->flash->error('Top Level Domain couldn\'t be saved.');
        $messages = $topdomain->getMessages();
        foreach ($messages as $message) {
          $this->flash->warning($message);
        }
      } else {
        // Clear Cache
        $this->cache->save("topdomains_get.cache",null);
        $changelog = new Changelog();
        $changelog->type="UPDATED";
        $changelog->data=json_encode($topdomain);
        $changelog->uid=$this->view->identity["id"];
        $changelog->save();
        // Record was added
        $this->flash->success('Top Level Domain created.');
      }
      return $this->dispatcher->forward([
        'action' => 'edit',
        'params' => [$topdomain->id]
      ]);
    }
  }

  public function deleteAction($id=null)
  {
    $filter = new Filter();
    if($id==null)
    {
      $this->flash->error('Couln\'t find top level domain.');
      return $this->dispatcher->forward([
        'controller' => 'topdomains',
        'action' => 'index'
      ]);
    }
    $cache_key="topdomains_get_".$id.".cache";
    $topdomain=$this->cache->get($cache_key);
    if($topdomain===null)
    {
      $topdomain = TopDomains::findFirst($id);
      $this->cache->save($cache_key,$topdomain);
    }
    if($this->request->isPost())
    {
      if ($topdomain->delete() === false) {
        $this->flash->error('Top Level Domain could not be deleted.');
        $messages = $topdomain->getMessages();
        foreach ($messages as $message) {
          $this->flash->warning($message);
        }
      } else {
        // Clear Cache
        $this->cache->save($cache_key,null);
        $this->cache->save("topdomains_get.cache",null);
        $changelog = new Changelog();
        $changelog->type="DELETE";
        $changelog->data=json_encode($topdomain);
        $changelog->uid=$this->view->identity["id"];
        $changelog->save();
        $this->flash->success('Top Level Domain deleted.');
        return $this->dispatcher->forward([
          "action" => "index"
        ]);
      }
    }
    $this->view->topdomain=$topdomain;
  }

  public function updateAction()
  {
  }

  public function editAction($id=null)
  {
    if($id==null)
    {
      $this->flash->error('Couln\'t find top level domain.');
      return $this->dispatcher->forward([
        'controller' => 'topdomains',
        'action' => 'index'
      ]);
    }
    $cache_key="topdomains_get_".$id.".cache";
    $this->view->topdomain=$this->cache->get($cache_key);
    if($this->view->topdomain===null)
    {
      $this->view->topdomain = TopDomains::findFirst($id);
      $this->cache->save($cache_key,$this->view->topdomain);
    }
    $this->view->topdomainform=new TopDomainForm($this->view->topdomain);
  }
}
