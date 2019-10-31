#!/usr/bin/env bash
set -e

hc() {
    herbstclient "$@"
}

hc keyunbind --all

# keybindings
Mod=Mod4

hc keybind $Mod-Control-q quit
hc keybind $Mod-Shift-q close
hc keybind $Mod-Shift-r reload

# tags
TAG_NAMES=( {1..9} 0 )
TAG_KEYS=( {1..9} 0 )

hc rename default "${TAG_NAMES[0]}" || true
for i in ${!TAG_NAMES[@]} ; do
    hc add "${TAG_NAMES[$i]}"
    key="${TAG_KEYS[$i]}"
    if ! [ -z "$key" ] ; then
        hc keybind "$Mod-$key" use_index "$i"
        hc keybind "$Mod-Shift-$key" move_index "$i"
    fi
done

# cycle through tags
hc keybind $Mod-period use_index +1 --skip-visible
hc keybind $Mod-comma  use_index -1 --skip-visible
hc keybind $Mod-Right use_index +1 --skip-visible
hc keybind $Mod-Left  use_index -1 --skip-visible
hc keybind $Mod-minus use_previous

# layouting
hc keybind $Mod-r remove

hc keybind $Mod-space cycle_layout 1 grid horizontal max vertical

hc keybind $Mod-e split explode

hc keybind $Mod-u split vertical 0.5
hc keybind $Mod-Shift-u split vertical 0.66

hc keybind $Mod-o split horizontal 0.5
hc keybind $Mod-Shift-o split horizontal 0.666

hc keybind $Mod-s floating toggle
hc keybind $Mod-f fullscreen toggle
hc keybind $Mod-p pseudotile toggle

# resizing
RESIZESTEP=0.02
hc keybind $Mod-Control-h resize left +$RESIZESTEP
hc keybind $Mod-Control-j resize down +$RESIZESTEP
hc keybind $Mod-Control-k resize up +$RESIZESTEP
hc keybind $Mod-Control-l resize right +$RESIZESTEP

# mouse in floating mode
hc mouseunbind --all
hc mousebind $Mod-Button1 move
hc mousebind $Mod-Button2 zoom
hc mousebind $Mod-Button3 resize

# focus
hc set focus_follows_mouse 1
hc rule focus=on
hc keybind $Mod-BackSpace   cycle_monitor
hc keybind $Mod-Tab         cycle_all +1
hc keybind $Mod-Shift-Tab   cycle_all -1
hc keybind $Mod-c cycle
hc keybind $Mod-h focus left
hc keybind $Mod-j focus down
hc keybind $Mod-k focus up
hc keybind $Mod-l focus right
hc keybind $Mod-i jumpto urgent
hc keybind $Mod-Shift-h shift left
hc keybind $Mod-Shift-j shift down
hc keybind $Mod-Shift-k shift up
hc keybind $Mod-Shift-l shift right


hc keybind $Mod-d spawn rofi -show drun -show-icons

hc keybind $Mod-Return spawn ~/bin/term
hc keybind $Mod-Shift+Return spawn ". ~/.slack && kitty --class weechat --title weechat weechat"

hc keybind XF86AudioRaiseVolume spawn pactl -- set-sink-volume 0 +5%
hc keybind XF86AudioLowerVolume spawn pactl -- set-sink-volume 0 -5%
hc keybind XF86AudioMute spawn pactl -- set-sink-mute 0 toggle

hc keybind XF86MonBrightnessUp spawn light -A 2 # increase screen brightness
hc keybind XF86MonBrightnessDown spawn light -U 2 # decrease screen brightness
hc keybind Shift+XF86MonBrightnessUp spawn light -S 100% # increase screen brightness
hc keybind Shift+XF86MonBrightnessDown spawn light -r -S 2 # decrease screen brightness
