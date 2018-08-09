<?php
namespace kDNS\Models;

use Phalcon\Mvc\Model;

/**
 * Permissions
 * Stores the permissions by profile
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


    public function initialize()
    {
    }
}
