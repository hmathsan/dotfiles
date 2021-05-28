#
# ~/.bashrc
#

source /usr/share/git/completion/git-prompt.sh

red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
green='\[\033[32m\]'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\[\033[0;37m\]' # No Color

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias ls='ls --color=auto'
PS1="${green}\u@\h${NC}:${blue} \W${RED}\$(parse_git_branch)${NC}\$ "
