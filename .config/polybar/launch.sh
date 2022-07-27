#!/bin/bash

# Terminate already running bar instances
killall -9 -w polybar 2>/dev/null

# kill all player scripts
pkill -f 'player-mpris-tail.py'

log_file=$HOME/.config/polybar/.polybar.err

#Launch Polybar on every monitor, using default config location ~/.config/polybar/config
for m in $(polybar --list-monitors | cut -d":" -f1); do
	# put a different bar on the laptop monitor (because it has a higher resolution)
    if [ "$m" = "DP-4" ] || [ "$m" = "eDP-1" ]; then
        bar_type="laptop"
    else
        bar_type="external"
	fi 
    MONITOR=$m polybar --log=trace -r $bar_type 2>&1 | ts "%Y-%m-%dT%H:%M:%S%z" > $HOME/.config/polybar/.polybar.$m.err &
done
