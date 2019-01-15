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
    'record' => [
      'index',
      'create',
      'delete',
      'update',
      'disable',
      'enable'
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
