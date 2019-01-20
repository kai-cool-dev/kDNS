<?php
namespace kDNS\Models;

use Phalcon\Mvc\Model;
use kDNS\Models\Nameserver;
use kDNS\Models\Users;

/**
 * Records
 * Stores the records by domain
 */
class Records extends Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var integer
     */
    public $domain_id;

    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var string
     */
    public $type;

    /**
     *
     * @var string
     */
    public $content;

    /**
     *
     * @var integer
     */
    public $ttl;

    /**
     *
     * @var integer
     */
    public $prio;

    /**
     *
     * @var integer
     */
    public $change_date;

    /**
     *
     * @var integer
     */
    public $disabled;

    /**
     *
     * @var string
     */
    public $ordername;

    /**
     *
     * @var integer
     */
    public $auth;


    public function initialize()
    {
    }

}
