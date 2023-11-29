#!/bin/bash

set -e

for i in jobs/*.sh; do
    echo "::group::$i"
        bash "$i"
    echo '::endgroup::'
done
