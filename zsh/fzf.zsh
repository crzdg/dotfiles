
FZF_THEME="
--color=fg:${FOREGROUND} \
--color=bg:${BACKGROUND} \
--color=hl:${BRIGHT_YELLOW} \
--color=fg+:bold:${FOREGROUND} \
--color=bg+:${COMMENT} \
--color=hl+:${BRIGHT_YELLOW} \
--color=gutter:${BACKGROUND} \
--color=info:${ORANGE} \
--color=separator:${BACKGROUND} \
--color=border:${MILK} \
--color=label:${SOFT_YELLOW} \
--color=prompt:${LIGHT_BLUE} \
--color=spinner:${BRIGHT_YELLOW} \
--color=pointer:bold:${BRIGHT_YELLOW} \
--color=marker:${ERROR_RED} \
--color=header:${ORANGE} \
--color=preview-fg:${FOREGROUND} \
--color=preview-bg:${BACKGROUND} \
"

export FZF_DEFAULT_OPTS="
--ansi \
--height 80% \
--layout=reverse \
--border bold \
--info=inline \
--prompt '> ' \
${FZF_THEME}
"

export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

export FZF_COMPLETION_TRIGGER='**'

if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden || true'
fi
