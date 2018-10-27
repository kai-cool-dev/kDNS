<?php
namespace kDNS\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Email;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\Hidden;
use kDNS\Models\Nameserver;
use Phalcon\Validation\Validator\PresenceOf;

class CreateSOAForm extends Form
{
  public function initialize()
  {
    // Domain Name
    $email = new Email('email',[
      'class' => 'form-control',
      'placeholder' => 'mail@example.com',
      'value' => $this->view->identity["email"]
    ]);
    $email->addValidators([
      new PresenceOf([
        'message' => 'E-Mail is required'
      ]),
    ]);
    $this->add($email);

    // Nameserver
    $nameserver = new Select('nameserver',Nameserver::find(),
      [
        'using' => [
          'fqdn',
          'name'
        ],
        'class' => 'form-control'
      ]
    );
    $nameserver->addValidators([
      new PresenceOf([
        'message' => 'Nameserver is required'
      ]),
    ]);
    $this->add($nameserver);

    // Refresh
    $refresh = new Numeric('refresh',
      [
        'class' => 'form-control',
        'min' => 420,
        'max' => 172800,
        'value' => 86400
      ]
    );
    $refresh->addValidators([
      new PresenceOf([
        'message' => 'Refresh is required'
      ]),
    ]);
    $this->add($refresh);

    // Retry
    $retry = new Numeric('retry',
      [
        'class' => 'form-control',
        'min' => 120,
        'max' => 172800,
        'value' => 7200
      ]
    );
    $retry->addValidators([
      new PresenceOf([
        'message' => 'Retry is required'
      ]),
    ]);
    $this->add($retry);

    // Expire
    $expire = new Numeric('expire',
      [
        'class' => 'form-control',
        'min' => 7200,
        'max' => 7200000,
        'value' => 3600000
      ]
    );
    $expire->addValidators([
      new PresenceOf([
        'message' => 'Expire is required'
      ]),
    ]);
    $this->add($expire);

    // TTL
    $ttl = new Numeric('ttl',
      [
        'class' => 'form-control',
        'min' => 120,
        'max' => 72000,
        'value' => 3600
      ]
    );
    $ttl->addValidators([
      new PresenceOf([
        'message' => 'TTL is required'
      ]),
    ]);
    $this->add($ttl);

    // Hidden SOA type switch
    $type=new Hidden('type',[
      'value' => 'SOA'
    ]);
    $type->addValidators([
      new PresenceOf([
        'message' => 'Type is required'
      ]),
    ]);
    $this->add($type);

    // Hidden Action switch
    $action=new Hidden('action',[
      'value' => 'create'
    ]);
    $action->addValidators([
      new PresenceOf([
        'message' => 'Action is required'
      ]),
    ]);
    $this->add($action);
  }
}
