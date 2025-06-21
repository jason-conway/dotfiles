#!/usr/bin/env bash

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DST="$HOME/Library/Application Support/Code/User"

if [ -d "$DST" ]; then
    cp "$SRC/keybindings.json" "$SRC/settings.json" "$DST/"
fi
