#!/bin/bash
AUTH="user:password"
BASE="http://example.com/"
METHOD=$1
DEST="$BASE$2"
XML=$3
 
# make sure args were passed
if [ $# -eq 0 ]; then
          echo "usage: ./`basename $0` HTTP-METHOD DESTINATION_URI [XML]"
                  echo "example: ./`basename $0` POST "/accounts" \"<account><name>ed</name><email>ed@ed.com</email></account>\""
                          exit 1
                        fi
                         
# execute CURL call
curl -H 'Accept: application/xml' -H 'Content-Type: application/xml' -w '\nHTTP STATUS: %{http_code}\nTIME: %{time_total}\n' \
-X $METHOD \
-d "$XML" \
-u "$AUTH" \
"$DEST"
 
exit 0
