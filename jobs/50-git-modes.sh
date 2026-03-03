#!/bin/bash

set -e

# Ensure that some variables are defined
: "${MISC_SCRIPTS_DIR:?}"

cd "$(dirname "$0")"

echo 'Checking that there are no git files with unexpected mode bits'

repolist=$(find repos -mindepth 1 -maxdepth 1)
[ -n "$repolist" ] || { echo 'No repos found' >&2; exit 1; }
while IFS= read -r i || [ -n "$i" ]; do
    echo "Checking repo $i"
    bash "$MISC_SCRIPTS_DIR/cicd/check-git-modes.sh" "$i"
done < <(printf '%s' "$repolist")
