<?php
namespace kDNS\Controllers;
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
            $display["name"]=$domain->name;
            $display["description"]=$domain->description;
            $display["created"]=$domain->created;
            $user=Users::findFirst($domain->account);
            $display["user"]=$user->name;
            $display["email"]=$user->email;
            $records=Records::find(['domain_id ='.$domain->id.' AND type = "NS"']);
            foreach($records as $record)
            {
              $display["nameserver"][]=Nameserver::find(['fqdn = "'.$record->content.'"'])[0];
            }
            $cache_key="whois_get_".$name.".cache";
            $this->view->display=$this->cache->get($cache_key);
            if($this->view->display===null)
            {
              $this->view->display=$display;
              $this->cache->save($cache_key,$display);
            }
          }
        }
        $this->view->form=new SearchDomainForm();
    }
}
