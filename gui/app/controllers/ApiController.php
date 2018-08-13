<?php
namespace kDNS\Controllers;
use kDNS\Forms\SearchDomainForm;
use kDNS\Models\Domains;
use kDNS\Models\Users;
use kDNS\Models\Nameserver;
use kDNS\Models\Recursor;

/**
 * Mini API
 */
class ApiController extends ControllerBase
{
  public function indexAction()
  {
  }

  public function recursorAction(){
    $i=0;
    $recursors = Recursor::find();
    foreach($recursors as $key => $recursor )
    {
      $data[$i]["zone"]="+".$recursor->zone;
      $data[$i]["ip"]=$recursor->ip;
      $data[$i]["description"]=$recursor->description;
      $i++;
    }
    $nameserver = Nameserver::findFirst();
    $domains = Domains::find();
    foreach($domains as $key => $domain )
    {
      $data[$i]["zone"]=$domain->name;
      if(empty($nameserver->ip4))
      {
        $data[$i]["ip"]=$nameserver->ip6;
      }
      else
      {
        $data[$i]["ip"]=$nameserver->ip4;
      }
      $data[$i]["description"]="kDNS Hosted Domain";
      $i++;
    }
    $this->view->display=json_encode($data);
  }

  public function whoisAction()
  {
    $domains = Domains::find();
    foreach($domains as $key => $domain )
    {
      $data[$key]["name"]=$domain->name;
      $data[$key]["description"]=$domain->description;
      $data[$key]["created"]=$domain->created;
      $user=Users::findFirst($domain->account);
      $data[$key]["user"]=$user->name;
      $data[$key]["email"]=$user->email;
    }
    $this->view->display=json_encode($data);
  }
}
