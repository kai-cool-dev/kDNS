# PowerDNS recursor

This is the PowerDNS recursor configuration. Copy these files and scripts to /etc/powerdns, run the sync.sh script and add a crontab.

The sync.sh script syncs the API with the recursor configuration files and updates the root.hints file every 30 minutes. The often you run the cronjob, the faster your settings can be applied. Recommend time: every 15 minutes.
