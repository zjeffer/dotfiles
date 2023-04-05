#!/bin/zsh

source ~/.config/zsh/.zshrc

cd ~

exec Hyprland > ~/.config/hypr/.hyprland.err 2>&1
