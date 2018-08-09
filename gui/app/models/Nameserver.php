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
    public $country;

    /**
     *
     * @var string
     */
    public $fqdn;


    public function initialize()
    {
    }
}
