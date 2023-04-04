export PATH="$PATH:$HOME/dev/balena-cli" # Add balena cl to path

alias csedi="openvpn-gui.exe --command silent_connection 1 && openvpn-gui.exe --command connect DESWS-0009"
alias dsedi="openvpn-gui.exe --command disconnect DESWS-0009"

# HOST_INDICATOR_COLOR="#732f37" # sedimentum magenta
HOST_INDICATOR_COLOR=$MAGENTA
HOST_EMOJI="🚀"
HOST_USER_SUFFIX="🦄🪨"
SPACESHIP_HOST_SHOW="false"
SPACESHIP_VENV_SYMBOL="🌍 "

PROJECTX_FOLDERS="~/git ~/git/sedimentum"
PROJECTX_INTERNET_CHECKS=1
PROJECTX_GIT_FETCH=1
PROJECTX_BUMP_PYTHON=0
