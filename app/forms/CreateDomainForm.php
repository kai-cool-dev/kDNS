<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Select;
use kDNS\Models\TopDomains;
use Phalcon\Validation\Validator\PresenceOf;

class CreateDomainForm extends Form
{
  public function initialize()
  {
    // Domain Name
    $name = new Text('name',[
      'class' => 'form-control',
      'placeholder' => 'example'
    ]);
    $name->addValidators([
      new PresenceOf([
        'message' => 'Domain Name is required'
      ])
    ]);
    $this->add($name);

    // Description
    $description = new TextArea('description',[
      'class' => 'form-control',
      'placeholder' => 'description'
    ]);
    $this->add($description);

    // Domain TLD
    $tld = new Select('tld',TopDomains::find(),
      [
        'using' => [
          'id',
          'value'
        ],
        'class' => 'form-control'
      ]
    );
    $this->add($tld);
  }
}
