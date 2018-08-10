<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Select;
use kDNS\Models\Nameserver;

class NameserverSelectForm extends Form
{
  public function initialize()
  {
    // Nameserver
    $nameserver = new Select('nameserver', Nameserver::find(),
      [
        'using' => [
          'fqdn',
          'name'
        ],
        'class' => 'form-control'
      ]
    );
    $this->add($nameserver);
  }
}
