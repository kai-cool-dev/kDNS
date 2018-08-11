<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\PresenceOf;

class CreateRecordTypeForm extends Form
{
  public function initialize($entity = null, $new = false)
  {
    // value
    $value = new Text('value',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Please add a valid DNS Record Type',
        'placeholder' => 'AAAA'
      ]
    );
    $value->addValidators([
      new PresenceOf([
        'message' => 'Record Type is required'
      ]),
    ]);
    $value->setFilters('string');
    $this->add($value);
  }
}
