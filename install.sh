#!/bin/sh
set -eu
umask 0022
export LC_ALL='C' PATH="$(command -p getconf PATH):$PATH"

cd `dirname "${0}"`
dir=`pwd`
for file in `find -type f -name '.*' | sed 's/^\.\///' | grep -v /`
do
    if [ -e "${HOME}/$file" -a ! -L "${HOME}/$file" ]
    then
        mv "${HOME}/$file" "${HOME}/${file}.old"
    fi
    ln -sf "${dir}/$file" "${HOME}/$file"
done

#vim
mkdir -p "${HOME}/.vim"
for dir in colors snippets syntax backup swap undo
do
    mkdir -p "${HOME}/.vim/$dir"
done

for file in `find .vim -type f`
do
    ln -sf "${dir}/$file" "${HOME}/$file"
done

if [ ! -d "${HOME}/.vim/dein" ]
then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh installer.sh "${HOME}/.vim/dein"
    rm installer.sh
    vim -c 'call dein#install()' -c 'q'
fi
