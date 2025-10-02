#!/bin/bash

set -e

cd "$(dirname "$0")"

echo 'Checking file names'

if find repos ! -name .git ! -path '*/.git/*' -printf '%f\n' | grep '[^0-9A-Za-z./_-]'; then
    echo 'Unwanted characters found in some file names' >&2; exit 1
fi
