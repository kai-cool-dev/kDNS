<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\Hidden;
use kDNS\Models\RecordTypes;
use Phalcon\Validation\Validator\PresenceOf;

class CreateRecordForm extends Form
{
  public function initialize()
  {
    // Name
    $name = new Text('name',
      [
        'class' => 'form-control'
      ]
    );
    $name->addValidators([
      new PresenceOf([
        'message' => 'Name is required'
      ]),
    ]);
    $this->add($name);
    // type
    $type = new Select('type',RecordTypes::find(),
      [
        'using' => [
          'value',
          'value'
        ],
        'class' => 'form-control'
      ]
    );
    $type->addValidators([
      new PresenceOf([
        'message' => 'type is required'
      ]),
    ]);
    $this->add($type);
    // TTL
    $ttl = new Numeric('ttl',
      [
        'class' => 'form-control',
        'min' => 120,
        'max' => 72000,
        'value' => 3600
      ]
    );
    $ttl->addValidators([
      new PresenceOf([
        'message' => 'TTL is required'
      ]),
    ]);
    $this->add($ttl);

    // Hidden Action switch
    $action=new Hidden('action',[
      'value' => 'create'
    ]);
    $action->addValidators([
      new PresenceOf([
        'message' => 'Action is required'
      ]),
    ]);
    $this->add($action);
  }
}
