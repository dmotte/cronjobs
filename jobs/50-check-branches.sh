#!/bin/bash

set -e

cd "$(dirname "$0")"

# shellcheck source=/dev/null
. ../shared/fetch-and-check.sh

script_git_status_all_branches="$(fetch_and_check \
    'https://raw.githubusercontent.com/dmotte/misc/main/scripts/git-status-all-branches.sh' \
    'c60a8b94d0310f521b66426a7ebb8e3e982025b97ad6405da546d53aaca478ba')"
git_status_all_branches() { bash <(echo "$script_git_status_all_branches") "$@"; }

script_git_check_branches="$(fetch_and_check \
    'https://raw.githubusercontent.com/dmotte/misc/main/scripts/git-check-branches.sh' \
    'a30788edfaf11588aabefedd386dbef23ec99c7e023c68896d108df5a4163ed0')"
git_check_branches() { bash <(echo "$script_git_check_branches") "$@"; }

repolist="$(find repos -mindepth 1 -maxdepth 1)"

# The git_status_all_branches step is a prerequisite because we need to get all
# the branches as refs/heads/* instead of refs/remotes/*
# shellcheck disable=SC2086
git_status_all_branches $repolist

# shellcheck disable=SC2086
git_check_branches $repolist

echo OK
