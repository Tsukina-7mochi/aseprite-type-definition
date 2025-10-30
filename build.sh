#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

DIST_DIR="./dist"

mkdir -p "$DIST_DIR"

cat ./definitions/init.lua ./definitions/app.lua > "$DIST_DIR/aseprite.lua"

for file in ./definitions/*.lua; do
    if [[ "$file" == "./definitions/init.lua" ]]; then
        continue
    elif [[ "$file" == "./definitions/app.lua" ]]; then
        continue
    fi

    tail -n +2 "$file"
done >> "$DIST_DIR/aseprite.lua"
