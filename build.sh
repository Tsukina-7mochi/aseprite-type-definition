#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

DIST_DIR="./dist"

mkdir -p "$DIST_DIR"

cat ./definitions/init.lua > "$DIST_DIR/aseprite.lua"

for file in ./definitions/*.lua; do
    if [[ "$file" != "./definitions/init.lua" ]]; then
        tail -n +2 "$file"
    fi
done >> "$DIST_DIR/aseprite.lua"
