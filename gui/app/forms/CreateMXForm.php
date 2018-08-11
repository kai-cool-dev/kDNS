<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Numeric;

class CreateMXForm extends Form
{
  public function initialize($entity = null, $new = false)
  {
    // Content
    $content = new Text('mailserver',
    [
      'class' => 'form-control',
      'cols' => 50
    ]);
    $this->add($content);
    // Prio
    $prio = new Numeric('prio',
    [
      'class' => 'form-control',
      'min' => 10,
      'max' => 100,
      'value' => 10
    ]);
    $this->add($prio);
  }
}
