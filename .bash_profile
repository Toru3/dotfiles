# .bash_profile
export __BASH_PROPILE_LOADED__=1

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

# addpath $HOME/bin
BASH_ENV=$HOME/.bashrc
USERNAME=""

export USERNAME BASH_ENV PATH LESSOPEN

export HISTSIZE=100000
export HISTCONTROL=ignoreboth
export HISTIGNORE="history:exit:ssh [A-Za-z0-9]*:ll:w:top"

if [ -e /etc/lsb-release ]; then
    OS=`cat /etc/lsb-release | grep DISTRIB_ID | sed 's/.*=//'`
else
    OS='Unknown'
fi
export PATH=/usr/local/cuda/bin:$PATH
if [ $OS = '"Vine"' ]; then
    export PATH=/usr/local/texlive/2017/bin/x86_64-linux/:${HOME}/sugar-v2-2-1/bin:${HOME}/usr/local/bin:$PATH
fi
export LD_LIBRARY_PATH="${HOME}/usr/local/lib64/:${HOME}/usr/local/lib/:$LD_LIBRARY_PATH"
export C_INCLUDE_PATH="${HOME}/usr/local/include"
export CPLUS_INCLUDE_PATH="${HOME}/usr/local/include"
export TEXINPUTS="$TEXINPUTS:~/mymacros/"

export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="${HOME}/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"


export PATH="$HOME/.cargo/bin:$PATH"
