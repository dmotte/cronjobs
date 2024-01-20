#!/bin/bash

set -e

cd "$(dirname "$0")"

repolist="$(find repos -mindepth 1 -maxdepth 1)"

# The git_status_all_branches step is a prerequisite because we need to get all
# the branches as refs/heads/* instead of refs/remotes/*
# shellcheck disable=SC2086
"$MISC_SCRIPTS_DIR/git-status-all-branches.sh" $repolist

# shellcheck disable=SC2086
"$MISC_SCRIPTS_DIR/git-check-branches.sh" $repolist

echo OK
