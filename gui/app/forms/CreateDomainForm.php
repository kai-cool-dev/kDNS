<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use kDNS\Models\TopDomains;

class CreateDomainForm extends Form
{
  public function initialize()
  {
    // Domain Name
    $name = new Text('name',[
      'class' => 'form-control',
      'placeholder' => 'example'
    ]);
    $this->add($name);

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
