#!/bin/bash

set -e

cd "$(dirname "$0")"

if grep -IRl --exclude-dir=.git '\s$' repos; then
    echo 'Trailing spaces found in some files' >&2; exit 1
fi

# find . -type f ! -path '*/.git/*' | while read -r i; do
#     [[ $(file -b --mime-type "$i") = text/* ]] || continue

#     if [ "$(echo -n x; tail -c1 "$i"; echo x)" != $'x\nx' ]; then
#         echo "No newline at end of file: $i" >&2; exit 1
#     fi
# done

echo OK
