#!/bin/bash

set -e

cd "$(dirname "$0")"

find . -type f -iname README.md | while read -r i; do
    echo "Checking $i"

    expected="# $(basename "$(dirname "$i")")"
    actual="$(head -1 "$i")"

    [ "$expected" = "$actual" ] || \
        { echo "README header mismatch in $i: $actual" >&2; exit 1; }
done
