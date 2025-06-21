#!/usr/bin/env bash

DST="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SRC="$HOME/Library/Application Support/Code/User"

if [ -d "$SRC" ]; then
    cp "$SRC/keybindings.json" "$SRC/settings.json" "$DST/"
fi
