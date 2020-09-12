#!/bin/sh

cat $HOME/.config/sxhkd/sxhkdrc | awk '/^[a-zA-Z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' | column -t -s $'\t' | rofi -dmenu -i -no-show-icons -location 0 -yoffset 0 -xoffset 0 -width 75 -theme ~/.config/rofi/themes/launcher.rasi
