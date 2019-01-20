<?php
namespace kDNS\Models;

use Phalcon\Mvc\Model;
use kDNS\Models\Users;

/**
 * Changelog
 * Stores the domains
 */
class Changelog extends Model
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
    public $type;

    /**
     *
     * @var string
     */
    public $data;

    /**
     *
     * @var string
     */
    public $date;

    /**
     *
     * @var int
     */
    public $uid;


    public function initialize()
    {
    }

    public function afterFetch()
    {
      $this->data=json_decode($this->data,true);
      $this->uid=Users::findFirst($this->uid);
    }
}
