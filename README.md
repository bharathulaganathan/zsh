# zsh config file

### install zsh
```sh
sudo pacman -S zsh
```

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

# reload zsh
```sh
exec zsh
```
