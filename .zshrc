# To check widget load run zprof
# zmodload zsh/zprof

# Zinit
# https://github.com/zdharma-continuum/zinit#manual
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# path to /home/user/.local/bin
export PATH="$HOME/.local/bin:$PATH"


# Plugins

# https://github.com/zsh-users/zsh-autosuggestions
# zinit light zsh-users/zsh-autosuggestions

### https://github.com/zsh-users/zsh-completions
### zinit light zsh-users/zsh-completions
### OR
### https://github.com/marlonrichert/zsh-autocomplete
### zinit light marlonrichert/zsh-autocomplete # Suggestions slow typing

### https://github.com/Aloxaf/fzf-tab
zinit light Aloxaf/fzf-tab

### https://github.com/zsh-users/zsh-history-substring-search
### zinit light zsh-users/zsh-history-substring-search

### https://github.com/zsh-users/zsh-syntax-highlighting
### zinit light zsh-users/zsh-syntax-highlighting
### OR
### https://github.com/zdharma-continuum/fast-syntax-highlighting
# zinit light zdharma-continuum/fast-syntax-highlighting

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# https://github.com/jeffreytse/zsh-vi-mode
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# https://docs.atuin.sh/cli/guide/installation/
# line 1: `atuin` binary as command, from github release, only look at .tar.gz files, use the `atuin` file from the extracted archive
# line 2: setup at clone(create init.zsh, completion)
# line 3: pull behavior same as clone, source init.zsh
zinit ice as"command" from"gh-r" bpick"atuin-*.tar.gz" mv"atuin*/atuin -> atuin" \
    atclone"./atuin init zsh > init.zsh; ./atuin gen-completions --shell zsh > _atuin" \
    atpull"%atclone" src"init.zsh"
zinit light atuinsh/atuin
# echo 'eval "$(atuin init zsh)"' >> ~/.zshrc

# https://github.com/carapace-sh/carapace
# https://carapace-sh.github.io/carapace-bin/install.html
zinit ice as"command" from"gh-r" \
    bpick"carapace-bin_*.tar.gz" \
    atclone"./carapace _carapace zsh > init.zsh" \
    atpull"%atclone" src"init.zsh"
zinit light carapace-sh/carapace-bin

# https://carapace-sh.github.io/carapace-bin/setup.html
autoload -U compinit && compinit
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'

# ${UserConfigDir}/zsh/.zshrc
# autoload -U compinit && compinit
# export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
# zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
# source <(carapace _carapace)

# Compinit
# autoload -Uz compinit
# compinit -C

# Init fzf-tab
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Ensure history directory exists
# HISTDIR="$HOME/.config/zsh_hist"
# [[ -d "$HISTDIR" ]] || mkdir -p "$HISTDIR"

# HISTFILE="$HOME/.config/zsh_hist/.histfile"
# HISTSIZE=50000
# SAVEHIST=50000
# HISTDUP=erase
# setopt appendhistory
# setopt sharehistory
# setopt hist_ignore_space
# setopt hist_ignore_all_dups
# setopt hist_save_no_dups
# setopt hist_ignore_dups
# setopt hist_find_no_dups

# setopt INTERACTIVE_COMMENTS

# setopt autocd
# setopt beep
# setopt extendedglob
# setopt nomatch
# setopt notify


# Keybind
# bindkey -v                        # switch from emacs to vi mode
# export KEYTIMEOUT=1               # reduce ESC delay from 400ms to 10ms (crucial)

# bindkey "^[[A" history-substring-search-up # substring search up history
# bindkey "^[[B" history-substring-search-down # substring search down history
# bindkey -M vicmd 'k' history-substring-search-up # substring search up history vim
# bindkey -M vicmd 'j' history-substring-search-down # substring search down history vim


# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# Configure autocomplete to be less aggressive
# zstyle ':autocomplete:*' min-input 3           # Only complete after 3 chars
# zstyle ':autocomplete:*' delay 0.5             # Wait 500ms before completing
# zstyle ':autocomplete:*' list-lines 8          # Limit completion lines
# zstyle ':autocomplete:*' max-lines 8           # Maximum lines
# zstyle ':autocomplete:tab:*' widget-style menu-select  # Use menu
# zstyle ':autocomplete:*' ignored-input '##*'   # Ignore ### patterns

# Completion Styles
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path ~/.cache/zsh/zcompcache
# zstyle ':completion:*' max-errors 1
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[._-]=** r:|=* l:|=* r:|=*' # normal completion ignore case and special chars
# zstyle ':completion:*' menu no # hide completion menu for fzf tab
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath' # fzf tab cd preview
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # preview directory's content with eza when completing cd
# zstyle ':fzf-tab:*' fzf-flags --ignore-case # fzf tab ignore case

# Starship

# Config location
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# Init
eval "$(starship init zsh)"
