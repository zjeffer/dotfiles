
# check if already locked
if pgrep -x "swaylock" > /dev/null; then
    echo "Screen is already locked"
    exit 1
fi

# pause all players
playerctl --all-players pause

swaylock --image $HOME/Pictures/Wallpapers/wallpaper_blurred.png
