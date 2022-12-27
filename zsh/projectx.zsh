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
    if [[ -z "$1" ]]
    then
        return 0
    fi
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
    tmux new-window -n "$1"
    tmux split-window -h
    tmux split-window -v
    # Resize panes
    tmux resize-pane -t 1 -x 142
    # Run commands
    local default_command
    default_command="cd ${2} && _go_to_toplevel_if_git_dir && venv-activate && clear"
    tmux send-keys -t 1 C-z "$default_command && nvim ." C-m
    tmux send-keys -t 2 C-z "$default_command && _gb" C-m
    tmux send-keys -t 3 C-z "$default_command" C-m
    # Focus to fist pane
    tmux select-pane -t 1
}

fzf-project-widget () {
    _setup_tmux_project_or_switch $(find ~/git ~/git/sedimentum -type d -maxdepth 1 -mindepth 1 2> /dev/null | fzf -d / --with-nth=-1)
    zle reset-prompt
}

fzf-window-selection () {
    local window
    window=$(tmux list-window | fzf -d " "  --with-nth=2 )
    window=$( echo "$window" | cut -d":" -f1)
    tmux select-window -t "$window"
}

zle     -N            fzf-project-widget 
bindkey -M emacs '^P' fzf-project-widget 
bindkey -M vicmd '^P' fzf-project-widget
bindkey -M viins '^P' fzf-project-widget