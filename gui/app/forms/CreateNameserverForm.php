<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\PresenceOf;

class CreateNameserverForm extends Form
{
  public function initialize($entity = null, $new = false)
  {
    // Name
    $name = new Text('name',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Name of your Nameserver',
        'placeholder' => 'My cool Nameserver'
      ]
    );
    $name->addValidators([
      new PresenceOf([
        'message' => 'Name is required'
      ]),
    ]);
    $name->setFilters('string');
    $this->add($name);

    // FQDN
    $fqdn = new Text('fqdn',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'The FQDN of your Nameserver.',
        'placeholder' => 'ns1.example.com'
      ]
    );
    $fqdn->addValidators([
      new PresenceOf([
        'message' => 'FQDN is required'
      ]),
    ]);
    $fqdn->setFilters('string');
    $this->add($fqdn);

    // ip4
    $ip4 = new Text('ip4',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'IPv4 Address of the Nameserver',
        'placeholder' => '127.0.0.1'
      ]
    );
    $ip4->setFilters('string');
    $this->add($ip4);

    // ip6
    $ip6 = new Text('ip6',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'IPv6 Address of the Nameserver',
        'placeholder' => 'fe80::1'
      ]
    );
    $ip6->setFilters('string');
    $this->add($ip6);
  }
}
