# Bash completion (installed via `brew install bash-completion`
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# vi key bindings
set -o vi

# PS1  #
D=$'\e[37;40m'
PINK=$'\e[35;40m'
GREEN=$'\e[32;40m'
ORANGE=$'\e[33;40m'

export PS1='${PINK}\h:${ORANGE}\w ${D}\n$ '

# Aliases #
source ~/.aliases
