#!/bin/sh


for f in .??*
do
    [ "$f" = ".git" ] && continue
    ln -snfv "$PWD/$f" "$HOME"/test/"$f"
done
