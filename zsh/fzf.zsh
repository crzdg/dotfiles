
export FZF_DEFAULT_OPTS="--height 80% --layout=reverse --border --info=inline --prompt '> '
    --color fg:${FOREGROUND},bg:${BG},hl:${BRIGHT_YELLOW},fg+:${FOREGROUND},bg+:${COMMENT},hl+:${BRIGHT_YELLOW}
    --color info:${DARK_GREY},prompt:#bdae93,spinner:${BRIGHT_YELLOW},pointer:#83a598,marker:#fe8019,header:#665c54
"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

export FZF_COMPLETION_TRIGGER='**'

if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden || true'
fi
