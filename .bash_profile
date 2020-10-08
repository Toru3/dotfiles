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
export HISTIGNORE="history:exit:ll:w:top:htop"

export PATH="/usr/local/cuda/bin:${HOME}/.local/bin:$PATH"
export LD_LIBRARY_PATH="${HOME}/.local/lib64:${HOME}/.local/lib:$LD_LIBRARY_PATH"
export C_INCLUDE_PATH="${HOME}/.local/include"
export CPLUS_INCLUDE_PATH="${HOME}/.local/include"
export TEXINPUTS="$TEXINPUTS:~/mymacros/"

export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

