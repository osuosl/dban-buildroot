#!/bin/sh
INTERVAL=0.2

trap "setleds -num -caps -scroll; exit" EXIT INT TERM

STATE=off
while true; do
	sleep $INTERVAL
	if [ "$STATE" = "off" ]; then
		setleds +num +caps +scroll 2>/dev/null
		STATE=on
	else
		setleds -num -caps -scroll 2>/dev/null
		STATE=off
	fi
done
