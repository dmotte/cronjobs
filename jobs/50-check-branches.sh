#!/bin/bash

set -e

cd "$(dirname "$0")"

repolist=$(find repos -mindepth 1 -maxdepth 1)

# The git_status_all_branches step is a prerequisite because we need to get all
# the branches as refs/heads/* instead of refs/remotes/*
echo -n "$repolist" | xargs -rd\\n \
    bash "$MISC_SCRIPTS_DIR/git-status-all-branches.sh"

echo -n "$repolist" | xargs -rd\\n \
    bash "$MISC_SCRIPTS_DIR/git-check-branches.sh"

echo OK
