lab-env(){
    source /home/rb/dev/python/venvs/lab/bin/activate
}

venv-install(){
    if _is_in_git_repo
    then
        cd $(_git_toplevel)
        _venv-install
        cd - > /dev/null
        return 0
    fi
    _venv-install
}

_venv-install() {
    [ ! -d venv ] && virtualenv venv
    venv-update
}

venv-update (){
    if [ -d venv ]
    then
        _venv-update
        return 0
    fi

    if _is_in_git_repo
    then
        cd $(_git_toplevel)
        _venv-update
        cd - > /dev/null
    fi
}

_venv-update(){
    if [ -d venv ]
    then
        sed -i "s%/app%$(pwd)%g" requirements/*.txt
        _venv-update-nvim
        venv/bin/pip install $(for file in requirements/*.txt; do echo "-r $file"; done)
        venv/bin/pip install -e deps/*
        [ -f setup.cfg ] && venv/bin/pip install -e .
        sed -i "s%$(pwd)%/app%g" requirements/*.txt
    fi
}

_venv-update-nvim() {
    venv/bin/pip install pylint mypy isort
    venv/bin/pip install python-lsp-server python-lsp-jsonrpc python-lsp-black pyls-isort pylsp-mypy pylsp-rope
}

venv-activate(){
    # Activate the venv in the current dir if available
    # Check if git dir, if so, try to activat on top level
    if _venv-activate
    then
        return 0
    fi

    if _is_in_git_repo
    then
        cd $(_git_toplevel)
        _venv-activate
        cd - > /dev/null
        return 0
    fi
}

_venv-activate() {
    if [ -d venv ]
    then
        source venv/bin/activate
        return 0
    fi
    return 1
}

_gh() {
  _is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
    fzf --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' |
    grep -o "[a-f0-9]\{7,\}"
}

_gb() {
  _is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
    fzf --height 100% --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' \
    --preview-window=down:28:wrap |
    sed 's/^..//' | cut -d' ' -f1 |
    sed 's#^remotes/##'
}
