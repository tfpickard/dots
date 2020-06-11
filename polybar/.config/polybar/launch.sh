#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down

# Launch Polybar, using default config location ~/.config/polybar/config

for i in $(find /sys/class/net/); do
    echo $i
done
WLAN=$(find /sys/class/net/*/ -name wireless)
[[ ! -z $WLAN ]] && WLAN=$(echo $WLAN | cut -d'/' -f5)
echo $WLAN
ETH=$(find /sys/class/net/*/ -name carrier | grep -vE "$WLAN|lo|docker|vmn")
[[ ! -z $ETH ]] && ETH=$(echo $ETH | cut -d'/' -f5)
echo $ETH
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
export ETH
export WLAN

polybar -r default >/tmp/pb.log 2>&1 & 

echo "Polybar launched..."
