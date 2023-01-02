# Setup fzf
# ---------
if [[ ! "$PATH" == */home/rb/dev/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/rb/dev/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/rb/dev/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/rb/dev/fzf/shell/key-bindings.zsh"
