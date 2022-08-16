# PATH
export PATH="$PATH:$HOME/dev/balena-cli" # Add balena cl to path
export PATH="$PATH:/usr/local/go/bin" # Ad go bin to bath
export PATH="$PATH:$HOME/dev/fzf/bin" # add fzf (fuzzy finder) to path
export PATH="$PATH:$HOME/.yarn/bin" # Add user yarn global to path
export PATH="$PATH:$HOME/dev/lua-language-server/bin"

# Created by `pipx` on 2022-02-26 10:19:23
export PATH="$PATH:$HOME/.local/bin"

# COMMANDS
gbrowse() {
  _gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | tr -d '\n'"
  _viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always %'"
  git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@" |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
    --ansi --preview="$_viewGitLogLine" \
    --header "enter to view, alt-y to copy hash to tmux, alt-c to copy hash to clipboard" \
    --bind "enter:execute:$_viewGitLogLine | less -R" \
    --bind "alt-y:execute:$_gitLogLineToHash | tmux load-buffer -" \
    --bind "alt-c:execute:$_gitLogLineToHash | xclip -i -sel c"
}

venv-install(){
  [ ! -d venv ] && virtualenv venv
  venv-update
}
venv-update(){
  sed -i "s%/app%$(pwd)%g" requirements/*.txt
  venv-update-nvim
  venv/bin/pip install $(for file in requirements/*.txt; do echo "-r $file"; done)
  venv/bin/pip install -e deps/*
  [ -f setup.cfg ] && venv/bin/pip install -e .
  sed -i "s%$(pwd)%/app%g" requirements/*.txt
}

venv-update-nvim() {
    venv/bin/pip install pylint mypy isort
    venv/bin/pip install python-lsp-server python-lsp-jsonrpc python-lsp-black pyls-isort pylsp-mypy pylsp-rope
}

venv-activate(){
  [ -d venv ] || venv-install
  source venv/bin/activate
}

lab-env(){
    source /home/rb/dev/python/venvs/lab/bin/activate
}

# FZF
source ~/.fzf.completions.zsh
source ~/.fzf.keybindings.zsh
export FZF_COMPLETION_TRIGGER=','


if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden || true'
fi

# SSH-AGENT
. $HOME/dev/ssh-find-agent/ssh-find-agent.sh

ssh_find_agent -a
if [ -z "$SSH_AUTH_SOCK" ]
then
   eval $(ssh-agent) > /dev/null
   ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
fi

# THEME
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="🏃 " 
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_VENV_SYMBOL="🐍 "
SPACESHIP_EXIT_CODE_SHOW=false
SPACESHIP_USER_SUFFIX="[💫🐶] "
SPACESHIP_RPROMPT_ORDER=(
    # exit_code
    # exec_time
    )
SPACESHIP_PROMPT_ORDER=(
  # time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  # gradle        # Gradle section
  # maven         # Maven section
  node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  golang        # Go section
  # php           # PHP section
  rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubectl       # Kubectl context section
  # terraform     # Terraform workspace section
  # ibmcloud      # IBM Cloud section
  # exec_time     # Execution time
  line_sep      # Line break
  # battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

plugins=()
source $ZSH/oh-my-zsh.sh

# ALIASES 
alias fxrcf="bash $HOME/config/fix-resolv-conf.sh"
alias cat="batcat -pp"
alias csedi="openvpn-gui.exe --command silent_connection 1 && openvpn-gui.exe --command connect DESWS-0009"
alias dsedi="openvpn-gui.exe --command disconnect DESWS-0009"
alias luamake=/home/rb/dev/lua-language-server/3rd/luamake/luamake
alias ll="ls -lah"

# STARTUP
[ -z $TMUX ] && { tmux attach -t main || tmux new-session -s main ; }
