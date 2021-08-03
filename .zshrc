# a lot of the exports are because of this:
# https://wiki.archlinux.org/title/XDG_Base_Directory

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Add .NET Core SDK tools
export PATH=$PATH:$HOME/.dotnet/tools

# Add gem binaries to path
export PATH=$PATH:$HOME/.local/share/gem/ruby/

# Path to your oh-my-zsh installation.
export ZSH="/home/zjeffer/.oh-my-zsh"
export ZSH_CACHE_DIR="$ZSH/cache"
export ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-$HOST-$ZSH_VERSION"
export ZDOTDIR="$ZSH_CACHE_DIR"

export ZSH_DISABLE_COMPFIX="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git docker docker-compose 
)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#User configuration
export DEFAULT_USER = zjeffer prompt_context(){}
export MANPATH="/usr/local/man:$MANPATH"

#You may need to manually set your language environment
export LANG=en_US.UTF-8

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

#Compilation flags
export ARCHFLAGS="-arch x86_64"

#ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

#####        CLEAN UP HOME FOLDER       ######
#nvidia shader cache: instead of ~/.nv/, choose different folder:
export __GL_SHADER_DISK_CACHE_PATH=/tmp/zjeffer/nvidia/

alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

#cuda cache path
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

#npm
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

#java
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

# hardware acceleration in firefox
#export MOZ_DISABLE_RDD_SANDBOX=1
#export MOZ_X11_EGL=1


# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias la='ls -la'
alias ll='ls -l'
alias free='free -h'
alias df='df -h'
alias ka='killall'
alias vim='nvim'
alias sudo='sudo -A '
alias feh='feh --auto-zoom'
alias dmesg='sudo dmesg -H --color'
alias gs='git status'
alias wget="wget --hsts-file ~/.config/wget/wget-hsts"
alias yay='paru'
alias less='less -I '

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[3~" delete-char
bindkey "^[[5~" delete-char


export SUDO_ASKPASS=~/.config/rofi/scripts/askpass/askpass.sh

export QT_QPA_PLATFORMTHEME=qt5ct

#less history file
export LESSHISTSIZE=0
export LESSHISTFILE=-

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
