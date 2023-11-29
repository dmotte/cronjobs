#!/bin/bash

# From: https://github.com/dmotte/misc/blob/main/scripts/fetch-and-check.sh
fetch_and_check() {
    local c s; c="$(curl -fsSL "$1"; echo x)" && \
    s="$(echo -n "${c%x}" | sha256sum | cut -d' ' -f1)" && \
    if [ "$s" = "$2" ]; then echo -n "${c%x}"
    else echo "Checksum verification failed for $1: got $s, expected $2" >&2
    return 1; fi
}
