#!/bin/sh

xrandr --auto
xsetroot -cursor_name left_ptr

#turn off screen saver
xset s off -dpms

# change repeating speed
xset r rate 200 30

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# tiling wm stuff
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME=qt6ct
export DESKTOP_SESSION=gnome

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

export MOZ_DISABLE_RDD_SANDBOX=1

export VULKAN_SDK=/usr/lib/vulkansdk/x86_64/

# hardware acceleration
export LIBVA_DRIVER_NAME=nvidia

# fix bug with slow starting of applictions
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# gui keyring unlocking
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTO_SOCK
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

exec bspwm 2>>~/.config/bspwm/.bspwm.err
