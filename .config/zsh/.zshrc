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

# nvidia-vaapi-driver envvar
export NVD_BACKEND=direct

#ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

############ If not running interactively, don't do anything
[[ $- != *i* ]] && return

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[3~" delete-char
bindkey "^[[5~" delete-char

# aliases and expots to clean up ~ folder
source ~/.config/zsh/zsh_alias

export HISTSIZE=10000000

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


