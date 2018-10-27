# kDNS GUI

The GUI for PowerDNS Server with User Management. Please read the Get Started Guide.

## Get Started

### Requirements

To run this application on your machine, you need at least:

* >= PHP 5.5
* >= Phalcon 3.0
* Apache Web Server with `mod_rewrite enabled`, and `AllowOverride Options` (or `All`) in your `httpd.conf` or Nginx Web Server
* Latest [Phalcon Framework](https://github.com/phalcon/cphalcon) extension installed/enabled
* MySQL >= 5.1.5

Then you'll need to create the database and initialize schema:

```bash
echo 'CREATE DATABASE powerdns' | mysql -u root
cat schemas/powerdns.sql | mysql -u root powerdns
```

Also you can override application config by creating `app/config/config.dev.php` (already gitignored).

### Installing Dependencies via Composer

kDNS dependencies must be installed using Composer. Install composer in a common location or in your project:

```bash
curl -s http://getcomposer.org/installer | php
```

Run the composer installer:

```bash
php composer.phar install
```

**NOTE** After the installation, please ensure that the following folders have write permissions set:
- `cache`

## License

kDNS is open-sourced software licensed under the New BSD License.
