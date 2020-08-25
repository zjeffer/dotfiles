# dotfiles

These are my dotfiles for my bspwm rice, using Arch Linux

![](https://i.imgur.com/7zpJ2LV.png )
![](https://i.imgur.com/SyDqUAx.png )
![](https://i.imgur.com/J96wPsY.png )
![](https://i.imgur.com/zbRIV7P.png )
![](https://i.imgur.com/lJjJqPO.png )
![](https://i.imgur.com/tzLfn8v.png )
![](https://i.imgur.com/msiNUed.png )

# Configurations and fixes
* Bootloader: [rEFInd](https://wiki.archlinux.org/index.php/REFInd) with [Ursa-Major theme](https://github.com/kgoettler/ursamajor-rEFInd)
* Fix pulseaudio volume adjust delay: https://community.spotify.com/t5/Desktop-Linux/Delay-when-changing-volume/m-p/1843731#M2065
  * Set `enable-deferred-volume` to `no` (and uncomment) in `/etc/pulse/daemon.conf`. 
* Make Firefox ignore GTK theme:
  * Go to about:config, set `widget.content.gtk-theme-override` to something like `Breeze:light` (make sure Breeze theme is installed)
* Firefox: right click immediately picks the first option, fix:
  * 

# Packages
## Bspwm
`yay -S bspwm-git sxhkd-git`
## Zsh
`yay -S zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting`
## Vim
`yay -S vim vim-plug neovim`
## Compton
`yay -S compton-tryone-git`
## Gnome-terminal
`yay -S gnome-terminal` with [Nord theme](https://github.com/arcticicestudio/nord-gnome-terminal)




# Fonts:
* ttf-bitstream-vera 
* ttf-dejavu 
* ttf-droid 
* ttf-font-awesome 
* ttf-hack
* ttf-inconsolata
* ttf-liberation 
* ttf-material-icons-git
* ttf-roboto
* noto-fonts
* noto-fonts-emoji
* nerd-fonts-hermit
* powerline-fonts
