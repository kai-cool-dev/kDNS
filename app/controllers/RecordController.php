<?php
namespace kDNS\Controllers;

// Models
use kDNS\Models\Domains;
use kDNS\Models\Records;
use kDNS\Models\Nameserver;
use kDNS\Models\TopDomains;
use kDNS\Models\Changelog;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

// GUI Forms
use kDNS\Forms\CreateRecordForm;

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
    $filter = new Filter();
    if($id==null)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
    if(empty($this->request->get("page")))
    {
      $currentPage = 0;
    }
    else
    {
      $currentPage = (int) $this->request->get("page");
    }
    $cache_key="domain_get_".$id.".cache";
    $this->view->domain=$this->cache->get($cache_key);
    if($this->view->domain===null)
    {
      $this->view->domain = Domains::findFirst($id);
      $this->cache->save($cache_key,$this->view->domain);
    }
    if($this->view->domain===false)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
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
    $this->view->new_record=new CreateRecordForm(null,true);
  }

  public function disableAction($domain_id=null,$record_id=null)
  {
    if($domain_id==null)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
    $cache_key="domain_get_".$domain_id.".cache";
    $this->view->domain=$this->cache->get($cache_key);
    if($this->view->domain===null)
    {
      $this->view->domain = Domains::findFirst($domain_id);
      $this->cache->save($cache_key,$this->view->domain);
    }
    if($domain===false)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
    if($this->auth->getIdentity()["profile"] != "Administrators")
    {
      if($domain->account != "0")
      {
        if($domain->account != $this->auth->getIdentity()["id"])
        {
          $this->flash->error('Sorry you are not allowed to access this domain.');
          return $this->dispatcher->forward([
            'controller' => 'domain',
            'action' => 'index'
          ]);
        }
      }
    }
    if($record_id==null)
    {
      $this->flash->error('Couln\'t find record.');
      return $this->dispatcher->forward([
        'controller' => 'record',
        'action' => 'index',
        'params' => [$domain_id]
      ]);
    }
    $record=Records::findFirst($record_id);
    if($record===false)
    {
      $this->flash->error('Couln\'t find record.');
      return $this->dispatcher->forward([
        'controller' => 'record',
        'action' => 'index',
        'params' => [$domain_id]
      ]);
    }
    if($record->disabled==0)
    {
      $record->disabled=1;
    }
    else
    {
      $record->disabled=0;
    }
    if ($record->save() === false) {
      $this->flash->error('Record could not be updated.');
      $messages = $record->getMessages();
      foreach ($messages as $message) {
        $this->flash->warning($message);
      }
    } else {
      $this->cache->save($cache_key,null);
      $changelog = new Changelog();
      $changelog->type="DISABLE";
      $changelog->data=json_encode($record);
      $changelog->uid=$this->view->identity["id"];
      $changelog->save();
      // Record was added
      $this->flash->success('Record updated.');
    }
    return $this->dispatcher->forward([
      'controller' => 'record',
      'action' => 'index',
      'params' => [$domain_id]
    ]);
  }

  public function createAction($id=null)
  {
    $filter = new Filter();
    if($id==null)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
    $cache_key="domain_get_".$id.".cache";
    $domain=$this->cache->get($cache_key);
    if($domain===null)
    {
      $domain = Domains::findFirst($id);
      $this->cache->save($cache_key,$domain);
    }
    if($domain===false)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
    if($this->auth->getIdentity()["profile"] != "Administrators")
    {
      if($domain->account != "0")
      {
        if($domain->account != $this->auth->getIdentity()["id"])
        {
          $this->flash->error('Sorry you are not allowed to access this domain.');
          return $this->dispatcher->forward([
            'controller' => 'domain',
            'action' => 'index'
          ]);
        }
      }
    }
    if(!$this->request->isPost())
    {
      return $this->dispatcher->forward([
        'action' => 'index',
        'params' => [$id]
      ]);
    }
    $record_data=array(
      "domain_id" => $domain->id,
      "name" => $domain->name,
      "type" => $filter->sanitize($this->request->get("type"),"string"),
      "content" => $filter->sanitize($this->request->get("content"),"string"),
      "ttl" => 3600,
      "prio" => 0,
      "change_date" => time(),
      "disabled" => 0,
      "auth" => 1
    );
    if(!empty($filter->sanitize($this->request->get("name"),"string")))
    {
      $record_data["name"]=str_replace($domain->name,"",$filter->sanitize($this->request->get("name"),"string")).".".$domain->name;
    }
    if(!empty($filter->sanitize($this->request->get("ttl"),"int")))
    {
      $record_data["ttl"]=$filter->sanitize($this->request->get("ttl"),"int");
    }
    if(!empty($filter->sanitize($this->request->get("prio"),"int")))
    {
      $record_data["prio"]=$filter->sanitize($this->request->get("prio"),"int");
    }
    $record=new Records($record_data);
    if ($record->save() === false) {
      $this->flash->error('Record could not be stored.');
      $messages = $record->getMessages();
      foreach ($messages as $message) {
        $this->flash->warning($message);
      }
    } else {
      // Clear Cache
      $this->cache->save($cache_key,null);
      $changelog = new Changelog();
      $changelog->type="EDITED";
      $changelog->data=json_encode($record);
      $changelog->uid=$this->view->identity["id"];
      $changelog->save();
      // Record was added
      $this->flash->success('Record created.');
    }
    return $this->dispatcher->forward([
      'action' => 'index',
      'params' => [$id]
    ]);
  }

  public function updateAction($domain_id=null,$record_id=null)
  {
    $filter = new Filter();
    if($domain_id==null)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
    $cache_key="domain_get_".$domain_id.".cache";
    $domain=$this->cache->get($cache_key);
    if($domain===null)
    {
      $domain = Domains::findFirst($domain_id);
      $this->cache->save($cache_key,$domain);
    }
    if($domain===false)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
    if($this->auth->getIdentity()["profile"] != "Administrators")
    {
      if($domain->account != "0")
      {
        if($domain->account != $this->auth->getIdentity()["id"])
        {
          $this->flash->error('Sorry you are not allowed to access this domain.');
          return $this->dispatcher->forward([
            'controller' => 'domain',
            'action' => 'index'
          ]);
        }
      }
    }
    if(!empty($filter->sanitize($this->request->get("record_id"),"int")))
    {
      $record_id=$filter->sanitize($this->request->get("record_id"),"int");
    }
    if($record_id==null)
    {
      $this->flash->error('Couln\'t find record.');
      return $this->dispatcher->forward([
        'controller' => 'record',
        'action' => 'index',
        'params' => [$domain_id]
      ]);
    }
    $cache_key="record_get_".$record_id.".cache";
    $record=$this->cache->get($cache_key);
    if($record===null)
    {
      $record=Records::findFirst($record_id);
      $this->cache->save($cache_key,$record);
    }
    if($record===false)
    {
      $this->flash->error('Couln\'t find record.');
      return $this->dispatcher->forward([
        'controller' => 'record',
        'action' => 'index',
        'params' => [$domain_id]
      ]);
    }
    if(!empty($filter->sanitize($this->request->get("name"),"string")))
    {
      $record->name=str_replace($domain->name,"",$filter->sanitize($this->request->get("name"),"string")).".".$domain->name;
    }
    if(!empty($filter->sanitize($this->request->get("type"),"string")))
    {
      $record->type=$filter->sanitize($this->request->get("type"),"string");
    }
    if(!empty($filter->sanitize($this->request->get("content"),"string")))
    {
      $record->content=$filter->sanitize($this->request->get("content"),"string");
    }
    if(!empty($filter->sanitize($this->request->get("prio"),"int")))
    {
      $record->prio=$filter->sanitize($this->request->get("prio"),"int");
    }
    if($filter->sanitize($this->request->get("prio"),"int")==0)
    {
      $record->prio=0;
    }
    if(!empty($filter->sanitize($this->request->get("ttl"),"int")))
    {
      $record->ttl=$filter->sanitize($this->request->get("ttl"),"int");
    }
    if ($record->save() === false) {
      $this->flash->error('Record could not be updated.');
      $messages = $record->getMessages();
      foreach ($messages as $message) {
        $this->flash->warning($message);
      }
    } else {
      // Clear Cache
      $this->cache->save($cache_key,null);
      $changelog = new Changelog();
      $changelog->type="UPDATED";
      $changelog->data=json_encode($record);
      $changelog->uid=$this->view->identity["id"];
      $changelog->save();
      // Record was added
      $this->flash->success('Record updated.');
    }
    return $this->dispatcher->forward([
      'action' => 'index',
      'params' => [$domain_id]
    ]);
  }

  public function deleteAction($domain_id=null,$record_id=null)
  {
    if($domain_id==null)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
    $cache_key="domain_get_".$domain_id.".cache";
    $domain=$this->cache->get($cache_key);
    if($domain===null)
    {
      $domain = Domains::findFirst($domain_id);
      $this->cache->save($cache_key,$domain);
    }
    if($domain===false)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
    if($this->auth->getIdentity()["profile"] != "Administrators")
    {
      if($domain->account != "0")
      {
        if($domain->account != $this->auth->getIdentity()["id"])
        {
          $this->flash->error('Sorry you are not allowed to access this domain.');
          return $this->dispatcher->forward([
            'controller' => 'domain',
            'action' => 'index'
          ]);
        }
      }
    }
    if($record_id==null)
    {
      $this->flash->error('Couln\'t find record.');
      return $this->dispatcher->forward([
        'controller' => 'record',
        'action' => 'index',
        'params' => [$domain_id]
      ]);
    }
    $record=Records::findFirst($record_id);
    if($record===false)
    {
      $this->flash->error('Couln\'t find record.');
      return $this->dispatcher->forward([
        'controller' => 'record',
        'action' => 'index',
        'params' => [$domain_id]
      ]);
    }
    if ($record->delete() === false) {
      $this->flash->error('Record could not be deleted.');
      $messages = $record->getMessages();
      foreach ($messages as $message) {
        $this->flash->warning($message);
      }
    } else {
      // Clear Cache
      $this->cache->save($cache_key,null);
      $changelog = new Changelog();
      $changelog->type="PURGED";
      $changelog->data=json_encode($record);
      $changelog->uid=$this->view->identity["id"];
      $changelog->save();
      // Record was added
      $this->flash->success('Record deleted.');
    }
    return $this->dispatcher->forward([
      'controller' => 'record',
      'action' => 'index',
      'params' => [$domain_id]
    ]);
  }
}
