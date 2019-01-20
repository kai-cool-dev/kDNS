kDNS GUI
========

The GUI for PowerDNS Server with User Management. Please read the installation guide located in `INSTALL.md`

Supported Features
------------------

This features are implemented and working:

-	Complete Domain Management
-	Custom TLDs for Intranets
-	Internal Whois Management over WebUI, whois cli for linux systems and API.
-	Changelog (Log Everything what your Users are doing! Useful for auditing.)
-	Redis for Cluster or HA Support, also faster caching!
-	User Management
-	Permission Management

Planned Features
----------------

### General

-	Removing of the most common bugs `BUGS.md`.
-	Nicer Display of the Changelog
-	Combine Changelog for DNS with Users
-	Record Creation Assistant (Modals for MX, TXT, SRV, etc Records)
-	Nicer and mobile friendly UI
-	User Signup should be changeable
-	CDN Connector (NGINX Reverse Proxy mit Lets Encrypt)
-	Credit System for DNS Zones
-	Credit System with combined billing and paypal gateway
-	Dashboard with Statistics (Admin and User)
-	DNSSEC
-	LDAP Connector (only importer!?)

### Recursor

-	Recorsor Management (Cache DNS Queries from your LAN and implement your own TLDs)
-	Advanced AdBlock and Parental Control with own block lists.
-	Dynamic DNS API.
-	Recursor Metrics via PowerDNS API --> Cronjob with input in MySQL

### Authorative

-	Authorative Nameserver Management (Manage your public domains)
-	Authorative Metrics via PowerDNS API --> Cronjob with input in MySQL

### Third Party

-	Register free or paid Domains directly over API (Freenom).
-	Credit System for Freenom API

License
-------

kDNS is open-sourced software licensed under the New BSD License. Please read the License located in `LICENSE.md`
