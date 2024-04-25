#!/bin/bash

set -e

# Ensure that some variables are defined
: "${MISC_SCRIPTS_DIR:?}"

cd "$(dirname "$0")"

mkdir repos

(
    cd repos

    bash "$MISC_SCRIPTS_DIR/github-get-all-repos.sh" users/dmotte \
        '.archived == false and .fork == false' |
        tr -d '\r' | while read -r i; do
            git clone --depth=1 --no-single-branch "https://github.com/$i.git"
        done
)
