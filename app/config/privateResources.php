<?php
use Phalcon\Config;
use Phalcon\Logger;
return new Config([
  'privateResources' => [
    'users' => [
      'index',
      'search',
      'edit',
      'create',
      'delete',
      'changePassword'
    ],
    'profiles' => [
      'index',
      'search',
      'edit',
      'create',
      'delete'
    ],
    'permissions' => [
      'index'
    ],
    'dns' => [
      'index',
      'search',
      'create',
      'edit',
      'delete',
      'administrate',
      'administrateNS',
      'administrateTLD',
      'administrateType',
      'administrateRecursor',
      'administrateChangelog'
    ],
    'domains' => [
      'index',
      'edit',
      'updateDescription',
      'create',
      'delete'
    ]
  ]
]);
