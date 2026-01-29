# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh_histfile/.histfile
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/singularity_arch/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Neovim alias
# LazyVim
alias lazyvim="NVIM_APPNAME=nvim/lazyvim nvim"
# AstroNvim
alias astronvim="NVIM_APPNAME=nvim/astronvim nvim"
# NvChad
alias nvchad="NVIM_APPNAME=nvim/nvchad nvim"


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Plugins
# https://github.com/zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions
# https://github.com/zsh-users/zsh-completions?tab=readme-ov-file#zinit
zinit light zsh-users/zsh-completions
# https://github.com/Aloxaf/fzf-tab?tab=readme-ov-file#zinit
zinit light Aloxaf/fzf-tab
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#zinit
zinit light zsh-users/zsh-syntax-highlighting
# https://github.com/zdharma-continuum/fast-syntax-highlighting?tab=readme-ov-file#zinit
# zinit light zdharma-continuum/fast-syntax-highlighting
# https://github.com/zsh-users/zsh-history-substring-search?tab=readme-ov-file#install
zinit light zsh-users/zsh-history-substring-search

bindkey "^[[A" history-substring-search-up # substring search up history
bindkey "^[[B" history-substring-search-down # substring search down history
bindkey -M vicmd 'k' history-substring-search-up # substring search up history vim
bindkey -M vicmd 'j' history-substring-search-down # substring search down history vim

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Starship config
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Starship init
eval "$(starship init zsh)"