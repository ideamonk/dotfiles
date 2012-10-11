# NOTE unused, I've switched to zsh, keeping this for old time's sake

# git completion
source ~/.git-completion.bash

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# check for an interactive session
[ -z "$PS1" ] && return

# colors
alias ls='ls -G'

# useful when using dwm and the likes
# Alias xterm="xterm -fa ‘Consolas:pixelsize=12’ -bg black -fg white -dc"
# alias xterm="xterm -bg black -fg white -dc"
# PS1="[\[\033[36m\]\u\[\033[37m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]]$ "

TERM=xterm-256color

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

PS1="[\[\033[36m\]\u\[\033[37m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]] $GREEN\$ \[\033[m\]"

# export ANT_HOME=/Users/ideamonk/svn.cm.aol.com/winston/build-support/apache-ant/bin:$ANT_HOME

# Winston ant
# export PATH=/Users/ideamonk/svn.cm.aol.com/winston/build-support/apache-ant/bin:/Users/ideamonk/bin/:/Users/ideamonk/python2.6.5/bin/:/Users/ideamonk/jython2.5.2rc2/bin/:$PATH

# prefer ~/bin , prefer custom python build
# NOTE: old, unused
export PATH=~/bin/:~/python2.6.5/bin/:~/.gem/ruby/1.8/bin/:$PATH

# lucene 3.0.3
export CLASSPATH=/Users/ideamonk/Code/lucene-3.0.3/build/lucene-core-3.0.3-dev.jar:/Users/ideamonk/Code/lucene-3.0.3/build/lucene-demos-3.0.3-dev.jar:$CLASSPATH

# a nice tree command
alias tree="find . -name .svn -prune -o -name .DS_Store -prune -o -name .git -prune -o -print | sed -e 's;[^/]*/;|___;g;s;___|; |;g'"

# fun with cow
alias cow="fortune -s -n 100 | cowsay -f `ls -1 /usr/local/Cellar/cowsay/3.03/share/cows/ | sed s/\.cow// | tail -n +\`echo $(( 1 + (\\\`od -An -N2 -i /dev/random\\\`) % (\\\`ls -1 /usr/local/Cellar/cowsay/3.03/share/cows/ | wc -l\\\`) ))\` | head -1`"

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/spidermonkey/lib/

# clojure stuff, we now have homebrew to save time
export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar

# grep with colors
alias grep='grep --color=auto'


# COMMAND HISTORY
# ----------------------------------------------------------------------

# big history
export HISTSIZE=1000

# format history with timestamp
# 319  | 2010-06-02 09:02PM | reload
export HISTTIMEFORMAT="| %F %I:%M%p | "

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"

# ignore repeat commands
export HISTCONTROL=erasedups

# ignore specific commands
export HISTIGNORE="&:cl:x"

# speedy history
# usage:  $ hi 4 ; will list last 4 commands
# or:     $ hi keyword ; will grep history for keyword
function hi(){
  if [[ $1 =~ ^[0-9]+$ ]]; then
    command history | tail -n "$1";
  elif [ "$1" != "" ]; then
    command history | grep "$1";
  else
    command history | tail -20;
  fi
}

alias h='history'


export ANDROID_NDK_ROOT=~/Code/android-ndk-r5b

alias ctags="`brew --prefix`/bin/ctags"
alias pydoc=/usr/bin/pydoc2.6 # messed up my pydoc while configuring
