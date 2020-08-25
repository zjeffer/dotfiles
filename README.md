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
### Firefox
* Make Firefox ignore GTK theme:
  * Go to about:config, set `widget.content.gtk-theme-override` to something like `Breeze:light` (make sure Breeze theme is installed)
* Firefox: right click immediately picks the first option, fix:
  * Go to about:config, set `ui.context_menus.after_mouseup` to `true`.

### Pacman/yay
* Get `yay` from [here](https://github.com/Jguer/yay)
* Uncomment `Color` in `/etc/pacman.conf`
* 

### Other fixes
* Fix pulseaudio volume adjust delay: https://community.spotify.com/t5/Desktop-Linux/Delay-when-changing-volume/m-p/1843731#M2065
  * Set `enable-deferred-volume` to `no` (and uncomment) in `/etc/pulse/daemon.conf`. 

# Packages
### Bspwm
`yay -S bspwm-git sxhkd-git feh xorg-server xorg-xinit xinit-xsession`
### LightDM
`yay -S lightdm lightdm-webkit2-greeter lightdm-theme-litarvan`
### Bootloader
* [rEFInd](https://wiki.archlinux.org/index.php/REFInd) with [Ursa-Major theme](https://github.com/kgoettler/ursamajor-rEFInd)
* yay -S `refind intel-ucode efibootmgr
### Zsh
* `yay -S zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting`
* [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
### Vim
* `yay -S vim vim-plug neovim`
* `sudo npm install -g neovim`
* `python3 -m pip install --upgrade pynvim`
* `gem install neovim`
* ``
### Compton
`yay -S compton-tryone-git`
### Terminal
`yay -S gnome-terminal` with [Nord theme](https://github.com/arcticicestudio/nord-gnome-terminal)
### File manager
`yay -S thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman gvfs ntfs-3g`
### Media
* `yay -S vlc vlc-pause-click-plugin`
* `yay -S qt5-tools` (needed for qdbus commands)
### Networking
`yay -S networkmanager networkmanager-applet nm-connection-editor`
### Themes
* `yay -S nordic-polar-theme-git nordic-theme-git`

* [Nord theme in vim](https://github.com/arcticicestudio/nord-vim)
### GPU Drivers
`yay -S nvidia nvidia-utils lib32-nvidia-utils`
### Other packages
`yay -S git npm python2 python ruby php xclip neofetch cava kcolorchooser ksysguard spectacle simplescreenrecorder htop gparted numlockx`

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
