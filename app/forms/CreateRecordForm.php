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
  public function initialize($entity = null, $new = false)
  {
    // Name
    $name = new Text('name',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Name of your Record aka the subdomain'
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
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Type of the record. You can just type for search.'
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
        'cols' => 50,
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Add your content, for various record types exists a lot of implementation. Please read the RFC!'
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
        'value' => 3600,
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Please input the Time to Live of your record. Or reset to standard.'
      ]
    );
    $ttl->addValidators([
      new PresenceOf([
        'message' => 'TTL is required'
      ]),
    ]);
    $this->add($ttl);

    if($new==true)
    {
      // Prio
      $prio = new Hidden('prio',
        [
          'class' => 'form-control',
          'min' => 10,
          'max' => 100,
          'value' => 10
        ]
      );
      $this->add($prio);
    }
    else
    {
      // Prio
      $prio = new Numeric('prio',
        [
          'class' => 'form-control',
          'min' => 10,
          'max' => 100,
          'value' => 10,
          'data-toggle' => 'tooltip',
          'data-placement' => 'bottom',
          'title' => 'Here you can change your MX Record Priority.'
        ]
      );
      $this->add($prio);
    }
  }
}
