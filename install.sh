#!/bin/sh -eux
umask 0022
export LC_ALL='C' PATH="$(command -p getconf PATH):$PATH"

check_command(){
    if ! command -v "$1" >/dev/null; then
        echo "$1 not installed"
    fi
}
check_command curl
check_command git
check_command vim

cd `dirname "${0}"`
dir=`pwd`
for file in `find -type f -name '.*' | sed 's@^\./@@' | grep -v /`; do
    if [ -e "${HOME}/$file" -a ! -L "${HOME}/$file" ]; then
        mv "${HOME}/$file" "${HOME}/${file}.old"
    fi
    ln -sf "${dir}/$file" "${HOME}/$file"
done

#vim
for d in backup swap undo; do
    mkdir -p "${HOME}/.vim/$d"
done
for file in `ls -1 .vim/*.vim`; do
    ln -sf "${dir}/$file" "${HOME}/$file"
done
for d in colors snippets syntax; do
    ln -sf "${dir}/.vim/$d" "${HOME}/.vim/$d"
done

# install vim-plug
if [ ! -e "${HOME}/.vim/autoload/plug.vim" ]; then
    curl -fLo "${HOME}/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
