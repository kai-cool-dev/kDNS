<?php
namespace kDNS\Models;

use Phalcon\Mvc\Model;

/**
 * Recursor
 * Stores the Recursor
 */
class Recursor extends Model
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


    public function initialize()
    {
    }
}
