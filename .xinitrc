#!/bin/sh

while true
do
	LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
	IP=$(for i in `ip r`; do echo $i; done | grep -A 1 src | tail -n1) # can get confused if you use vmware
	TEMP="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

        BAT="Bat. $(cat /sys/class/power_supply/BAT1/capacity)"
		xsetroot -name "$IP $BAT $TEMP $LOCALTIME "
	sleep 20s
done &

exec i3
