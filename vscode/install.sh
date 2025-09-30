#!/usr/bin/env bash

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ `uname` == "Darwin" ]]; then
    DST="$HOME/Library/Application Support/Code/User"
    PLATFORM="mac"
elif [[ `uname` == "Linux" ]]; then
    DST="$HOME/.config/Code/User"
    PLATFORM="linux"
fi

if [ -d "$DST" ]; then
    if [ -f "$SRC/keybindings-$PLATFORM.json" ]; then
        cp "$SRC/keybindings-$PLATFORM.json" "$DST/keybindings.json"
    fi
    
    if [ -f "$SRC/settings-$PLATFORM.json" ]; then
        cp "$SRC/settings-$PLATFORM.json" "$DST/settings.json"
    fi
fi
