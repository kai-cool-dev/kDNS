<?php
namespace kDNS\Models;

use Phalcon\Mvc\Model;

/**
 * kDNS\Models\TopDomains
 * Lists all Top Level Domains
 */

class TopDomains extends Model
{
  /**
  *
  * @var string
  */
  public $id;
  /**
  *
  * @var string
  */
  public $value;
  public function initialize()
  {
  }
}
