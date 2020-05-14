#!/usr/bin/env sh
kil () {
 killall $1 || sleep 1 && kil $1
}

pgrep polybar && killall polybar

W=$(xdpyinfo | awk -F'[ x]+' '/dimensions:/{print $3}' )
OFFSET=10
#W=$(echo "(0.9 * $W)/1" | bc)
WOFFSET=$((W - 2*$OFFSET))
echo $W
H=$(xdpyinfo | awk -F'[ x]+' '/dimensions:/{print $4}')
lfile="/tmp/pb.log"
[[ -f $lfile ]] && rm -f $lfile
touch $lfile
for m in $(polybar -m | cut -d':' -f1); do
    echo $OFFSET $WOFFSET
    MONITOR=$m XOFF=$OFFSET XWIDTH=$WOFFSET YRES=$H \
        polybar top -r >> $lfile 2>&1 & disown
#    MONITOR=$m polybar bottom -r >> $lfile 2>&1 & disown
done
sleep 1
bspc config top_padding 40
bspc config left_padding 0
bspc config right_padding 0
bspc config window_gap 10
