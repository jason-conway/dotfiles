#!/bin/sh

set -e

dconf load /org/gnome/terminal/legacy/profiles:/ < profiles.dconf
