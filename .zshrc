# https://github.com/zdharma-continuum/zinit#manual
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# path to /home/user/.local/bin
export PATH="$HOME/.local/bin:$PATH"


# Plugins

# Starship
# Config location
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# Init
eval "$(starship init zsh)"

# https://github.com/jeffreytse/zsh-vi-mode
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# https://docs.atuin.sh/cli/guide/installation/
# change bpick if different os or arch
zinit ice as"command" from"gh-r" \
    bpick"atuin-x86_64-unknown-linux-gnu.tar.gz" \
    mv"atuin-x86_64-unknown-linux-gnu.tar.gz/atuin -> atuin" \
    atclone"./atuin init zsh > init.zsh; \
    ./atuin gen-completions --shell zsh > _atuin" \
    atpull"%atclone" src"init.zsh"
zinit light atuinsh/atuin
# Setup Sync
# atuin sync

# https://github.com/carapace-sh/carapace
# https://carapace-sh.github.io/carapace-bin/install.html
# change bpick if different os or arch
# atclone could have 'zsh' removed or 'init' before 'zsh' or '_carapace' replaced with 'init'
zinit ice as"command" from"gh-r" \
    bpick"carapace-bin_*_linux_amd64.tar.gz" \
    atclone"./carapace _carapace zsh > init.zsh" \
    atpull"%atclone" src"init.zsh"
zinit light carapace-sh/carapace-bin

# https://carapace-sh.github.io/carapace-bin/setup.html
autoload -U compinit && compinit
# export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
# zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'

# https://github.com/Aloxaf/fzf-tab
# Needs compinit
zinit light Aloxaf/fzf-tab

# https://github.com/zsh-users/zsh-autosuggestions
# https://github.com/zdharma-continuum/fast-syntax-highlighting
zinit wait lucid for \
    zdharma-continuum/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions
