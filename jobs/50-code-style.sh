#!/bin/bash

set -e

cd "$(dirname "$0")"

echo 'Checking code style rules in the repos'

if grep -IRl --exclude-dir=.git '\s$' repos; then
    echo 'Trailing spaces found in some files' >&2; exit 1
fi

files=$(find repos -type f ! -path '*/.git/*' ! -name '*.php' ! -name '*.svg')
files_bad=$(echo -n "$files" | xargs -rd\\n grep -ILPz '\n\z' || :)

[ -z "$files_bad" ] || {
    echo "$files_bad"
    echo 'Found some files with no newline at the end' >&2; exit 1
}
