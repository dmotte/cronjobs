#!/bin/bash

set -e

# Ensure that some variables are defined
: "${MISC_SCRIPTS_DIR:?}"

cd "$(dirname "$0")"

echo 'Checking that there are no git files with unexpected mode bits'

repolist=$(find repos -mindepth 1 -maxdepth 1)

echo "$repolist" | while IFS= read -r i; do
    echo "Checking repo $i"
    bash "$MISC_SCRIPTS_DIR/cicd/check-git-modes.sh" "$i"
done
