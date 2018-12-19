<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\PresenceOf;

class CreateTLDForm extends Form
{
  public function initialize($entity = null, $new = false)
  {
    // value
    $value = new Text('value',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Top Level Domain',
        'placeholder' => 'localdomain'
      ]
    );
    $value->addValidators([
      new PresenceOf([
        'message' => 'Top Level Domain is required'
      ]),
    ]);
    $value->setFilters('string');
    $this->add($value);
  }
}
