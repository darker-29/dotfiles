#!/bin/sh


# Mac以外のOSだった場合は処理を中断
if [ "$(uname)" != "Darwin" ] ; then
  echo 'Whoops!! Not macOS!!'
  exit 1
fi


echo ''
echo 'Start Setup MacOS Settings...'
echo ''

# Dotfilesの配置
for f in .??*
do
    [ "$f" = ".git" ] && continue
    ln -s $PWD/$f $HOME/test/$f
done
