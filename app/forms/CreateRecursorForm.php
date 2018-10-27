<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\PresenceOf;

class CreateRecursorForm extends Form
{
  public function initialize($entity = null, $new = false)
  {
    // zone
    $zone = new Text('zone',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Please add the zone which should be queried by the recursor',
        'placeholder' => '.myzone (Use only . for root zone)'
      ]
    );
    $zone->addValidators([
      new PresenceOf([
        'message' => 'Record Type is required'
      ]),
    ]);
    $zone->setFilters('string');
    $this->add($zone);

    // ip
    $ip = new Text('ip',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Please input the IP-Address from the nameserver of this zone. This could be IPv4 or IPv6.',
        'placeholder' => '127.0.0.1 / fe80::1'
      ]
    );
    $ip->addValidators([
      new PresenceOf([
        'message' => 'IP is required'
      ]),
    ]);
    $ip->setFilters('string');
    $this->add($ip);

    // description
    $description = new Text('description',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Please input the Description. This is added as comment to the config files',
        'placeholder' => 'MyZone Nameserver'
      ]
    );
    $description->addValidators([
      new PresenceOf([
        'message' => 'Description is required'
      ]),
    ]);
    $description->setFilters('string');
    $this->add($description);
  }
}
