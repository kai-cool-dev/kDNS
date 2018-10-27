<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\TextArea;

class EditDomainDescriptionForm extends Form
{
  public function initialize()
  {
    // Description
    $description = new TextArea('description',[
      'class' => 'form-control',
      'placeholder' => 'description'
    ]);
    $this->add($description);
  }
}
