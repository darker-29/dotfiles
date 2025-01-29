#!/bin/sh

# Mac以外のOSだった場合は処理を中断
if [ "$(uname)" != "Darwin" ] ; then
  echo 'Whoops!! Not macOS!!'
  exit 1
fi


echo ''
echo 'Start Setup MacOS Settings...'
echo ''

##### Dotfilesの配置 #####
for f in .??*
do
  [ "$f" = ".git" ] && continue
  ln -s $PWD/$f $HOME/$f
done

##### MacOSの設定 #####
bash ./.MacOS.sh


##### brewのインストールとアプリケーションインストール #####
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

do
  ln -s $PWD/.Brewfile $HOME/.Brewfile
done

brew bundle --global


##### 各種CLIのインストール ##### 
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
