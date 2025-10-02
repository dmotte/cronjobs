#!/bin/bash

set -e

# Ensure that some variables are defined
: "${MISC_SCRIPTS_DIR:?}"

cd "$(dirname "$0")"

GHBAK_CLONE_ARGS='--depth=1 --no-single-branch' \
    bash "$MISC_SCRIPTS_DIR/github-bak-all-repos.sh" users/dmotte repos
