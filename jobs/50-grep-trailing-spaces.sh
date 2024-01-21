#!/bin/bash

set -e

cd "$(dirname "$0")"

if grep -IRl --exclude-dir=.git '\s$' repos; then
    echo 'Trailing spaces found in some files' >&2; exit 1
fi

echo OK
