<?php
namespace kDNS\Models;

use Phalcon\Mvc\Model;

use kDNS\Models\TopDomains;

/**
 * Nameserver
 * Stores the records by domain
 */
class Nameserver extends Model
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
    public $fqdn;

    /**
     *
     * @var string
     */
    public $ip4;

    /**
     *
     * @var string
     */
    public $ip6;

    /**
     *
     * @var string
     */
    public $description;

    /**
     *
     * @var string
     */
    public $topdomains;

    /**
     *
     * @var string
     */
    public $type;


    public function afterFetch()
    {
      $this->topdomains=json_decode($this->topdomains,true);
      #foreach(json_decode($this->topdomains,true) as $tld)
      #{
      #  $this->topdomains[]=TopDomains::findFirst($tld);
      #}
    }

    public function afterSave()
    {
      $this->topdomains=json_encode($this->topdomains);
    }
}
