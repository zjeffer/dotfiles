#!/bin/sh


killall xcape 2>/dev/null
killall picom 2>/dev/null
killall dunst 2>/dev/null
killall xbindkeys 2>/dev/null

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

xrandr --output eDP1 --primary
xrandr --output HDMI1 --right-of eDP1
xrandr --output DP1 --left-of eDP1

xinput set-prop "SynPS/2 Synaptics TouchPad" 'libinput Tapping Enabled' 1
xinput set-prop "SynPS/2 Synaptics TouchPad" 'libinput Natural Scrolling Enabled' 1

for mouse in `xinput | grep 'Logitech' | grep 'pointer' | sed 's/.*id=\([0-9]*\).*/\1/g'`; do
	xinput set-prop $mouse "libinput Accel Profile Enabled" 0, 1 2>/dev/null
	xinput set-prop $mouse "libinput Accel Speed" -0.5 2>/dev/null
done
unset mouse

bspc monitor eDP1 -d  1 2 3 4 5
bspc monitor HDMI1 -d 1 2 3 4 5
bspc monitor DP1 -d 1 2 3 4 5
bspc wm -O DP1 eDP1 HDMI1

xrandr --output eDP1 --set "Broadcast RGB" "Full"
xrandr --output HDMI1 --set "Broadcast RGB" "Full"
xrandr --output DP1 --set "Broadcast RGB" "Full"


feh --bg-fill ~/Pictures/trees.jpg &

bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off
bspc rule -a spectacle floating=on follow=on
bspc rule -a 'Friends List' state=floating
bspc rule -a 'Steam - News' state=floating
bspc rule -a Wfica_Seamless state=floating
bspc rule -a 'Citrix maximized probe window' state=floating
#bspc rule -a '*:libreofficedev' state=tiled
#bspc rule -a '*:soffice' state=floating
bspc rule -a mijnlieff.Mijnlieff state=floating
bspc rule -a mijnlieff.interactive.matchmaking.Matchmaking state=floating
bspc rule -a mijnlieff.* state=floating
bspc rule -a mijnlieff.interactive.boardConfiguration.BoardConfiguration state=floating
bspc rule -a simplescreenrecorder state=floating


pkill -USR1 -x sxhkd &
~/.config/polybar/launch.sh &
libinput-gestures-setup restart &
xcape -e 'Super_L=Super_L|space' &
picom --config ~/.config/compton.conf 2>~/.config/.compton.err &
xbindkeys &>~/.config/bspwm/.reload.err
