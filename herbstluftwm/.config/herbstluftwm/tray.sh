#!/usr/bin/env bash

source ./gruvbox_colors.sh

set $(herbstclient monitor_rect 0)

TRAY_GEOMETRY=5x1+$(($3 - 100))+0
stalonetray \
    --background "$GRUVBOX_DARK0" \
    --geometry $TRAY_GEOMETRY \
    --icon-size 20 \
    --kludges force_icons_size \
    2>&1 > /dev/null &
