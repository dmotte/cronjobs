#!/bin/bash

set -e

cd "$(dirname "$0")"

content_expected='-----BEGIN CONTENT-----
MIT License

Copyright (c) 20XX dmotte (https://github.com/dmotte)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
-----END CONTENT-----'

repolist=$(find repos -mindepth 1 -maxdepth 1)

echo "$repolist" | while IFS= read -r i; do
    path=$i/LICENSE

    # We add BEGIN/END markers to work around the problem that "$(...)" removes
    # trailing newlines
    content_actual=$(
        echo '-----BEGIN CONTENT-----'
        sed -E 's|^(Copyright \(c\) 20)[0-9]{2}( dmotte \(https://github\.com/dmotte\))$|\1XX\2|' "$path"
        echo '-----END CONTENT-----'
    )

    echo "Checking license file $path"
    diff --color <(echo "$content_expected") <(echo "$content_actual")
done
