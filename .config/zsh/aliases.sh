# File to save aliases and exports to clean up ~ folder

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

source $XDG_CONFIG_HOME/zsh/gh-copilot-alias.sh

if [ -f $XDG_CONFIG_HOME/zsh/barco_aliases.sh ]; then
  source $XDG_CONFIG_HOME/zsh/barco_aliases.sh
fi

# for proper ssh access with kitty
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"


