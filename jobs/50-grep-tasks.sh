#!/bin/bash

set -e

cd "$(dirname "$0")"

echo 'Checking if any tasks are present in the repos'

if find repos ! -name .git ! -path '*/.git/*' | grep -i TO'DO'; then
    echo 'Pattern found in some paths' >&2; exit 1
fi

if grep -IRil --exclude-dir=.git TO'DO' repos; then
    echo 'Pattern found in some files' >&2; exit 1
fi
