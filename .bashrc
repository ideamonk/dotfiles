export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
#Alias xterm="xterm -fa ‘Consolas:pixelsize=12’ -bg black -fg white -dc"
#alias xterm="xterm -bg black -fg white -dc"
#PS1="[\[\033[36m\]\u\[\033[37m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]]$ "

TERM=xterm-256color

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

PS1="[\[\033[36m\]\u\[\033[37m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]] $GREEN\$ \[\033[m\]"

MAIL=/var/spool/mail/ideamonk && export MAIL
PATH=$PATH:/usr/local/bin
DEFAULT=/var/spool/mail/ideamonk
MAILDIR=$HOME/Mail
LOGFILE=$HOME/.procmaillog 

