#!/bin/sh -eux
umask 0022
export LC_ALL='C' PATH="$(command -p getconf PATH):$PATH"

cd `dirname "${0}"`
dir=`pwd`
for file in `find -type f -name '.*' | sed 's@^\./@@' | grep -v /`
do
    if [ -e "${HOME}/$file" -a ! -L "${HOME}/$file" ]
    then
        mv "${HOME}/$file" "${HOME}/${file}.old"
    fi
    ln -sf "${dir}/$file" "${HOME}/$file"
done

#vim
for d in backup swap undo
do
    mkdir -p "${HOME}/.vim/$d"
done
for file in `ls -1 .vim/*.vim`
do
    ln -sf "${dir}/$file" "${HOME}/$file"
done
for d in colors snippets syntax
do
    ln -sf "${dir}/.vim/$d" "${HOME}/.vim/$d"
done

if [ ! -d "${HOME}/.vim/dein" ]
then
    if command -v wget
    then
        wget https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
    elif command -v curl
    then
        curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    else
        exit 1
    fi
    echo sh installer.sh "${HOME}/.vim/dein"
    rm installer.sh
fi
