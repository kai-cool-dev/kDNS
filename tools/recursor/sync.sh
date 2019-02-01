# Recursor Zone Sync Script
# Updates the complete file-system database from the API

# Enter the URL of your kDNS installation
DOMAIN="https://dns.peppermint.cloud/"
# Enter the Folder of your PowerDNS installation
FOLDER="/etc/powerdns/"

#### Please don't edit behind this line
DATA=""
CURL="$(which curl)"
TOUCH="$(which touch)"
FILE="$FOLDER/zones.conf"
if [ ! -f $FILE ]
then
  $TOUCH $FILE
fi
echo "# Created automatically at $(date)" > $FILE
$CURL -s $DOMAIN"/config/recursor/" | grep -v "<" >> $FILE
