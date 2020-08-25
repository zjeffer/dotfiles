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
### Bootloader
[rEFInd](https://wiki.archlinux.org/index.php/REFInd) with [Ursa-Major theme](https://github.com/kgoettler/ursamajor-rEFInd)

### Firefox
* Make Firefox ignore GTK theme:
  * Go to about:config, set `widget.content.gtk-theme-override` to something like `Breeze:light` (make sure Breeze theme is installed)
* Firefox: right click immediately picks the first option, fix:
  * Go to about:config, set `ui.context_menus.after_mouseup` to `true`.
 
### Other fixes
* Fix pulseaudio volume adjust delay: https://community.spotify.com/t5/Desktop-Linux/Delay-when-changing-volume/m-p/1843731#M2065
  * Set `enable-deferred-volume` to `no` (and uncomment) in `/etc/pulse/daemon.conf`. 

# Packages
### Bspwm
`yay -S bspwm-git sxhkd-git feh`
### Zsh
* `yay -S zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting`
* [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
### Vim
* `yay -S vim vim-plug neovim`
* `sudo npm install -g neovim`
* `python3 -m pip install --upgrade pynvim`
### Compton
`yay -S compton-tryone-git`
### Terminal
`yay -S gnome-terminal` with [Nord theme](https://github.com/arcticicestudio/nord-gnome-terminal)
### File manager
`yay -S thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman`
### Media
* `yay -S vlc vlc-pause-click-plugin`
* `yay -S qt5-tools` (needed for qdbus commands)
### Networking
`yay -S networkmanager networkmanager-applet nm-connection-editor`
### Themes
* `yay -S nordic-polar-theme-git nordic-theme-git`
* ``
* [Nord theme in vim](https://github.com/arcticicestudio/nord-vim)
* 
### Other packages
`yay -S npm python2 python ruby gem php xclip neofetch cava`
`yay -S kcolorchooser ksysguard spectacle simplescreenrecorder`


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
