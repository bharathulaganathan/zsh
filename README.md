# zsh config file

# install zsh
sudo pacman -S zsh

# create symbolic link to .config/zsh
ln -s ~/.config/zsh/.zshrc ~/.zshrc

# set zsh as default
chsh -s $(which zsh)
# OR
chsh -s /usr/bin/zsh

# install starship
curl -sS https://starship.rs/install.sh | sh
# OR
sudo pacman -S starship

# create starship config
mkdir -p ~/.config/starship  && touch ~/.config/starship/starship.toml

# change starship config location
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# install zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

# alias
# neovim for lazy, astro and nvchad

# reload zsh
exec zsh
