#!/bin/bash

# Terminate already running bar instances
killall polybar 2>/dev/null

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null
do 
	pkill polybar 2>/dev/null
	sleep 0.5
done

#Launch Polybar on every monitor, using default config location ~/.config/polybar/config
for m in $(polybar --list-monitors | cut -d":" -f1); do
	# put a different bar on the laptop monitor (because it has a higher resolution)
	if [ "$m" = "DP-4" ] || [ "$m" = "eDP-1" ]; then
		MONITOR=$m polybar -r laptop 2>>~/.config/polybar/.polybar.err &
	else
		MONITOR=$m polybar -r custom 2>>~/.config/polybar/.polybar.err &
	fi
done
