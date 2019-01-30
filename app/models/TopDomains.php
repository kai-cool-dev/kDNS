<?php
namespace kDNS\Models;

use Phalcon\Mvc\Model;
use kDNS\Models\Domains;

/**
 * kDNS\Models\TopDomains
 * Lists all Top Level Domains
 */

class TopDomains extends Model
{
  /**
  * @var string
  */
  public $id;

  /**
  * @var string
  */
  public $name;

  /**
  * @var string
  */
  public $description;

  /**
  * @var string
  */
  public $domain;

  /**
  * @var string
  */
  public $type;

  public function initialize()
  {
    if(!empty($domain))
    {
      $this->domain=Domains::findFirst($domain);
    }
  }
}
