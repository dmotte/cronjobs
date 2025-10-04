#!/bin/bash

set -e

# Ensure that some variables are defined
: "${MISC_SCRIPTS_DIR:?}"

cd "$(dirname "$0")"

echo 'Checking that there are no filenames with unwanted characters'

bash "$MISC_SCRIPTS_DIR/cicd/check-filenames.sh" repos '[^0-9A-Za-z._-]'
