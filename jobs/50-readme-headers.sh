#!/bin/bash

set -e

# Ensure that some variables are defined
: "${MISC_SCRIPTS_DIR:?}"

cd "$(dirname "$0")"

echo 'Checking README headers'

bash "$MISC_SCRIPTS_DIR/cicd/check-readme-headers.sh" repos
