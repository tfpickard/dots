#!/bin/bash

case $1 in
    "wifi")
        iwconfig 2>/dev/null | \
            grep -oE "ESSID:\".*\"" | \
            tr -d \" | cut -d: -f2
        ;;
    *)
        echo "fail"
        ;;
esac
exit $?
