#!/bin/bash

set -e

# Ensure that some variables are defined
: "${MISC_SCRIPTS_DIR:?}"

cd "$(dirname "$0")"

echo 'Checking code style rules'

bash "$MISC_SCRIPTS_DIR/cicd/check-no-trailing-spaces.sh" repos

bash "$MISC_SCRIPTS_DIR/cicd/check-newlines-eof.sh" repos \
    \! -name '*.php' \! -name '*.svg'
