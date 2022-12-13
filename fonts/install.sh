#!/bin/sh

set -e

cp -r ./JetBrainsMono/ /usr/share/fonts/
cp -r ./IBM-Plex-Mono/ /usr/share/fonts/

fc-cache -f -v