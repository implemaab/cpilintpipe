#!/usr/bin/env bash
#
# This pipe is an example to show how easy is to create pipes for Bitbucket Pipelines.
#

source "$(dirname "$0")/common.sh"

info "Executing the pipe..."

# Required parameters
RULES=${RULES:?'RULES variable missing.'}


# Default parameters
DEBUG=${DEBUG:="false"}
TYPE=${TYPE:='DIRECTORY'}
FILENAME=${FILENAME:='report.xml'}
DIRECTORY=${DIRECTORY:='.'}
HOST=${HOST:=''}
USERNAME=${USERNAME:=''}
PASSWORD=${PASSWORD:=''}
PACKAGES=${PACKAGES:=''}

if [ "$TYPE" == "DIRECTORY" ]; then
    cd $DIRECTORY
    for i in *
      do
        if [ -d "$i" ]
            then
                info "Processing directory: $i"
                cd $i
                if [ -f "value_mapping.xml" ]; then
                  info "Skipping value mapping: $i"
                  cd ..
                  continue
                fi
                zip -r ../"$i.zip" .
                cd ..
        fi
      done
    cd ..
    run $(dirname "$0")/../cpilint/bin/cpilint -rules "$RULES" -directory "$DIRECTORY" -debug -boring -format junit -output "$FILENAME"
else
    run $(dirname "$0")/../cpilint/bin/cpilint -rules "$RULES" -host "$HOST" -username "$USERNAME" -password "$PASSWORD" -packages "$PACKAGES" -debug -boring -format junit -output "$FILENAME"
fi

if [[ "${status}" == "0" ]]; then
  success "Success!"
else
  fail "Error!"
fi
