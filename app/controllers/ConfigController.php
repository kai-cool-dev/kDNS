<?php
namespace kDNS\Controllers;

use kDNS\Models\Nameserver;
use kDNS\Models\TopDomains;
use kDNS\Models\Records;

/**
 * Mini API
 */
class ConfigController extends ControllerBase
{
  public function indexAction()
  {
  }

  public function recursorAction()
  {
    $cache_key="nameserver_get_config.cache";
    $nameservers=$this->cache->get($cache_key);
    if($nameservers===null)
    {
      $nameservers=Nameserver::find(["type != 'recursor'"]);
      $this->cache->save($cache_key,$nameserver);
    }
    foreach($nameservers as $nameserver)
    {
      echo "####\n";
      echo "# Section for Nameserver ".$nameserver->name."\n";
      echo "# Top Level Domains:\n";
      foreach($nameserver->topdomains as $topdomain)
      {
        $cache_key="topdomains_get_".$topdomain.".cache";
        $dom=$this->cache->get($cache_key);
        if($dom===null)
        {
          $dom=TopDomains::findFirst($topdomain);
          $this->cache->save($cache_key,$dom);
        }
        $line="# ".$dom->name.": ".$dom->description." (".$dom->type.")\n";
        $dom->name=preg_replace('/^\./','',$dom->name);
        if($dom->name=="")
        {
          $dom->name=".";
        }
        if($dom->type=="adblock")
        {
          $line.=$dom->name."=".$nameserver->ip4;
        }
        else
        {
          $line.="+".$dom->name."=".$nameserver->ip4;
        }
        echo $line."\n";
      }
      echo "# Authorative Domains:\n";
      $cache_key="domains_get_".$nameserver->fqdn.".cache";
      $auth_doms=$this->cache->get($cache_key);
      if($dom===null)
      {
        $auth_doms=Records::find(["content like '$nameserver->fqdn'"]);
        $this->cache->save($cache_key,$auth_doms);
      }
      foreach($auth_doms as $dom)
      {
        echo $dom->name."=".$nameserver->ip4."\n";
      }
      echo "####\n";
    }
    #echo json_encode($nameserver);
    #echo json_encode($display);
  }
}
