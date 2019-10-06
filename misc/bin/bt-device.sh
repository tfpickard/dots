#!/usr/bin/env bash

bt_devices="$(bt-device -l | grep "(" | cut -d '(' -f2- | sed 's/)//' )"

for device in $bt_devices; do
	device_info="$(bt-device -i "$device")"

	device_name="$(echo "$device_info" | grep -i name | cut -d " " -f4- )" 
	connected_status="$(echo "$device_info" | grep -i "connected" | cut -d " " -f2-)"
	
	case "$connected_status" in
		*1*)
			connected=true
			;;
		*0*)
			connected=false
			;;
	esac
	[ "$connected" = true ] && output+="$device_name"
done

echo "$output"
