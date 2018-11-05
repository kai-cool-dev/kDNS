<?php
use Phalcon\Config;
use Phalcon\Logger;
return new Config([
  'database' => [
    'adapter' => 'Mysql',
    'host' => 'MYSQL_HOST',
    'username' => 'MYSQL_USER',
    'password' => 'MYSQL_PASS',
    'dbname' => 'MYSQL_DB'
  ],
  'application' => [
    'controllersDir' => APP_PATH . '/controllers/',
    'modelsDir'      => APP_PATH . '/models/',
    'formsDir'       => APP_PATH . '/forms/',
    'viewsDir'       => APP_PATH . '/views/',
    'libraryDir'     => APP_PATH . '/library/',
    'pluginsDir'     => APP_PATH . '/plugins/',
    'cacheDir'       => BASE_PATH . '/cache/',
    'baseUri'        => '/',
    'publicUrl'      => 'PUBLIC_URL',
    'cryptSalt'      => 'eEAfR|_&G&f,+vU]:jFr!!A&+71w1Ms9~8_4L!<@[N@DyaIP_2My|:+.u>/6m,$D'
  ],
  'mail' => [
    'fromName' => 'kDNS',
    'fromEmail' => 'MAIL_FROM',
    'smtp' => [
      'server' => 'MAIL_SERVER',
      'port' => MAIL_PORT,
      'security' => 'tls',
      'username' => 'MAIL_USER',
      'password' => 'MAIL_PASSWORD'
    ]
  ],
  'amazon' => [
    'AWSAccessKeyId' => '***********',
    'AWSSecretKey' => ''
  ],
  'logger' => [
    'path'     => BASE_PATH . '/logs/',
    'format'   => '%date% [%type%] %message%',
    'date'     => 'D j H:i:s',
    'logLevel' => Logger::DEBUG,
    'filename' => 'application.log',
  ],
  // Set to false to disable sending emails (for use in test environment)
  'useMail' => true
]);
