#!/usr/bin/env bash

source ./gruvbox_colors.sh
font="Fira Code:pixelsize=11"

function uniq_linebuffered() {
    awk -W interactive '$0 != l { print ; l=$0 ; fflush(); }' "$@"
}

# disable path name expansion or * will be expanded in the line
# cmd=( $line )

statusbar_height=20
monitor=${1:-0}
geometry=( $(herbstclient monitor_rect "$monitor") )
if [ -z "$geometry" ] ;then
    echo "Invalid monitor $monitor"
    exit 1
fi
# geometry has the format: WxH+X+Y
x=${geometry[0]}
y=$((${geometry[3]} - $statusbar_height))
screen_width=${geometry[2]}
panelGeometry=${geometry[2]}x${statusbar_height}+${x}+${y}
{
    conky -c /home/tom/.config/herbstluftwm/conkyrc | while read -r; do
        echo -e "$REPLY";
    done > >(uniq_linebuffered)  &
    childpid=$!
    herbstclient --idle
    kill $childpid
} 2> /dev/null | {
    while true ; do
        read line || break
        cmd=( $line )
        # find out event origin
        case "${cmd[0]}" in
	        focus_changed|window_title_changed|tag_changed|tag_flags)
                ;;
            quit_panel)
                exit
                ;;
            reload)
                exit
                ;;
            *)
                echo $line
                ;;
        esac
    done
} 2> /dev/null \
    | lemonbar \
        -g $panelGeometry \
        -f "$font" \
        -B $GRUVBOX_DARK0 -F $GRUVBOX_LIGHT0 \
        -u 2
