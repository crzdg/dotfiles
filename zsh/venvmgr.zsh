lab-env(){
    source /home/rb/dev/python/venvs/lab/bin/activate
}

_has_venv_folder() {
    if [ -d venv ]
    then
        return 0
    fi
    return 1
}

_protected-venv-call() {
    if _has_venv_folder
    then
        $1
        return 0
    fi

    if _is_in_git_repo
    then
        cd $(_git_toplevel)
        if _has_venv_folder
        then
            $1
        fi
        cd - > /dev/null
    fi
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
    [ ! -d venv ] && virtualenv -p 3.11 venv
    venv-update
}

venv-update (){
    _protected-venv-call _venv-update
}

_venv-update(){
    sed -i "s%/app%$(pwd)%g" requirements/*.txt
    venv/bin/pip install $(for file in requirements/*.txt; do echo "-r $file"; done)
    venv/bin/pip install -e deps/*
    [ -f setup.cfg ] && venv/bin/pip install -e .
    sed -i "s%$(pwd)%/app%g" requirements/*.txt
    _venv-update-nvim
}

venv-update-nvim() {
    _protected-venv-call _venv-update-nvim
}

_venv-update-nvim() {
    # Install common dev tools
    venv/bin/pip install -U pylint mypy isort ruff

    # Install packages needed for LSP
    venv/bin/pip install -U python-lsp-server python-lsp-jsonrpc python-lsp-black pyls-isort pylsp-mypy pylsp-rope python-lsp-ruff
}

venv-bump-python() {
    _protected-venv-call _venv-bump-python
}

_venv-bump-python() {
    if venv/bin/pip &> /dev/null
    then
        return 0
    fi
    echo "pip command failed"
    echo "replacing venv with new"
    echo "---------------------------------------------------"
    rm -r venv
    _venv-install
}


venv-activate(){
    _protected-venv-call _venv-activate
}

_venv-activate() {
    source venv/bin/activate
    return 0
}
