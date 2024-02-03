#!/bin/bash

set -e

cd "$(dirname "$0")"

check_grep() {
    echo "Checking if pattern $1 can be found in file $2"
    grep "$1" "$2" >/dev/null || \
        { echo 'Pattern could not be found' >&2; exit 1; }
}

find repos -mindepth 1 -maxdepth 1 | while read -r i; do
    check_grep \
        'uses: dmotte/misc/\.github/workflows/cicd-with-script\.yml@main' \
        "$i/.github/workflows/main.yml"
    check_grep 'package-ecosystem: github-actions' "$i/.github/dependabot.yml"
done

echo OK
