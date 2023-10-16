# EDITOR
export EDITOR=nvim
export GIT_EDITOR="$EDITOR"
export TERM="xterm-256color"

# LANGUAGE
export LC_ALL=C.UTF-8
export LC_CTYPE=C.UTF-8
export LANG=C.UTF-8

# PATH
export PATH="$PATH:$HOME/dev/fzf/bin" # add fzf (fuzzy finder) to path
export PATH="$PATH:$HOME/dev/lua-language-server/bin" # Add lua language server to path
export PATH="$PATH:$HOME/dev/win32yank" # Add win32yank to path
export PATH="$PATH:$HOME/.erg/bin" # Erg for pylyzer
export ERG_PATH="$HOME/.erg"
export LPASS_CLIPBOARD_COMMAND="win32yank.exe -i"
export LPASS_AGENT_TIMEOUT=0

# Optional: Deno for peek in nvim
export DENO_INSTALL="/home/rb/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# DEPRECATED / OPTIONAL
export PATH="$PATH:$HOME/.yarn/bin" # Add user yarn global to path
export PATH="$PATH:/usr/local/go/bin" # Ad go bin to bath
export PATH="$PATH:$HOME/dev/balena-cli" # Add balena cl to path
export PATH="$PATH:$HOME/.local/bin"

export ZSH="$HOME/.oh-my-zsh"

ZSH_CONFIG_DIR="$(dirname "$(readlink ~/.zshrc)")"

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
emulate ksh -c "source $HOME/dev/ssh-find-agent/ssh-find-agent.sh"
ssh-add -l >&/dev/null || ssh-find-agent -a || eval $(ssh-agent) > /dev/null


# ZSH
ZSH_THEME="spaceship"
source $ZSH_CONFIG_DIR/spaceship_prompt.zsh
plugins=()

# load defaults
source $ZSH_CONFIG_DIR/machines/default.zsh

case $HOST in
    moltres) source $ZSH_CONFIG_DIR/machines/moltres.zsh;;
    DESWS-0009) source $ZSH_CONFIG_DIR/machines/desws-0009.zsh;;
    mew) source $ZSH_CONFIG_DIR/machines/mew.zsh;;
    docker) source $ZSH_CONFIG_DIR/machines/docker.zsh;;
    zapdos) source $ZSH_CONFIG_DIR/machines/zapdos.zsh;;
    *) source $ZSH_CONFIG_DIR/machines/default.zsh;;
esac


# Export host indicator variables
export HOST_INDICATOR_COLOR=$HOST_INDICATOR_COLOR
export HOST_EMOJI=$HOST_EMOJI
export HOST_USER_SUFFIX=$HOST_USER_SUFFIX

# Export projectx variables
export PROJECTX_FOLDERS=$PROJECTX_FOLDERS
export PROJECTX_INTERNET_CHECKS=$PROJECTX_INTERNET_CHECKS
export PROJECTX_GIT_FETCH=$PROJECTX_GIT_FETCH
export PROJECTX_BUMPY_PYTHON=$PROJECTX_BUMPY_PYTHON

SPACESHIP_CHAR_SYMBOL="$HOST_EMOJI "
SPACESHIP_USER_SUFFIX="[$HOST_USER_SUFFIX] "
SPACESHIP_USER_COLOR=$HOST_INDICATOR_COLOR
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

# fnm
export PATH="/home/rb/.local/share/fnm:$PATH"
eval "`fnm env`"
