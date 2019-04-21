#!/usr/bin/env bash

temp_digits="${1:-long}"

# to source user location as $airport var
. ~/.config/userlocation

report="$(weather -q "$airport")"

temperature="$(echo "$report" | grep -i temp | cut -d " " -f2-)"
temperature="${temperature/ F/°F}"
temperature="${temperature/ C/°C}"

if [ "$temp_digits" = "short" ]; then
	temperature="${temperature/.*°F/°F}"
	temperature="${temperature/.*°C/°C}"
fi

temperature_F="${temperature% (*}"

temperature_C="${temperature#*(}"
temperature_C="${temperature_C%)*}"

time="$(date +%H)"
weather="$(echo "$report" | grep -i "Weather:" | cut -d " " -f3-)"
sky_conditions="$(echo "$report" | grep -i sky | cut -d " " -f3-)"

if [ "$time" -gt "06" ] && [ "$time" -lt "18" ]; then #it's daytime
	
	if [ ! "$weather" = "" ]; then #weather is occuring
		case "$weather" in
			"light rain"|"rain")
				weather_icon=""
				;;
			*)
				weather_icon=""
				;;
		esac

	else # no weather is occuring; use sky conditions instead
		case "$sky_conditions" in
			"overcast"|"mostly cloudy")
				weather_icon=""
				;;
			"clear")
				weather_icon=""
				;;
			*)
				weather_icon=""
				;;
		esac
	fi

else #it's nighttime
	if [ ! "$weather" = "" ]; then #weather is occuring
		case "$weather" in
			"light rain"|"rain")
				weather_icon=""
				;;
		esac

	else # no weather is occuring; use sky conditions instead
		case "$sky_conditions" in
			"overcast"|"mostly cloudy")
				weather_icon=""
				;;
			"clear")
				weather_icon=""
				;;
			*)
				weather_icon=""
				;;
		esac
	fi

fi
	
echo "$weather_icon $temperature_F"
