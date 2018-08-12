# Whois Sync Script
# Updates the complete file-system database from the API

# Enter the URL of your kDNS installation
BASEURL="https://dns.fastnameserver.eu"

#### Please don't edit behind this line
DATA=""
WHOISFOLDER="/etc/whoisd/db"

# Needed Programs
CURL="$(which curl)"

# Functions
function downloadjson()
{
  URL="$BASEURL/whois/raw"
  DATA="$($CURL -s $URL | grep "content" | cut -d '>' -f2 | rev | cut -d'<' -f2 | rev)"
}

function builddb()
{
  for row in $(echo "${DATA}" | jq -r '.[] | @base64')
  do
    _jq() {
      echo ${row} | base64 --decode | jq -r ${1}
    }
    NAME="$(_jq '.name')"
    if [ ! -z "$NAME" ]
    then
      FILE="$WHOISFOLDER/$NAME"
      CREATED="$(_jq '.created')"
      USER="$(_jq '.user')"
      EMAIL="$(_jq '.email')"
      DESCRIPTION="$(_jq '.description')"
      echo "Name: $NAME" > $FILE
      echo "Created: $CREATED" >> $FILE
      echo "User: $USER" >> $FILE
      echo "Mail: $EMAIL" >> $FILE
      echo "Description: $DESCRIPTION" >> $FILE
      cat $FILE
    fi
  done
}


# Main Script
downloadjson
builddb
