# EDITOR
export EDITOR=nvim
export GIT_EDITOR="$EDITOR"
export TERM="xterm-256color"

# PATH
export PATH="$PATH:$HOME/dev/fzf/bin" # add fzf (fuzzy finder) to path
export PATH="$PATH:$HOME/dev/lua-language-server/bin" # Add lua language server to path
export PATH="$PATH:$HOME/dev/win32yank" # Add win32yank to path
export LPASS_CLIPBOARD_COMMAND="win32yank.exe -i"

# DEPRECATED / OPTIONAL
export PATH="$PATH:$HOME/.yarn/bin" # Add user yarn global to path
export PATH="$PATH:/usr/local/go/bin" # Ad go bin to bath
export PATH="$PATH:$HOME/dev/balena-cli" # Add balena cl to path

# Created by `pipx` on 2022-02-26 10:19:23
export PATH="$PATH:$HOME/.local/bin"
export ZSH="$HOME/.oh-my-zsh"

ZSH_CONFIG_DIR="$(dirname "$(readlink ~/.zshrc)")"

case $NAME in
    (moltres) source $ZSH_CONFIG_DIR/machines/moltres.zsh;;
    (DESWS-0009) source $ZSH_CONFIG_DIR/machines/desws-0009.zsh;;
    (*) source $ZSH_CONFIG_DIR/machines/default.zsh;;
esac

# ALIASES
source $ZSH_CONFIG_DIR/aliases.zsh

# Theme (from gruvbox-baby)
export $(cat ~/git/gruvbox-baby/extras/tmux/DARK.tmux | xargs)

# FZF
source $ZSH_CONFIG_DIR/fzf.zsh

# ProjectX
source $ZSH_CONFIG_DIR/projectx.zsh

# Git
source $ZSH_CONFIG_DIR/git.zsh

# VENV MANAGER
source $ZSH_CONFIG_DIR/venvmgr.zsh

# SSH-AGENT
source $HOME/dev/ssh-find-agent/ssh-find-agent.sh

ssh_find_agent -a
if [ -z "$SSH_AUTH_SOCK" ]
then
   eval $(ssh-agent) > /dev/null
   ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
fi

# ZSH
ZSH_THEME="spaceship"
source $ZSH_CONFIG_DIR/spaceship_prompt.zsh
plugins=()
source $ZSH/oh-my-zsh.sh

# Make completion
zstyle ':completion::complete:make:*:targets' call-command true

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# STARTUP
[ -z $TMUX ] && { tmux attach -t main || tmux new-session -s main ; }
