<?php
namespace kDNS\Models;

use Phalcon\Mvc\Model;

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


    public function initialize()
    {
    }
}
