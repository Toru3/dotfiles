#!/bin/sh -x
cd `dirname "${0}"`
dir=`pwd`
for f in .??*
do
    test "$f" = ".git" && continue
    if [ -e "${HOME}/$f" -a ! -L "${HOME}/$f" ]
    then
        mv "${HOME}/$f" "${HOME}/${f}.old"
    fi
    ln -sf "${dir}/$f" "${HOME}/$f"
done

#vim
mkdir -p ${HOME}/.vim
for dir in colors snippets syntax backup swap undo
do
    mkdir -p ${HOME}/.vim/$dir
done

for file in `find .vim -type f`
do
    ln -sf "${dir}/$f" "${HOME}/$f"
done

if [ ! -d "${HOME}/.vim/dein" ]
then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh installer.sh "${HOME}/.vim/dein"
fi
