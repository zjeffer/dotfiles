#!/bin/bash

# space-separated string of files to watch
CONFIG_FILES="$HOME/.config/hypr/apps/waybar/config.jsonc $HOME/.config/hypr/apps/waybar/style.css"

trap "killall waybar" EXIT

while true; do
    waybar --config ~/.config/hypr/apps/waybar/config.jsonc &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
