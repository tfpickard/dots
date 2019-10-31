#!/usr/bin/env bash

# xsetroot -solid '#eee8d5'

# random wallpaper
WALLPAPERDIR=$(dirname "$0")/wallpapers
WALLPAPER=`find $WALLPAPERDIR -type f | sort -R | head -n 1`
feh --bg-scale $WALLPAPER
