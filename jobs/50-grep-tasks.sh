#!/bin/bash

set -e

# Ensure that some variables are defined
: "${MISC_SCRIPTS_DIR:?}"

cd "$(dirname "$0")"

echo 'Checking if any tasks are present in the repos'

bash "$MISC_SCRIPTS_DIR/cicd/check-filenames.sh" repos -Fi TO'DO'

bash "$MISC_SCRIPTS_DIR/cicd/check-contents.sh" repos -Fi TO'DO'
