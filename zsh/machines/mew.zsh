# ZSH
ZSH_THEME="spaceship"
source $ZSH_CONFIG_DIR/prompts/spaceship_prompt_mew.zsh
plugins=()

# fnm
export PATH="/home/rb/.local/share/fnm:$PATH"
eval "`fnm env`"

export TMUX_INDICATOR_COLOR="#ffadad"
