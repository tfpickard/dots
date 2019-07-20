#!/usr/bin/env sh
kil () {
 killall $1 || sleep 1 && kil $1
}

killall polybar

lfile="/tmp/pb.log"
[[ -f $lfile ]] && rm -f $lfile
touch $lfile
for m in $(polybar -m | cut -d':' -f1); do
    MONITOR=$m polybar top -r >> $lfile 2>&1 & disown
    MONITOR=$m polybar bottom -r >> $lfile 2>&1 & disown
done

