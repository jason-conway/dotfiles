#!/usr/bin/env bash

DST="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ `uname` == "Darwin" ]]; then
    SRC="$HOME/Library/Application Support/Code/User"
    PLATFORM="mac"
elif [[ `uname` == "Linux" ]]; then
    SRC="$HOME/.config/Code/User"
    PLATFORM="linux"
fi

if [ -d "$SRC" ]; then
    cp "$SRC/keybindings.json" "$DST/keybindings-$PLATFORM.json"
    cp "$SRC/settings.json" "$DST/settings-$PLATFORM.json"
fi
