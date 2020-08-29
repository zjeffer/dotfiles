#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96
xsetroot -cursor_name left_ptr

# xrandr --output eDP-1-1 --primary
# xrandr --output HDMI-1-1 --right-of eDP-1-1
# xrandr --output DP-1-1 --left-of eDP-1-1

#turn off screen saver
xset s off -dpms

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

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi



#intellij
export _JAVA_AWT_WM_NONREPARENTING=1

export QT_STYLE_OVERRIDE=gtk2

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

exec /usr/lib/polkit-kde-authentication-agent-1 &
exec light-locker &

exec bspwm 2>>~/.config/bspwm/.bspwm.err

