# 🐚 zsh

### Install zsh
https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#install-and-set-up-zsh-as-default

```bash
sudo apt install zsh
chsh -s $(which zsh)
```

### Install oh-my-zsh
https://ohmyz.sh/#install

```bash
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

### Install spaceship theme via oh-my-zsh
https://github.com/spaceship-prompt/spaceship-prompt#oh-my-zsh

```bash
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

### Install ssh-find-agent handler
```
git clone git@github.com:wwalker/ssh-find-agent /home/rb/dev/ssh-find-agent
```

### Link the .zshrc config
```
ln -sf /home/rb/git/dotfiles/zsh/.zshrc ~/.zshrc
```

