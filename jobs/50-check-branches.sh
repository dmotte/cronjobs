#!/bin/bash

set -e

cd "$(dirname "$0")"

# shellcheck source=/dev/null
. ../shared/fetch-and-check.sh

script_git_check_branches="$(fetch_and_check \
    'https://raw.githubusercontent.com/dmotte/misc/main/scripts/git-check-branches.sh' \
    'a30788edfaf11588aabefedd386dbef23ec99c7e023c68896d108df5a4163ed0')"
git_check_branches() { bash <(echo "$script_git_check_branches") "$@"; }

# shellcheck disable=SC2046
git_check_branches $(find repos -mindepth 1 -maxdepth 1)

echo OK
