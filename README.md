# ZSH Config File

## Install ZSH
```sh
sudo pacman -S zsh
```

## Create Symbolic Link to .config/zsh
```sh
ln -s ~/.config/zsh/.zshrc ~/.zshrc
```

## Set ZSH as Default
```sh
chsh -s /usr/bin/zsh
```
OR
```sh
chsh -s $(which zsh)
```

## Get this Config
```sh
git clone https://github.com/bharathulaganathan/zsh ~/.config/zsh
```

## Install Dependencies
### Arch Linux
```sh
#fzf
sudo pacman -S fzf
```
### Direct Install
```sh
#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Install and Setup Starship
https://github.com/bharathulaganathan/starship

## Reload ZSH
```sh
exec zsh
```
