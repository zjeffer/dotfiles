export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

# PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.local/share/cargo/bin
export PATH=$PATH:$HOME/.dotnet/tools          # .NET Core SDK tools
export PATH=$PATH:$HOME/.local/share/gem/ruby/ # Ruby gem binaries

export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export EDITOR='nvim'
export ARCHFLAGS="-arch x86_64"
# export NVD_BACKEND=direct # nvidia-vaapi-driver envvar
export SSH_KEY_PATH="~/.ssh/rsa_id"

# aliases and expots to clean up ~ folder
source ~/.config/zsh/aliases.sh

### DISTRIBUTED COMPILATION ###
# export PATH="/usr/lib/distcc/bin:$PATH"
export DISCTCC_HOSTS="localhost/16,cpp,lzo 192.168.129.40/6,cpp,lzo"
export DISTCC_LOG="/tmp/distcc.log"
# export CC="distcc gcc"
# export CXX="distcc g++"


##########################        CLEAN UP HOME FOLDER       ##########################
# nvidia
export __GL_SHADER_DISK_CACHE_PATH=/tmp/zjeffer/nvidia/
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
# npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
# java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
#sqlite
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
alias sqlite3='sqlite3 -init "$XDG_CONFIG_HOME"/sqlite3/sqliterc'
#GTK2
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
#android
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ANDROID_AVD_HOME="$XDG_DATA_HOME"/android/
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android
#wget
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
#rust cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo
# jupyter / ipython
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
# disable less history file in ~/
export LESSHISTFILE="/dev/null"
# pylint
export PYLINTHOME="$XDG_CACHE_HOME"/pylint 
# atom
export ATOM_HOME="$XDG_DATA_HOME"/atom
# pylint.d
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
# conda
export CONDARC="$XDG_CONFIG_HOME/conda/condarc"
# azure
export AZURE_CONFIG_DIR=$XDG_DATA_HOME/azure 
# docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker 
# gnupg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
alias gpg2='gpg2 --homedir $GNUPGHOME'
# nuget
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
# wine
export WINEPREFIX="$HOME/Games/Wine"
# gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
# rustup
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

##########################        END OF CLEANUP ~/       ##########################
