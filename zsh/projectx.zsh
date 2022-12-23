_open_project_in_tmux() { 
    echo "Hello"
 }

_parse_projects() { 
    ll ~/git | grep ^d | rev | cut -d" " -f1 | rev
 }

 _project_fzf() {
     fzf --bind "enter:execute(cd {})"
 }

_setup_tmux_project_or_switch () {
    local dir_name
    dir_name=$(basename $1)
    local window
    window=$(tmux list-window | grep "$dir_name" | head -1 | cut -d":" -f1)
    if [[ ! -z "$window" ]]
    then
        tmux select-window -t "$window"
    else
        _setup_tmux_project $dir_name $1
    fi
}

_setup_tmux_project () {
    # Setup panes
    echo $2
    tmux new-window -n "$1"
    tmux split-window -h
    tmux split-window -v
    # Resize panes
    tmux resize-pane -t 1 -x 120
    # Run commands
    COMMAND="${2}"
    echo $COMMAND
    tmux send-keys -t 1 C-z "cd ${2} && _go_to_toplevel_if_git_dir && venv-activate && nvim ." C-m
    tmux send-keys -t 2 C-z "cd ${2} && _go_to_toplevel_if_git_dir && gbrowse" C-m
    tmux send-keys -t 3 C-z "cd ${2}" C-m
    # Focus to fist pane
    tmux select-pane -t 1
}

fzf-project-widget () {
    _setup_tmux_project_or_switch $(find ~/git -maxdepth 1 -mindepth 1 | fzf --reverse --prompt "🐛 ") || true
}

zle     -N            fzf-project-widget 
bindkey -M emacs '^P' fzf-project-widget 
bindkey -M vicmd '^P' fzf-project-widget
bindkey -M viins '^P' fzf-project-widget
