#!/bin/bash

# Terminate already running bar instances
killall polybar 2>~/.config/polybar/.polybar.err

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null
do 
	pkill polybar 2>~/.config/polybar/.polybar.err
	sleep 0.5
done

#Launch Polybar on every monitor, using default config location ~/.config/polybar/config
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar -r custom 2>>~/.config/polybar/.polybar.err &
done