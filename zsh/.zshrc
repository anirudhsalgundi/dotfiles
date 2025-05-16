# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
zmodload zsh/zprof

# Set language environment
export LANG=en_US.UTF-8

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-defer)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh
zsh-defer source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User aliases
alias editrc="vim ~/.zshrc"
alias reload="source ~/.zshrc"
alias copy="rsync -rzvruP"
alias laxpc_pc="ssh -X laxpc@10.112.106.44"
alias utkarsh_pc="ssh -X utkarsh@10.112.106.39"
alias vi='nvim'
alias vim='nvim'
alias ls="eza --icons --group-directories-first --color=always"
alias ll="eza -l --sort modified --icons --color=always"
alias la="eza -la --icons --group-directories-first --color=always"
alias lt="eza -T --icons"
alias cool="tmux a -t show"

# LAXPC software setup
export LAXPCSOFT="/Users/ani/softwares/LAXPC_softwares/LAXPCsoftware22Aug15"
export LAXPCPATH="$LAXPCSOFT/LAXPC_CAL/"
export PATH="$PATH:$LAXPCSOFT/laxpc_bin"

# HEADAS setup
export HEADAS="/Users/ani/softwares/heasoft/heasoft-6.35.1/aarch64-apple-darwin24.3.0"
source $HEADAS/headas-init.sh

# TeXLive path
export PATH="/usr/local/texlive/2025basic/texmf-dist/scripts:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ani/softwares/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ani/softwares/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ani/softwares/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ani/softwares/miniconda3/bin:$PATH"
    fi
fi
#unset __conda_setup


# Set up lazy loading
# Tell conda not to modify the prompt
# <<< conda initialize <<<

# Speed up compinit
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null) ]; then
  compinit
else
  compinit -C
fi

# Disable Oh-My-Zsh's automatic update check
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"

#Initialise starship
eval "$(starship init zsh)"

# Source exa colors
[ -f "$HOME/dotfiles/.config/shell/exa_colors.sh" ] && source "$HOME/dotfiles/.config/shell/exa_colors.sh"

#for terminal to work properly during remote sessions
export TERM=xterm-256color
