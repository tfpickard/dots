#!/bin/zsh
kil() {
    killall $1 1>/dev/null 2>&1 ; $@ >/tmp/$1.log 2>&1 &
}

