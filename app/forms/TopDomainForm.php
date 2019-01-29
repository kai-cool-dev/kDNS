<?php
namespace kDNS\Forms;

use kDNS\Models\TopDomains;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Uniqueness;

class TopDomainForm extends Form
{
  public function initialize($entity = null, $new = false)
  {
    $name = new Text('name',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Name der Top Level Domain',
        'placeholder' => '.localdomain'
      ]
    );
    $name->addValidators([
      new PresenceOf([
        'message' => 'Top Level Domain is required'
      ]),
      new Uniqueness([
        'model' => new TopDomains(),
        'message' => 'Top Level Domain already exists'
      ])
    ]);
    $name->setFilters('string');
    $this->add($name);

    $description = new TextArea('description',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Give the top level domain a description!',
        'placeholder' => 'localdomain'
      ]
    );
    $description->setFilters('string');
    $this->add($description);
  }
}
