# To check widget load run zprof
# zmodload zsh/zprof

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"




# Plugins

# https://github.com/zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions

# https://github.com/zsh-users/zsh-completions
zinit light zsh-users/zsh-completions
# OR
# https://github.com/marlonrichert/zsh-autocomplete
# zinit light marlonrichert/zsh-autocomplete # Suggestions slow typing

# https://github.com/Aloxaf/fzf-tab
zinit light Aloxaf/fzf-tab

# https://github.com/zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-history-substring-search

# https://github.com/zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-syntax-highlighting
# OR
# https://github.com/zdharma-continuum/fast-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting

# Compinit
autoload -Uz compinit
compinit -C

# Init fzf-tab
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


HISTFILE=~/.config/zsh_hist/.histfile
HISTSIZE=50000
SAVEHIST=50000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

setopt autocd
setopt beep
setopt extendedglob
setopt nomatch
setopt notify


# Keybind
bindkey -v

bindkey "^[[A" history-substring-search-up # substring search up history
bindkey "^[[B" history-substring-search-down # substring search down history
bindkey -M vicmd 'k' history-substring-search-up # substring search up history vim
bindkey -M vicmd 'j' history-substring-search-down # substring search down history vim

# Configure autocomplete to be less aggressive
# zstyle ':autocomplete:*' min-input 3           # Only complete after 3 chars
# zstyle ':autocomplete:*' delay 0.5             # Wait 500ms before completing
# zstyle ':autocomplete:*' list-lines 8          # Limit completion lines
# zstyle ':autocomplete:*' max-lines 8           # Maximum lines
# zstyle ':autocomplete:tab:*' widget-style menu-select  # Use menu
# zstyle ':autocomplete:*' ignored-input '##*'   # Ignore ### patterns

# Completion Styles
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh/zcompcache
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[._-]=** r:|=* l:|=* r:|=*' # normal completion ignore case and special chars
zstyle ':completion:*' menu no # hide completion menu for fzf tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath' # fzf tab cd preview
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # preview directory's content with eza when completing cd
zstyle ':fzf-tab:*' fzf-flags --ignore-case # fzf tab ignore case


# Alias

# LazyVim
alias lazyvim="NVIM_APPNAME=nvim/lazyvim nvim"
# AstroNvim
alias astronvim="NVIM_APPNAME=nvim/astronvim nvim"
# NvChad
alias nvchad="NVIM_APPNAME=nvim/nvchad nvim"


# Starship

# Config location
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# Init
eval "$(starship init zsh)"
