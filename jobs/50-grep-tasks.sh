#!/bin/bash

set -e

cd "$(dirname "$0")"

echo 'Checking if any tasks are present in the repos'

if find repos ! -name .git ! -path '*/.git/*' | grep -Fi TO'DO'; then
    echo 'Pattern found in some paths' >&2; exit 1
fi

if grep -FIRil --exclude-dir=.git TO'DO' repos; then
    echo 'Pattern found in some files' >&2; exit 1
fi
