#!/bin/bash

WAYBAR_FOLDER="$HOME/.config/hypr/apps/waybar"
CONFIG_PATH="$WAYBAR_FOLDER/config.jsonc"
STYLE_PATH="$WAYBAR_FOLDER/style.css"
# space-separated string of files to watch
CONFIG_FILES="$CONFIG_PATH $STYLE_PATH"

# kill waybar when this script exits
trap "pkill -f media-player.py -9 2>/dev/null && killall waybar 2>/dev/null" EXIT

while true; do
    waybar --config $CONFIG_PATH --style $STYLE_PATH 2>$WAYBAR_FOLDER/.waybar.err &
    inotifywait -e create,modify $CONFIG_FILES
    pkill -f media-player.py 2>/dev/null
    killall waybar 2>/dev/null
done
