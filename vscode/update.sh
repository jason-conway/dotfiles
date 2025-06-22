#!/usr/bin/env bash

DST="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


if [[ `uname` == "Darwin" ]]; then
    SRC="$HOME/Library/Application Support/Code/User"
elif [[ `uname` == "Linux" ]]; then
    SRC="$HOME/.config/Code/User"
fi

if [ -d "$SRC" ]; then
    cp "$SRC/keybindings.json" "$SRC/settings.json" "$DST/"
fi
