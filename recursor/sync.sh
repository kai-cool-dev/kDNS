# Recursor Zone Sync Script
# Updates the complete file-system database from the API

# Enter the URL of your kDNS installation
BASEURL="https://dns.fastnameserver.eu"

#### Please don't edit behind this line
DATA=""
WHOISFOLDER="/var/www/vhost/dns.fastnameserver.eu/htdocs/kDNS/recursor"

# Needed Programs
CURL="$(which curl)"

# Functions
function downloadjson()
{
  URL="$BASEURL/api/recursor"
  DATA="$($CURL -s $URL | grep "content" | cut -d '>' -f2 | rev | cut -d'<' -f2 | rev)"
}

function builddb()
{
  FILE="$WHOISFOLDER/zones.conf"
  echo "# Created automatically at $(date)" > $FILE
  for row in $(echo "${DATA}" | jq -r '.[] | @base64')
  do
    _jq() {
      echo ${row} | base64 --decode | jq -r ${1}
    }
    ZONE="$(_jq '.zone')"
    if [ ! -z "$ZONE" ]
    then
      IP="$(_jq '.ip')"
      DESCRIPTION="$(_jq '.description')"
      echo "# $DESCRIPTION" >> $FILE
      echo "$ZONE=$IP" >> $FILE
    fi
  done
}


# Main Script
downloadjson
builddb
