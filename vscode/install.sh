#!/usr/bin/env bash

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ `uname` == "Darwin" ]]; then
    DST="$HOME/Library/Application Support/Code/User"
elif [[ `uname` == "Linux" ]]; then
    DST="$HOME/.config/Code/User"
fi

if [ -d "$DST" ]; then
    cp "$SRC/keybindings.json" "$SRC/settings.json" "$DST/"
fi
