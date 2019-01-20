<?php

namespace kDNS\Controllers;

// Models
use kDNS\Models\Domains;
use kDNS\Models\Changelog;
use kDNS\Models\Records;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

// GUI Forms
use kDNS\Forms\CreateDomainForm;
use kDNS\Forms\EditDomainDescriptionForm;
use kDNS\Forms\SearchTLDForm;
use kDNS\Forms\CreateTLDForm;
use kDNS\Forms\SearchDomainForm;
use kDNS\Forms\CreateRecordForm;
use kDNS\Forms\CreateSOAForm;
use kDNS\Forms\NameserverSelectForm;
use kDNS\Forms\CreateMXForm;

// Other Stuff
use Phalcon\Filter;


class DomainController extends ControllerBase
{
  public function initialize()
  {
    $this->view->setVar('logged_in', is_array($this->auth->getIdentity()));
    $this->view->setTemplateBefore('private');
    $this->view->setVar('identity', $this->auth->getIdentity());
  }
  /**
  * List Domains
  */
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
    // SQL Building 101
    if($this->auth->getIdentity()["profile"] == "Administrators")
    {
      // Admin
      $sql="account";
    }
    else
    {
      // Normal User
      $sql="account = ".$this->auth->getIdentity()["id"];
    }
    if(!empty($this->request->get("name")))
    {
      $sql=$sql.' AND name LIKE "%'.$filter->sanitize($this->request->get("name"),"string").'%"';
    }
    $cache_key="domain_get_for_".$this->auth->getIdentity()["id"]."_search_".$filter->sanitize($this->request->get("name"),"string").".cache";
    $domains=$this->cache->get($cache_key);
    if($domains===null)
    {
      $domains = Domains::find([$sql]);
      $this->cache->save($cache_key,$domains);
    }
    $paginator=new PaginatorModel(
      [
        "data"  => $domains,
        "limit" => 10,
        "page"  => $currentPage,
      ]
    );
    $this->view->domains=$paginator->getPaginate();
    $this->view->form = new SearchDomainForm();
    $this->view->name=$filter->sanitize($this->request->get("name"),"string");
  }

  /**
  * Edit Domain Page
  */
  public function editAction($id=null)
  {
    if($id==null)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
    $cache_key="domain_get_".$id.".cache";
    $this->view->domain=$this->cache->get($cache_key);
    if($this->view->domain===null)
    {
      $this->view->domain = Domains::findFirst($id);
      $this->cache->save($cache_key,$this->view->domain);
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
              'action' => 'index'
          ]);
        }
      }
    }
    $this->view->descriptionform=new EditDomainDescriptionForm($this->view->domain);
  }

  /**
  * Updates Description for Domain
  */
  public function updateDescriptionAction($id)
  {
    $this->view->domain=Domains::findFirst($id);
    $data=$this->request->getPost();
    $this->view->domain->description=$data["description"];
    if ($this->view->domain->save() === false) {
      $this->flash->error('Domain not updated.');
      $messages = $this->view->domain->getMessages();
      foreach ($messages as $message) {
        $this->flash->error($message);
      }
    } else {
      $changelog = new Changelog();
      $changelog->type="UPDATED";
      $changelog->data=json_encode($this->view->domain);
      $changelog->uid=$this->view->identity["id"];
      $changelog->save();
      $this->flash->success('Domain updated.');
    }
    return $this->dispatcher->forward([
        'action' => 'edit',
        'params' => [$id]
    ]);
  }

  /**
  * Create new Domain
  */
  public function createAction()
  {
    $this->view->form=new CreateDomainForm();
    if($this->request->isPost())
    {
      $data=$this->request->getPost();
      $domain_name=$data["name"].".".$data["tld"];
      if($this->view->form->isValid($this->request->getPost()) == false)
      {
        $this->flash->error('Domain could not be stored.');
        foreach ($this->view->form->getMessages() as $message) {
            $this->flash->error($message);
        }
        return ;
      }
      if(!empty(Domains::find('name = "'.$domain_name.'"')[0]))
      {
        $this->flash->error('Domain already exists.');
        return ;
      }
      $domain = new Domains();
      $domain->name=$domain_name;
      $domain->type="NATIVE";
      $domain->account=$this->auth->getIdentity()["id"];
      if($data["description"])
      {
        $domain->description=$data["description"];
      }
      if($data["id"])
      {
        $domain->id=$data["id"];
      }
      if ($domain->save() === false) {
        $this->flash->error('Domain could not be stored.');
        $messages = $domain->getMessages();
        foreach ($messages as $message) {
          $this->flash->error($message);
        }
      } else {
        $this->flash->success('Domain created.');
        $changelog = new Changelog();
        $changelog->type="CREATE";
        $changelog->data=json_encode($domain);
        $changelog->uid=$this->auth->getIdentity()["id"];
        $changelog->save();
        return $this->dispatcher->forward([
            'action' => 'edit',
            'params' => [$domain->id]
        ]);
      }
    }
  }

  /**
  * Delete Domain
  */
  public function deleteAction($id)
  {
    if($id==null)
    {
      $this->flash->error('Couln\'t find domain.');
      return $this->dispatcher->forward([
        'controller' => 'domain',
        'action' => 'index'
      ]);
    }
    $cache_key="domain_get_".$id.".cache";
    $this->view->domain=$this->cache->get($cache_key);
    if($this->view->domain===null)
    {
      $this->view->domain = Domains::findFirst($id);
      $this->cache->save($cache_key,$this->view->domain);
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
          $this->flash->notice('You don\'t have access to this module: private');
          return $this->dispatcher->forward([
              'action' => 'index'
          ]);
        }
      }
    }
    if($this->request->isPost())
    {
      if ($this->view->domain->delete() === false) {
        $this->flash->error('Domain could not be deleted.');
        $messages = $this->view->domain->getMessages();
        foreach ($messages as $message) {
          $this->flash->warning($message);
        }
      } else {
        $changelog = new Changelog();
        $changelog->type="DELETE";
        $changelog->data=json_encode($this->view->domain);
        $changelog->uid=$this->view->identity["id"];
        $changelog->save();
        foreach(Records::find('domain_id = '.$this->view->domain->id) as $record)
        {
          if ($record->delete() === false) {
            $this->flash->error('Domain could not be deleted.');
            $messages = $record->getMessages();
            foreach ($messages as $message) {
              $this->flash->warning($message);
            }
          } else {
            $this->flash->success('Record "'.$record->name.'" --'.$record->type.'-> "'.$record->content.'" purged.');
            $changelog = new Changelog();
            $changelog->type="PURGED";
            $changelog->data=json_encode($record);
            $changelog->uid=$this->view->identity["id"];
            $changelog->save();
          }
        }
        // Record was added
        $this->flash->success('Domain deleted.');
        return $this->dispatcher->forward([
          "action" => "index"
        ]);
      }
    }
  }
}
