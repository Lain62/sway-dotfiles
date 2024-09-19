#!/bin/sh
while :; 
do
	uptime_formatted=$(uptime | cut -d ',' -f1 | cut -d ' ' -f4,5)
	date_formatted=$(date "+%a %F")
	clock_formatted=$(date "+%H:%M")
	battery_status=$(cat /sys/class/power_supply/BAT1/status)
	battery_info=$(upower --show-info $(upower --enumerate |\
grep 'BAT') |\
egrep "percentage" |\
awk '{print $2}')
	echo Uptime $uptime_formatted \| Battery $battery_info \| $date_formatted \| $clock_formatted
	sleep 10
done

