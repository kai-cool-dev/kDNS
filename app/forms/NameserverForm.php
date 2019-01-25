<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Validation\Validator\PresenceOf;

class NameserverForm extends Form
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
        'title' => 'The Full Qualified Domain Name of your Nameserver.',
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

    // description
    $description = new TextArea('description',
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Description of the Nameserver',
        'placeholder' => 'Description',
        'rows' => 3
      ]
    );
    $description->setFilters('string');
    $this->add($description);

    // type
    $type = new Select('type',
      [
        'authorative' => 'Authorative',
        'recursor' => 'Recursor'
      ],
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'data-placement' => 'bottom',
        'title' => 'Type of the Nameserver.'
      ]
    );
    $type->addValidators([
      new PresenceOf([
        'message' => 'Type is required'
      ]),
    ]);
    $type->setFilters('string');
    $type->setDefault($entity->mode);
    $this->add($type);

    // domain
    $topdomains = new Select('topdomains',
      [
        'placeholder' => 'Placeholder'
      ],
      [
        'class' => 'form-control',
        'data-toggle' => 'tooltip',
        'multiple' => true,
        'size' => 4,
        'data-placement' => 'bottom',
        'title' => 'Select Top Level Domains over which this server has authority',
        'placeholder' => 'Description'
      ]
    );
    $topdomains->setFilters('string');
    $this->add($topdomains);
  }
}
