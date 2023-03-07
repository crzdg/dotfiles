# Setup nvim

```
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
```

## Install lua-language-server

https://github.com/sumneko/lua-language-server/wiki/Getting-Started#command-line

```
git clone  --depth=1 https://github.com/sumneko/lua-language-server /home/rb/dev/lua-language-server
cd /home/rb/dev/lua-language-server
git submodule update --depth 1 --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
```

## Install bash-language-server
```bash
sudo npm i -g bash-language-server
```

## Install yaml-language-server
```bash
sudo npm i -g yaml-language-server
```

## Install neovim (nvim)

https://github.com/neovim/neovim
https://github.com/neovim/neovim/wiki/Building-Neovim

```
git clone https://github.com/neovim/neovim /home/rb/dev/neovim
cd /home/rb/dev/neovim
git checkout v0.8.3

make distclean
make deps
make CMAKE_BUILD_TYPE=RelWithDebInfo

sudo make install
```

## Link nvim config

```
ln -sf /home/rb/git/dotfiles/nvim ~/.config/nvim
```

## Optional Install peek for markdown preview

Install deno

```
curl -fsSL https://deno.land/x/install/install.sh | sh
```

install libwebkit2gtk

```
sudo apt install libwebkit2gtk-4.0-37
```

create main.bundle.js

```bash
cd /home/rb/.local/share/nvim/site/pack/packer/start/peek.nvim && deno task build:debug
```

## Optional: Install tree-sitter 

https://github.com/tree-sitter/tree-sitter/releases

```
cd /home/rb/dev
mkdir tree-sitter
cd tree-sitter
wget https://github.com/tree-sitter/releases/download/v0.20.6/tree-sitter-linux-x64.gz
gzip -d tree-sitter-linux-x64.gz
chmod +x tree-sitter-linux-x64
sudo ln -sf /home/rb/dev/tree-sitter/tree-sitter-linux-x64 /usr/local/bin/tree-sitter
```


# Neovim from scratch

Each video will be associated with a branch so checkout the one you are interested in, you can follow along with this [playlist](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ).

## Try out this config

Make sure to remove or move your current `nvim` directory

**IMPORTANT** Requires [Neovim v0.6.0](https://github.com/neovim/neovim/releases/tag/v0.6.0) or [Nightly](https://github.com/neovim/neovim/releases/tag/nightly). 
```
git clone https://github.com/LunarVim/Neovim-from-scratch.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed 

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim) 

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```
  sudo apt install xsel
  ```

- On Arch Linux

  ```
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```
  pip install pynvim
  ```

- Neovim node support

  ```
  npm i -g neovim
  ```
---

**NOTE** make sure you have [node](https://nodejs.org/en/) installed, I recommend a node manager like [fnm](https://github.com/Schniz/fnm).

> The computing scientist's main challenge is not to get confused by the complexities of his own making. 

\- Edsger W. Dijkstra
