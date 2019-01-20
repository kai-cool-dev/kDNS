<?php
namespace kDNS\Controllers;
use kDNS\Forms\SearchDomainForm;
use kDNS\Models\Domains;
use kDNS\Models\Users;
use Phalcon\Filter;

/**
 * Display the "whois" page.
 */
class WhoisController extends ControllerBase
{
  /**
     * Default action. Set the public layout (layouts/public.volt)
     */
    public function indexAction()
    {
        $this->view->setVar('logged_in', is_array($this->auth->getIdentity()));
        $this->view->setTemplateBefore('public');
        if($this->request->isPost())
        {
          $filter = new Filter();
          $name=$filter->sanitize($this->request->get("name"),"string");
          $cache_key="domain_get_".$name.".cache";
          $domain=$this->cache->get($cache_key);
          if($domain===null)
          {
            $domain = Domains::find(['name LIKE "'.$name.'"'])[0];
            $this->cache->save($cache_key,$domain);
          }
          if($domain===false)
          {
            $this->flash->error("Domain not found.");
          }
          else
          {
            $ddata["name"]=$domain->name;
            $ddata["description"]=$domain->description;
            $ddata["created"]=$domain->created;
            $user=Users::findFirst($domain->account);
            $ddata["user"]=$user->name;
            $ddata["email"]=$user->email;
            $this->view->display=$ddata;
          }
        }
        $this->view->form=new SearchDomainForm();
    }

    public function rawAction()
    {
      $domains = Domains::find();
      foreach($domains as $key => $domain )
      {
        $ddata[$key]["name"]=$domain->name;
        $ddata[$key]["description"]=$domain->description;
        $ddata[$key]["created"]=$domain->created;
        $user=Users::findFirst($domain->account);
        $ddata[$key]["user"]=$user->name;
        $ddata[$key]["email"]=$user->email;
      }
      $this->view->display=json_encode($ddata);
    }
}
