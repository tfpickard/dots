#!/bin/bash
img="/tmp/i3lockblur.png"
icon="$HOME/.config/i3/scripts/lock-icon.png"
scrot $img
    #pixel
convert $img -scale 10% -scale 1000% $img
    #blur
#convert $img -blur 0x4 $img
convert $img $icon -gravity center -composite $img
i3lock -u -i $img
rm $img
