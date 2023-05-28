#!/bin/bash

WAYBAR_FOLDER="$HOME/.config/hypr/apps/waybar"
CONFIG_PATH="$WAYBAR_FOLDER/config.jsonc"
STYLE_PATH="$WAYBAR_FOLDER/style.css"
# space-separated string of files to watch
CONFIG_FILES="$CONFIG_PATH $STYLE_PATH"

trap "killall waybar" EXIT

while true; do
    waybar --config $CONFIG_PATH --style $STYLE_PATH 2>$WAYBAR_FOLDER/.waybar.err &
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
