# .bashrc
if [ -e "${HOME}/.bash_profile" && "$__BASH_PROPILE_LOADED__" != "1" ]; then
    source ${HOME}/.bash_profile
fi

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#stty -ixon

# unlimit stacksize for large aray in user mode
#ulimit -s unlimited

# set aliases and define function
alias eng='LANG=C LANGUAGE=C LC_ALL=C'

alias grep='\grep --color=auto'
alias hgrep='history | grep'

alias lesss='less -RSFX'

alias ls='\ls --color=auto -F'
alias ll='\ls --color=auto -Flh'
alias la='\ls --color=auto -Flha'
alias lt='\ls --color=auto -Flht'
function lsd(){
    \ls --color=always -Fl $@ | \grep '^d'
}
function cdl(){
    cd $@
    ll
}
function mkcd(){
    mkdir $@
    cd $_
}

#plain vim
alias pvim='vim -u NONE --noplugin -N'

function apt-up(){
    sudo apt update
    sudo apt -y autoremove
    sudo apt upgrade
    sudo apt -y autoremove
    sudo apt -y autoclean
}

alias O='xdg-open'
alias i3x='xrandr --output DP1 --rotate left --left-of eDP1; xrandr --output HDMI1 --rotate right --right-of eDP1'

# user file-creation mask
umask 022

PS1='\n\[\e[0;36m\]\t \[\e[0;32m\]\u\[\e[1;30m\]@\[\e[1;34m\]\h \[\e[1;33m\]\w\[\e[1;32m\]$(__git_ps1)\[\e[0m\]\n\$ '

if [ -f ~/dotfiles/git-completion.bash ]; then
    source ~/dotfiles/git-completion.bash
fi
if [ -f ~/dotfiles/git-prompt.sh ]; then
    source ~/dotfiles/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

