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

if [ ! -d $HOME/.config/alacritty ]; then
  mkdir -p $HOME/.config/alacritty
  ln -s $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml
fi

if [ ! -d $HOME/.config/powerline-shell ]; then
    mkdir -p $HOME/.config/powerline-shell
    ln -s $PWD/powerline-shell/config.json $HOME/powerline-shell/config.json
fi

sudo nvram SystemAudioVolume=" "


##### MacのOS設定 #####

#  Finderのファイルを開くときのアニメーションを無効化
defaults write com.apple.finder DisableAllAnimations -boolean true

# Finder上でスクロールが弾むアニメーションを無効化
defaults write -g NSScrollViewRubberbanding -boolean false 

# スクロールバーを常時表示する
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# ネットワークドライブで.DS_Storeファイルを作成しないようにする
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# オートマチックウィンドウアニメーショ全て無効化する
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -boolean false

# ダイアログの表示速度を速める
defaults write -g NSWindowResizeTime 0.001

# アイコンをドラッグした時のアニメーショを無効化する
defaults write com.apple.finder AnimateSnapToGrid -boolean false

# ダッシュボードを無効化
defaults write com.apple.dashboard mcx-disabled -boolean true

# Dockアニメーションを高速化
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0

# Dockが表示される時間を0に設定
defaults write com.apple.dock workspaces-edge-delay -float 0.2

# ファインダーのアニメーションを削除
defaults write com.apple.finder AnimateInfoPanes -boolean false

# 不可視ファイルを全て表示
defaults write com.apple.finder AppleShowAllFiles -boolean true

# Finderのパス表示をホームフォルダを基準にする
defaults write com.apple.finder PathBarRootAtHome -boolean true

# Finder のタイトルバーにフルパスを表示する
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true

# 未確認のアプリケーションを実行する際のダイアログを無効にする
defaults write com.apple.LaunchServices LSQuarantine -boolean false

# Finder を終了させる項目を追加する
defaults write com.apple.Finder QuitMenuItem -boolean true

# ゴミ箱を空にする前の警告を無効化する
defaults write com.apple.finder WarnOnEmptyTrash -boolean false

# ファイルのダウンロード後に自動でファイルを開くのを無効化する
defaults write com.apple.Safari AutoOpenSafeDownloads -boolean false

# タブバーを表示する
defaults write com.apple.finder ShowTabView -boolean true

# スクリーンショットの保存形式を PNG にする
defaults write com.apple.screencapture type -string "png"

# スクリーンショット撮影時に影を取り除く
defaults write com.apple.screencapture disable-shadow -boolean true

# 検索クエリを Apple へ送信しない
defaults write com.apple.Safari SuppressSearchSuggestions -boolean true

# 検索クエリを Apple へ送信しない
defaults write com.apple.Safari UniversalSearchEnabled -boolean false

# トラックパッドのカーソル移動速度コントロール
defaults write -g com.apple.trackpad.scaling 3

# マウスのカーソル移動速度コントロール
defaults write -g com.apple.mouse.scaling 1.5

# キーリピート自体の速度コントロール
defaults write -g KeyRepeat -int 1

# キーを長押してから連続入力される(リピート)までの認識時間短縮
defaults write -g InitialKeyRepeat -int 10

# スクリーンショットの保存場所を変更
defaults write com.apple.screencapture location ~/ScreenShots/;killall SystemUIServer

# 各種アプリケーションの再起動
killall Finder
killall Dock
killall SystemUIServer



##### brewのインストールとアプリケーションインストール #####

brew install google-chrome --cask
brew install alfred --cask
brew install spectacle --cask
brew install macwinzipper --cask
brew install postman --cask
brew install docker --cask
brew install git-secrets
brew install python
brew install go
brew install hashicorp/tap/terraform
brew install tmux
brew install tree

##### 各種CLIのインストール ##### 
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
