<?php
namespace kDNS\Models;

use Phalcon\Mvc\Model;

/**
 * record_types
 * Stores the record_types by domain
 */
class RecordTypes extends Model
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
    public $value;

    /**
     *
     * @var string
     */
    public $description;


    public function initialize()
    {
    }
}
