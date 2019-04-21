#!/usr/bin/env bash

# short bash script to return what's playing in a gui music player

if [ "$(playerctl -l 2>&1)" = "No players were found" ]; then
	echo -e "No players found"
	exit 0
fi

logical_title="$(playerctl metadata xesam:title)"
logical_album="$(playerctl metadata xesam:album)" 
artist="$(playerctl metadata xesam:artist)"
url="$(playerctl metadata xesam:url)"

local_title=""
local_album=""
if [[ "$url" == *"file:///"* ]]; then
	local_dir="${url%/*}"
	local_album="$(basename "$local_dir")"
	
	local_name="$(basename "$local_path")"
	local_title="${local_name%.*}"
elif [[ "$url" == *"http"* ]]; then
	output="Internet Radio: ${url#http*://}"
fi

# pick the shortest title
if [ ! "$local_title" = "" ] && [ "${#local_title}" -lt "${#logical_title}" ]; then
	title="$local_title"
else
	title="$logical_title"
fi

# pick the shortest album
if [ ! "$local_album" = "" ] && [ "${#local_album}" -lt "${#logical_album}" ]; then
	album="$local_album"
else
	album="$logical_album"
fi

[ "$output" = "" ] && output="$album - $title"

echo "$output"
