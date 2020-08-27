# dotfiles

These are my dotfiles for my bspwm rice, using Arch Linux

More info below images.

![](https://i.imgur.com/7zpJ2LV.png )
![](https://i.imgur.com/SyDqUAx.png )
![](https://i.imgur.com/J96wPsY.png )
![](https://i.imgur.com/zbRIV7P.png )
![](https://i.imgur.com/lJjJqPO.png )
![](https://i.imgur.com/tzLfn8v.png )
![](https://i.imgur.com/msiNUed.png )


# Packages
### Bspwm
`yay -S bspwm-git sxhkd-git feh xorg xorg-server xorg-xinit xinit-xsession`

### LightDM
* `yay -S lightdm lightdm-webkit2-greeter lightdm-theme-litarvan`
* In `/etc/lightdm/lightdm.conf`:
	* `greeter-session=lightdm-webkit2-greeter`
	* `session-wrapper=/etc/lightdm/Xsession`
	* `display-setup-script=/etc/lightdm/display_setup.sh`
* In `/etc/lightdm/lightdm-webkit2-greeter.conf`:
	* `webkit_theme = litarvan`
### Bootloader
* [rEFInd](https://wiki.archlinux.org/index.php/REFInd) with [Ursa-Major theme](https://github.com/kgoettler/ursamajor-rEFInd)
* yay -S `refind intel-ucode efibootmgr`

### Zsh
* `yay -S zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting`
* [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)

### Pacman/yay
* Get `yay` from [here](https://github.com/Jguer/yay)
* Uncomment `Color` in `/etc/pacman.conf`
* Enable the multilib repo in `/etc/pacman.conf`

### Vim
* `yay -S vim vim-plug neovim`
* `sudo npm install -g neovim`
* `python3 -m pip install --upgrade pynvim`
* `gem install neovim`

### Compton
`yay -S compton-tryone-git`

### Firefox
* `yay -S firefox`
* Make Firefox ignore GTK theme:
	* Go to about:config, set `widget.content.gtk-theme-override` to something like `Breeze:light` (make sure Breeze theme is installed)
* Right click immediately picks the first option, fix:
	* Go to about:config, set `ui.context_menus.after_mouseup` to `true`.
* Disable full screen warning: 
	* Go to about:config, set `full-screen-api.warning.timeout` to 0
### Terminal
`yay -S gnome-terminal` 

### File manager
`yay -S thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman gvfs ntfs-3g tumbler`
`yay -S ranger highlight w3m`

### Media
* `yay -S vlc vlc-pause-click-plugin`
* `yay -S qt5-tools` (needed for qdbus commands)
* `yay -S pulseaudio pulseaudio-ctl pulseaudio-alsa alsa-libs pavucontrol`

#### Fix pulseaudio volume adjust delay
* https://community.spotify.com/t5/Desktop-Linux/Delay-when-changing-volume/m-p/1843731#M2065
* Set `enable-deferred-volume` to `no` (and uncomment) in `/etc/pulse/daemon.conf`. 

### Networking
`yay -S networkmanager networkmanager-applet nm-connection-editor`

### Themes
* `yay -S nordic-polar-theme-git nordic-theme-git`
* [Nord theme in gnome-terminal](https://github.com/arcticicestudio/nord-gnome-terminal)
* [Nord theme in vim](https://github.com/arcticicestudio/nord-vim)
* `yay -S qt5-styleplugins`
* `yay -S xcursor-breeze` for Breeze (light and dark) cursor theme
* `yay -S plasma-browser-integration` for media control in the browser
* `yay -S lxappearance` to set the global theme, icon theme and cursor theme.

### Spotify
* `yay -S spotify spicetify-cli`
* Set spotify data file to folder on different drive: [Solution](https://community.spotify.com/t5/Desktop-Linux/Spotify-downloads-to-the-wrong-folder/m-p/4854706/highlight/true#M19161)

### Mouse driver (Logitech G502)
`yay -S piper-git`

### GPU Drivers
`yay -S nvidia nvidia-utils lib32-nvidia-utils`

### CPU settings
* `yay -S cpupower`
* Set `governor='performance'` in `/etc/default/cpupower` to change the default governor.
* Enable the service at boot: `sudo systemctl enable cpupower.service`

### Other packages
`yay -S git npm python2 python ruby php xclip neofetch cava kcolorchooser ksysguard spectacle simplescreenrecorder htop gparted numlockx redshift xcape powerline powerline-common powerline-fonts polkit-kde-agent light gucharmap`

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
* ttf-unifont
* noto-fonts
* noto-fonts-emoji
* nerd-fonts-hermit
* powerline-fonts
