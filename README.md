# zsh config file

### install zsh
sudo pacman -S zsh

### create symbolic link to .config/zsh
```sh
ln -s ~/.config/zsh/.zshrc ~/.zshrc
```

### set zsh as default
```sh
chsh -s /usr/bin/zsh
# OR
chsh -s $(which zsh)
```

### Get this config
```sh
git clone https://github.com/bharathulaganathan/zsh ~/.config/zsh
```

### Install and setup Starship
https://github.com/bharathulaganathan/starship

# install zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

# alias
# neovim for lazy, astro and nvchad

# reload zsh
exec zsh
