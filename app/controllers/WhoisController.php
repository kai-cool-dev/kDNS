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
          $data=$this->request->getPost();
          $filter = new Filter();
          $data["name"]=$filter->sanitize($data["name"],"string");
          $domain = Domains::find(['name LIKE "'.$data["name"].'"']);
          if(empty($domain[0]))
          {
            $this->flash->error("Domain not found.");
            return false;
          }
          $ddata["name"]=$domain[0]->name;
          $ddata["description"]=$domain[0]->description;
          $ddata["created"]=$domain[0]->created;
          $user=Users::findFirst($domain[0]->account);
          $ddata["user"]=$user->name;
          $ddata["email"]=$user->email;
          $this->view->display=$ddata;
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
