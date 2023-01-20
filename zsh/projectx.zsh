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
    tmux new-window -n "$1"
    # Run commands
    local default_command
    local default_command_1
    local default_command_2
    default_command_1="cd ${2} && _go_to_toplevel_if_git_dir"
    default_command_2="venv-activate && clear"
    default_command=" ${default_command_1} && ${default_command_2}"
    ping -c1 google.ch > /dev/null
    if [ $? -eq 0 ]
    then
        tmux send-keys -t 1 C-z "$default_command_1 && venv-bump-python && venv-update-nvim && eval 'echo \$HOST'" C-m
        until tmux capture-pane -pJ -S-10 -t 1 | grep "$HOST" >/dev/null; do :; done
    fi
    # Setup panes
    tmux split-window -h
    tmux split-window -v
    # Resize panes
    tmux resize-pane -t 1 -x 58%
    tmux send-keys -t 1 C-z "$default_command && nvim ." C-m
    tmux send-keys -t 2 C-z "$default_command && git fetch && git log" C-m
    tmux send-keys -t 3 C-z "$default_command && git fetch && git status" C-m
    # Focus to fist pane
    tmux select-pane -t 1
}

fzf-project-widget () {
    _setup_tmux_project_or_switch $(find ~/git ~/git/sedimentum -type d -maxdepth 1 -mindepth 1 2> /dev/null | \
        fzf -d / --with-nth=-1 \
        --border-label "🐛" --prompt "Project> " \
        --preview 'batcat --color=always {}/README.md 2> /dev/null || echo "No README.md found!"' --preview-label "README"
    )
}

_setup_tmux_host_or_switch () {
    if [[ -z "$1" ]]
    then
        return 0
    fi
    local window
    window=$(tmux list-window | grep "$1" | head -1 | cut -d":" -f1)
    if [[ ! -z "$window" ]]
    then
        tmux select-window -t "$window"
    else
        tmux new-window -n "$1" "ssh $1"
    fi
}

fzf-step-widget () {
    _setup_tmux_host_or_switch $(step ssh hosts | tail -n +2 | grep -v "\." | fzf )
}

fzf-window-selection () {
    local window
    window=$(tmux list-window | fzf -d " "  --with-nth=2 )
    window=$( echo "$window" | cut -d":" -f1)
    tmux select-window -t "$window"
}

fzf-lpass-widget () {
    local entry
    entry=$(lpass ls -l --color=always | \
        grep id: | \
        sed -e 's/^[ \t]*//' | \
        sed -r "s/[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2} //g" | \
        sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2};?)?)?[mGK]//g" | \
        # Just show the username in the preview for now
        fzf --preview 'lpass show --username $(echo {} | \
                        grep -Eo "id:\ ([0-9])*" | \
                        grep -Eo "[0-9]*")')
        # TODO: The preview below is not realy secure as it only hides passwords but not notes
        # fzf --preview 'lpass show $(echo {} | \
        #                 grep -Eo "id:\ ([0-9])*" | \
        #                 grep -Eo "[0-9]*") | \
        #                 sed -r "s/(password.* |Password.* |pwd.* ).*/\1*****/gi" | \
        #                 sed -r "s/(-----.*------).*(-----.*-----)/\1*******\2/gi" | \
        #                 tail -n +2')
    id=$(echo $entry | grep -Eo "id:\ ([0-9]*)" | grep -Eo "[0-9]*" )
    lpass show --password -c $id

}
