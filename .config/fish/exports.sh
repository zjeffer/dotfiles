# General
export LANG=en_US.UTF-8
export EDITOR='nvim'
export TERMINAL="wezterm"

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

# PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.local/share/cargo/bin
export PATH=/opt/cuda/bin:$PATH

# to make Barco DNS accessible within docker
export QUICKSILVER_DOCKER_EXTRA_ARGS="--dns 10.197.192.11 --dns 10.193.251.11"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


# Aliases
alias ls='ls --color=auto'
alias la='ls -lah'
alias l='ls -lAh'
alias ll='ls -l'
alias free='free -h'
alias df='df -h'
alias ka='killall'
alias vim='nvim'
alias nvim='nvim'
alias feh='feh --auto-zoom'
alias dmesg='sudo dmesg -H --color'
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias yay='paru'
alias less='less -I '
alias yarn='yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config'
alias discord='discord --no-sandbox'

# git
alias gs='git status'
alias gd='git diff'
alias gl='git pull'
alias g='git'

# barco
alias bob='./bob-docker.sh --clang'
alias bobgcc='./bob-docker.sh'
alias wendy='./wendy'
alias spud='./spud.sh'
alias scoop='./scoop'
