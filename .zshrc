# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/singularity_arch/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# LazyVim
alias lazyvim="NVIM_APPNAME=nvim/lazyvim nvim"

# AstroNvim
alias astronvim="NVIM_APPNAME=nvim/astronvim nvim"

# NvChad
alias nvchad="NVIM_APPNAME=nvim/nvchad nvim"

# Starship config
export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(starship init zsh)"
