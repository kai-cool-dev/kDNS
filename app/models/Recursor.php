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
    public $ip;

    /**
     *
     * @var string
     */
    public $description;


    public function initialize()
    {
    }
}
