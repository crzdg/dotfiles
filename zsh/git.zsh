
_is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

_git_toplevel() {
    git rev-parse --show-toplevel
}

_go_to_toplevel_if_git_dir () {
    if _is_in_git_repo
    then
        cd $(_git_toplevel)
    fi
}


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
