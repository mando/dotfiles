# Bash completion (installed via `brew install bash-completion`
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Git auto completion (from https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash)
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Git PS1 setting (from curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh)
if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
fi

# vi key bindings
set -o vi

# PS1  #
CURRENT_RUBY=""
if [ -f ~/.rvm/bin/rvm-prompt ]; then
  CURRENT_RUBY=(. ~/.rvm/bin/rvm-prompt)
fi

D=$'\e[37;40m'
PINK=$'\e[35;40m'
GREEN=$'\e[32;40m'
ORANGE=$'\e[33;40m'
YELLOW=$'\e[0;33m'
BLUE=$'\e[0;34m'
WHITE=$'\e[0;37m'


export PS1='${PINK}\h:${ORANGE}\w${D}${BLUE}$(__git_ps1)\n${WHITE}$ '

# Aliases #
source ~/.aliases

# Set my histories
export HISTSIZE=1000000000
export HISTFILESIZE=1000000000

# Never forget my history
shopt -s histappend

# Share my history
export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

# Gimme some timestamps for my history
export HISTTIMEFORMAT="%F %T "
