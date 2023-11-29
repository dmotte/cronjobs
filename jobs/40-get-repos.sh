#!/bin/bash

set -e

cd "$(dirname "$0")"

# shellcheck source=/dev/null
. ../shared/fetch-and-check.sh

script_github_get_all_repos="$(fetch_and_check \
    'https://raw.githubusercontent.com/dmotte/misc/main/scripts/github-get-all-repos.sh' \
    'd4a3c3a4b3c3c8877e51638bacae5aae010fc1df920887321ebc606f0918c583')"
github_get_all_repos() { bash <(echo "$script_github_get_all_repos") "$@"; }

mkdir repos

(
    cd repos

    github_get_all_repos users/dmotte \
        '.archived == false and .fork == false' | \
        tr -d '\r' | while read -r i; do
            git clone --depth=1 "https://github.com/$i.git"
        done
)
