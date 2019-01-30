<?php
namespace kDNS\Models;

use Phalcon\Mvc\Model;
use kDNS\Models\Records;
use kDNS\Models\Nameserver;
use kDNS\Models\Users;

/**
 * Domains
 * Stores the domains
 */
class Domains extends Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var string
     */
    public $master;

    /**
     *
     * @var integer
     */
    public $last_check;

    /**
     *
     * @var string
     */
    public $type;

    /**
     *
     * @var integer
     */
    public $notified_serial;

    /**
     *
     * @var string
     */
    public $account;

    /**
     *
     * @var string
     */
    public $created;

    /**
     *
     * @var string
     */
    public $description;


    public function initialize()
    {
    }

    public function records()
    {
      return Records::find('domain_id = '.$this->id);
    }

    public function afterCreate()
    {
      $soa_content=Nameserver::findFirst("type='authorative'")->fqdn." ".str_replace("@",".",Users::findFirst($this->account)->email)." ".date("Ymd")."00  28800 7200 604800 1200";
      date_default_timezone_set("UTC");
      $soa=array(
        "domain_id" => $this->id,
        "name" => $this->name,
        "type" => "SOA",
        "content" => $soa_content,
        "ttl" => 3600,
        "prio" => 0,
        "change_date" => time(),
        "disabled" => 0,
        "auth" => 1
      );
      $record=new Records($soa);
      if($record->save() === false)
      {
        return false;
      }
      foreach(Nameserver::find("type='authorative'") as $nameserver)
      {
        $ns=array(
          "domain_id" => $this->id,
          "name" => $this->name,
          "type" => "NS",
          "content" => $nameserver->fqdn,
          "ttl" => 3600,
          "prio" => 0,
          "change_date" => time(),
          "disabled" => 0,
          "auth" => 1
        );
        $record=new Records($ns);
        if($record->save() === false)
        {
          return false;
        }
      }
    }

}
