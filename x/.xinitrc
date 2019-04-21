#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
lfile="/tmp/xinit.log"
touch $lfile

reload_dunst() {
    pkill dunst
    dunst & #\
	#-frame_width 0 \
    #    -lb "${color0}" \
    #    -nb "${color0}" \
    #    -cb "${color0}" \
    #    -lf "${color7}" \
    #    -bf "${color7}" \
    #    -cf "${color7}" \
    #    -nf "${color7}" &
}


if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
. ~/.profile


~/bin/kb
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
#autorandr --change --force --debug >> $lfile 2>&1
#xset +fp /usr/share/fonts/local &
#xset fp rehash &
xsetroot -cursor_name left_ptr >> $lfile 2>&1
#. "${HOME}/.cache/wal/colors.sh"
kil compton >> $lfile 2>&1
kil redshift >> $lfile 2>&1


#numlockx &
#unclutter &
#xbindkeys &
#nitrogen --restore &
#lxpolkit &
#parcellite &
#urxvtd -q -o -f
xscreensaver -nosplash &
#exec herbstluftwm --locked
#~/bin/monitors 5 >> $lfile 2>&1 &
#~/bin/wp >> $lfile 2>&1
exec bspwm > /tmp/bspwm.log 2>&1

