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

# Special thanks

* adi1090x: https://github.com/adi1090x for his amazing work with customization
* `/r/unixporn`: http://www.reddit.com/r/unixporn and their discord
* The Nord theme creators at https://www.nordtheme.com

# Packages
### Bspwm
`paru -S bspwm-git sxhkd-git feh xorg xorg-server xorg-xinit xinit-xsession`

### LightDM
* `paru -S lightdm lightdm-webkit2-greeter lightdm-theme-litarvan`
* In `/etc/lightdm/lightdm.conf`:
	* `greeter-session=lightdm-webkit2-greeter`
	* `session-wrapper=/etc/lightdm/Xsession`
	* `display-setup-script=/etc/lightdm/display_setup.sh`
* In `/etc/lightdm/lightdm-webkit2-greeter.conf`:
	* `webkit_theme = litarvan`
### Bootloader
* [rEFInd](https://wiki.archlinux.org/index.php/REFInd) with [Ursa-Major theme](https://github.com/kgoettler/ursamajor-rEFInd)
* `paru -S refind intel-ucode efibootmgr`
* `sudo refind-install`
* Boot options: `root=/dev/nvme0n1p1 rw quiet splash loglevel=4 vga=current udev.log_priority=3 vt.global_cursor_default=0 nvidia-drm.modeset=1 nowatchdog audit=0 initrd=intel-ucode.img`

### Zsh
* `paru -S zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting`
* [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
* [powerlevel10k](https://github.com/romkatv/powerlevel10k#get-started)

### Pacman/paru
* Get `paru` from [here](https://github.com/Jguer/paru)
* Uncomment `Color` in `/etc/pacman.conf`
* Enable the multilib repo in `/etc/pacman.conf`

### Vim
* `paru -S vim vim-plug neovim`
* `sudo npm install -g neovim`
* `python3 -m pip install --upgrade pynvim`
* `gem install neovim`

### Compton
`paru -S picom-tryone-git`

### Firefox
* `paru -S firefox`
* Make Firefox ignore GTK theme:
	* Go to about:config, set `widget.content.gtk-theme-override` to something like `Breeze:light` (make sure Breeze theme is installed).
* Right click immediately picks the first option, fix:
	* Go to about:config, set `ui.context_menus.after_mouseup` to `true`.
* Disable full screen warning: 
	* Go to about:config, set `full-screen-api.warning.timeout` to `0`.
* Enable GFX webrender:
	* Go to about:config, set `gfx.webrender.all` to `true`.
### Terminal
`paru -S gnome-terminal` 

### File manager
* `paru -S thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman gvfs ntfs-3g tumbler`
* `paru -S ranger highlight w3m`
* Add `inode/directory=thunar.desktop` to `~/.config/mimeapps.list` under `[Default Applications]` 

### Media
* `paru -S vlc vlc-pause-click-plugin`
* `paru -S qt5-tools` (needed for qdbus commands)
* `paru -S pulseaudio pulseaudio-ctl pulseaudio-alsa alsa-libs pavucontrol`

#### Fix pulseaudio volume adjust delay
* https://community.spotify.com/t5/Desktop-Linux/Delay-when-changing-volume/m-p/1843731#M2065
* Set `enable-deferred-volume` to `no` (and uncomment) in `/etc/pulse/daemon.conf`. 

### Networking
`paru -S networkmanager networkmanager-applet nm-connection-editor`

### Themes
* `paru -S nordic-polar-theme-git nordic-theme-git`
* [Nord theme in gnome-terminal](https://github.com/arcticicestudio/nord-gnome-terminal)
* [Nord theme in vim](https://github.com/arcticicestudio/nord-vim)
* `paru -S qt5-styleplugins`
* `paru -S xcursor-breeze` for Breeze (light and dark) cursor theme
* `paru -S plasma-browser-integration` for media control in the browser
* `paru -S lxappearance` to set the global theme, icon theme and cursor theme.

### Spotify
* `paru -S spotify spicetify-cli spicetify-themes-git`
* Fix permissions: [Solution](https://github.com/khanhas/spicetify-cli/wiki/Installation#spotify-installed-from-aur)
* Set spotify data file to folder on different drive: [Solution](https://community.spotify.com/t5/Desktop-Linux/Spotify-downloads-to-the-wrong-folder/m-p/4854706/highlight/true#M19161)

### Mouse driver (Logitech G502)
`paru -S piper-git`

### GPU Drivers
`paru -S nvidia nvidia-utils lib32-nvidia-utils`

Enable DRM KMS to eliminate tearing: https://wiki.archlinux.org/index.php/NVIDIA#DRM_kernel_mode_setting.
Don't forget the pacman hook!

### CPU settings
* `paru -S cpupower`
* Set `governor='performance'` in `/etc/default/cpupower` to change the default governor.
* Enable the service at boot: `sudo systemctl enable cpupower.service`

### Other
* `paru -S git npm python2 python ruby php xclip neofetch cava kcolorchooser ksysguard spectacle simplescreenrecorder htop gparted numlockx redshift xcape powerline powerline-common powerline-fonts polkit-kde-agent light gucharmap`
* Stop rtkit-daemon log spam: 
	* Create `/etc/systemd/system/rtkit-daemon.service.d/override.conf`
	```
	[Service]
	LogLevelMax=notice
	```
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
