Installation
============

Hey, this document will guide you through the installation process of this software. Currently this software doesn't have a one-click-installer, but it is planned (for more planned features look in the README.md).

If you want to use this setup in a home lab or on a single computer, this setup is straight forward and possible on a single machine. However if you want to use this software in production you need ATLEAST following servers:

-	2x PowerDNS Authorative Server with public IPs in separate networks (e.g. two different hosting providers)
-	1x PowerDNS Recursor Server in your internal network
-	2x MySQL Server in MySQL Master-Master or Galera Cluster (can be installed on your authorative server, also is a little bit faster)
-	1x Nginx Web Server with PHP 7.2 FPM for the WebUI
-	1x Redis Caching Server for the WebUI

FOR THIS GUIDE WE ASSUME YOU ARE USING LINUX DEBIAN FOR THE THIRD PARTY SOFTWARE PLEASE GO TO THE SOURCE LINKS FOR OTHER DISTRIBUTIONS

WE ASSUME YOU HAVE A RUNNING MYSQL SERVER

PowerDNS Authorative Server
---------------------------

PowerDNS is lightweight and very fast. Also supports other things we aren't using right now.

Installation for other Distributions: https://repo.powerdns.com/

Create the file '/etc/apt/sources.list.d/authorative.list' with this content:

```
deb [arch=amd64] http://repo.powerdns.com/debian stretch-auth-master main
```

And this to '/etc/apt/preferences.d/pdns':

```
Package: pdns-*
Pin: origin repo.powerdns.com
Pin-Priority: 600
```

and execute the following commands

```bash
curl -s https://repo.powerdns.com/CBC8B383-pub.asc | apt-key add - && \
apt update -y && \
apt install pdns-server -y
```

Your PowerDNS Server is now installed. Now you need to configure it. We deliver a handy configuration file:

```
tools/authorative/pdns.conf
```

You need to copy this config file to your Authorative server in `/etc/powerdns/` and edit it to set the MySQL credentials!

Web UI
------

To run this application on your machine, you need at least:

-	>= PHP 7.2 - >= Phalcon 3.0 - Apache Web Server with `mod_rewrite enabled`, and `AllowOverride Options` (or `All`) in your `httpd.conf` or Nginx Web Server - Latest [Phalcon Framework](https://github.com/phalcon/cphalcon) extension installed/enabled - MySQL >= 5.7 or MariaDB >= 10.0

### Installing DNS Database Schema

You need to initialize the database with the correct schema. This schema also includes a user with following credentials `admin@example.dns - admin1234` to administrate everything.

```bash
echo 'CREATE DATABASE powerdns' | mysql -u root
cat schemas/powerdns.sql | mysql -u root powerdns
```

### Configure the software

Please edit now your configuration file located in `app/config/config.php`. Change the MySQL server and mailserver details.

### Installing Dependencies via Composer

kDNS dependencies must be installed using Composer. Install composer in a common location or in your project:

```bash
curl -s http://getcomposer.org/installer | php
```

Run the composer installer:

```bash
php composer.phar install
```

**NOTE** After the installation, please ensure that the following folders have write permissions set: - `cache`
