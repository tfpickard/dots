#!/bin/sh

case "$1" in
    lock)
        ~/.config/i3/scripts/i3lockblur.sh
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        ~/.config/i3/scripts/i3lockblur.sh
        systemctl suspend
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|reboot|shutdown}"
        exit 2
esac

exit 0
