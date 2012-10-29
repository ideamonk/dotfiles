# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud2"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...





HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
WORDCHARS="${WORDCHARS:s#/#}"
WORDCHARS="${WORDCHARS:s#.#}"
export EDITOR=$(which vim)

setopt appendhistory autocd nobeep extendedglob nomatch notify
setopt autolist auto_menu
bindkey -e

#zstyle :compinstall filename '/Users/newman2001/.zshrc'
#autoload -Uz compinit
#compinit

zstyle ':completion:*' completer _oldlist _expand _complete _approximate
zstyle ':completion:*:approximate:'    max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )' # allow one error for every three characters typed in approximate completer
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~' # don't complete backup files as executables
zstyle ':completion:*:correct:*'       insert-unambiguous true             # start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:corrections'     format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}' #
zstyle ':completion:*:correct:*'       original true                       #
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}      # activate color-completion(!)
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'  # format on completion
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select              # complete 'cd -<tab>' with menu
#zstyle ':completion:*:expand:*'        tag-order all-expansions            # insert all expansions for expand completer
zstyle ':completion:*:history-words'   list false                          #
zstyle ':completion:*:history-words'   menu yes                            # activate menu
zstyle ':completion:*:history-words'   remove-all-dups yes                 # ignore duplicate entries
zstyle ':completion:*:history-words'   stop yes                            #
zstyle ':completion:*'                 matcher-list 'm:{a-z}={A-Z}'        # match uppercase from lowercase
zstyle ':completion:*:matches'         group 'yes'                         # separate matches into groups
zstyle ':completion:*'                 group-name ''
zstyle ':completion:*:messages'        format '%d'                         #
zstyle ':completion:*:options'         auto-description '%d'               #
zstyle ':completion:*:options'         description 'yes'                   # describe options in full
zstyle ':completion:*:processes'       command 'ps -au$USER'               # on processes completion complete all user processes
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters        # offer indexes before parameters in subscripts
zstyle ':completion:*'                 verbose true                        # provide verbose completion information
zstyle ':completion:*:warnings'        format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d' # set format for warnings
zstyle ':completion:*:*:zcompile:*'    ignored-patterns '(*~|*.zwc)'       # define files to ignore for zcompile
zstyle ':completion:correct:'          prompt 'correct to: %e'             #
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'    # Ignore completion functions for commands you don't have:

# complete manual by their section
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select


# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path /Volumes/RamDisk/.zcache
zstyle ':completion:*:cd:*' ignore-parents parent pwd

zstyle ':completion::complete:cd::' tag-order local-directories
zstyle ':completion:*' menu select=2
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#I want my umask 0002 if I'm not root
if [[ $(whoami) = root ]]; then
    umask 0022
else
    umask 0002
fi

alias ls='ls -G'
alias grep='grep --color=auto'
alias  vi=$(which vim)
alias -- -='cd -'
alias  ...='../..'
alias  ....='../../..'
alias  .....='../../../..'
alias  ll='ls -la'
alias  sl='ls -lah'
alias  l='ls -lah'

show-colors() {
    for line in {0..17}; do
        for col in {0..15}; do
            code=$(( $col * 18 + $line ));
            printf $'\e[38;05;%dm %03d' $code $code;
        done;
        echo;
    done
}

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
setopt CORRECT

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
setopt NO_BEEP

setopt nonomatch            # do not print error on non matched patterns
## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

autoload -U colors && colors
# set some colors
for COLOR in RED GREEN YELLOW WHITE BLACK CYAN BLUE PURPLE; do
    eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'         
    eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done                                                 
PR_RESET="%{${reset_color}%}";                       

setopt prompt_subst
 
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git cvs svn
# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stangedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
## check-for-changes can be really slow.
## you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true            # slower, but lets us show changes to working/index
zstyle ':vcs_info:*:prompt:*' unstagedstr "${PR_BRIGHT_YELLOW}*${PR_RESET}"             # unstaged changes string: red *
zstyle ':vcs_info:*:prompt:*' stagedstr "${PR_BRIGHT_YELLOW}+${PR_RESET}"            # staged changes string: yellow +
zstyle ':vcs_info:*:prompt:*' formats  " ${PR_GREEN}%s${PR_RESET}:${PR_BRIGHT_RED}(%b${PR_RESET}%c%u${PR_BRIGHT_RED})${PR_RESET}"              "%a"
zstyle ':vcs_info:*:prompt:*' actionformats  " ${PR_GREEN}%s${PR_RESET}:${PR_BRIGHT_RED}(%b|%a)${PR_RESET}"              "%a"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""                             "%~"
zstyle ':vcs_info:*:prompt:*' branchformat  "%b:%r"              ""



if [[ -n $SSH_CONNECTION ]]; then
    SSH_IP=$(echo $SSH_CLIENT | awk '{print $1}')
    HOST_OUTPUT=$(host $SSH_IP)
    if [[ $? -eq 0 ]]; then
        SSH_HOST=$(echo $HOST_OUTPUT | awk '{print $NF}' | sed 's/.$//')
    else
        SSH_HOST=$SSH_IP
    fi    
    SSH_PROMPT="${RED_STAR}%F{yellow}SSH from: %f%B%F{green}$SSH_HOST%f%b${RED_STAR}"
    #SSH_PROMPT="${YELLOW_DIAMOND}${PR_BRIGHT_RED}SSH${PR_RESET}${YELLOW_DIAMOND}"
    #SSH_VAR="${YELLOW_DIAMOND}${PR_BRIGHT_RED}SSH${PR_RESET}${YELLOW_DIAMOND}"

fi

HASH_NUM=$(echo $HOSTNAME | md5sum | tr -d 'a-f' | cut -b 1-6)
HASH_MOD=$(($HASH_NUM % 6 + 2)) 
if [[ $(whoami) = root ]]; then
    PROMPT_LINE="%B%F{red}%n@%M%f%b"
else
    PROMPT_LINE="%F{green}%n%f@%B%F{$HASH_MOD}%m%b%f"
fi

LANG=en_US.UTF-8
LC_ALL=en_US.UTF-8

# PATH settings
# ----------------------------------------------------------------------
PATH=~/bin:/usr/local/bin:$PATH;
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export NODE_PATH="/usr/local/lib/node"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home

# RVM
# ----------------------------------------------------------------------
source ~/.rvm/scripts/rvm

# HELPERS
# ----------------------------------------------------------------------
function any2mp3() {
    # get flac, ogg, etc as mp3
    for f in *
    do
	ffmpeg -i "$f" -ab 500k "$f.mp3"
    done
}

function smooth_shit() {
    # smoothen stuff on external monitor
    defaults -currentHost write -globalDomain AppleFontSmoothing -int 2
}

function ignoreupdate() {
    git rm -r --cached .
    git add .
    git commit -m ".gitignore is now working"
}

function iawriter() {
    ~/Applications/iA\ Writer.app/Contents/MacOS/iA\ Writer &
}

function backup_ideamonk() {
    rsync -avz -e "ssh -i /Users/ideamonk/.ssh/id_rsa" root@ideamonk.in:/ ~/Backup/ideamonk.in
}

function start_pg() {
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
}

function stop_pg() {
  pg_ctl -D /usr/local/var/postgres stop -s -m fast
}

function git-authorship() {
  git ls-files -z |
    xargs -0 -n1 -E'\n' -J {} git blame --date short -wCMcp '{}' |
    perl -pe 's/^.*?\((.*?) +\d{4}-\d{2}-\d{2} +\d+\).*/\1/' |
    sort |
    uniq -c |
    sort -rn
}

function chrome_mobile() {
  open Google\ Chrome.app --args --user-agent="Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3"
}

# ALIASES 
# ----------------------------------------------------------------------
alias rspec='nocorrect rspec'
alias edit='emacsclient --no-wait -c -f="((width . 120))"'
alias vim='edit'
