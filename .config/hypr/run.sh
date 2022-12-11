#!/bin/sh

cd ~

export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_SIZE=28

export __GL_GSYNC_ALLOWED=0
export __GL_VRR_ALLOWED=0
export __GLX_VENDOR_LIBRARY_NAME=nvidia

export WLR_DRM_NO_ATOMIC=1
export WLR_NO_HARDWARE_CURSORS=1
export GBM_BACKEND=nvidia-drm
export XDG_CURRENT_DESKTOP=Hyprland

# qt
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
#export DESKTOP_SESSION=gnome
# gtk
export GDK_BACKEND=wayland

export MOZ_ENABLE_WAYLAND=1

# xdg stuff
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

exec Hyprland > ~/.config/hypr/.hyprland.err 2>&1
