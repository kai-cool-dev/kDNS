<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
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
    $name->setFilters('string');
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
    // Content
    $content = new TextArea('content',
      [
        'class' => 'form-control',
        'cols' => 50
      ]
    );
    $content->setFilters('string');
    $content->addValidators([
      new PresenceOf([
        'message' => 'Content is required'
      ]),
    ]);
    $this->add($content);

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

    // Prio
    $prio = new Numeric('prio',
      [
        'class' => 'form-control',
        'min' => 10,
        'max' => 100,
        'value' => 10
      ]
    );
    $this->add($prio);

    // Hidden Action switch
    $action=new Hidden('action',[
      'value' => 'create'
    ]);
    $this->add($action);
  }
}
