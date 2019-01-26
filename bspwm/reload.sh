#!/bin/sh


killall xcape 2>/dev/null
killall compton 2>/dev/null
killall dunst 2>/dev/null
killall xbindkeys 2>/dev/null

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

xrandr --output eDP-1-1 --primary
monitorName=`cat /sys/devices/pci0000:00/0000:00:02.0/drm/card1/card1-HDMI-A-1/edid | parse-edid  | grep -i "modelname" | sed "s/\\tModelName //gi" | sed "s/\"//g"`
if [[ $monitorName -eq 'K222HQL' ]]; then
	xrandr --output HDMI-1-1 --above  eDP-1-1
else
	xrandr --output HDMI-1-1 --right-of eDP-1-1
fi
unset monitorName

xinput set-prop "SynPS/2 Synaptics TouchPad" 'libinput Tapping Enabled' 1
xinput set-prop "SynPS/2 Synaptics TouchPad" 'libinput Natural Scrolling Enabled' 1

for mouse in `xinput | grep 'Corsair' | grep 'pointer' | sed 's/.*id=\([0-9]*\).*/\1/g'`; do
	xinput set-prop $mouse "libinput Accel Profile Enabled" 0, 1 2>~/.config/sxhkd/.sxhkd.err
done
unset mouse

bspc monitor eDP-1-1 -d  1 2 3 4
bspc monitor HDMI-1-1 -d 5 6 7 8
bspc wm -O eDP-1-1 HDMI-1-1

feh --bg-fill ~/Pictures/DnA7hZgU8AAxfxC.jpg:large.jpg &

pkill -USR1 -x sxhkd &
~/.config/polybar/launch.sh &
libinput-gestures-setup restart &
xcape -e 'Super_L=Super_L|space' &
compton --config ~/.config/compton.conf 2>~/.config/.compton.err &
xbindkeys &
