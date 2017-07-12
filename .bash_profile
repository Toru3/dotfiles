# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

# addpath $HOME/bin
BASH_ENV=$HOME/.bashrc
USERNAME=""

export USERNAME BASH_ENV PATH LESSOPEN

OS=`cat /etc/lsb-release | grep DISTRIB_ID | sed 's/.*=//'`
if [ $OS = '"Vine"' ]; then
    export PATH=${HOME}/sugar-v2-2-1/bin:${HOME}/usr/local/bin:/usr/local/cuda/bin:$PATH
else
    export PATH=/usr/local/cuda/bin:$PATH
fi
export LD_LIBRARY_PATH=${HOME}/usr/local/lib64/:${HOME}/usr/local/lib/:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=${HOME}/usr/local/include
export CPLUS_INCLUDE_PATH=${HOME}/usr/local/include
export TEXINPUTS=$TEXINPUTS:~/mymacros/

