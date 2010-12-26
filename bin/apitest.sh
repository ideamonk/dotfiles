#!/bin/bash
METHOD=$1
DEST="$2"
JSON=$3
 
# make sure args were passed
if [ $# -eq 0 ]; then
          echo "usage: ./`basename $0` HTTP-METHOD DESTINATION_URI [XML]"
                  echo "example: ./`basename $0` POST "/accounts" \"<account><name>ed</name><email>ed@ed.com</email></account>\""
                          exit 1
                        fi
                         
# execute CURL call
curl -H 'Accept: application/json' -H 'Content-Type: application/json' -w '\nHTTP STATUS: %{http_code}\nTIME: %{time_total}\n' \
-X $METHOD \
-d "$JSON" \
"$DEST"
 
exit 0
