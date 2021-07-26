# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PATH

export ZSH="/Users/d_ito/.oh-my-zsh"
export PATH="$PATH:/bin:/usr/bin:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/usr/local/opt/mysql@5.7/bin/mysql"
export PATH="$PATH:/usr/local/bin/php"
# export PATH="/usr/local/opt/php@7.4/bin:$PATH"
# export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"

export PATH="/usr/local/opt/mysql@5.7/bin/:$PATH"
export PATH="/usr/local/opt/python@3.7/bin:$PATH"
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
export NVM_DIR="~/.nvm"

ZSH_THEME="powerlevel10k/powerlevel10k"

# zsh alias
alias vi="vim"
alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias mk="mkdir"
alias zconf="vi ~/.zshrc"
alias vconf="vi ~/.vimrc"
alias gconf="vi ~/.gitconfig"
alias phpunit="./vendor/bin/phpunit"
alias phpcs="./vendor/bin/phpcs"
alias phpcbf="./vendor/bin/phpcbf"


# Docker-Compose alias
alias dc="docker-compose"
alias dc-p="docker-compose ps"
alias dc-e="docker-compose exec"
alias dc-d="docker-compose down"
alias dc-s="docker-compose stop"
alias dc-u="docker-compose up -d"
alias dc-ub="docker-compose up -d --build"
alias dc-b="docker-compose build"
alias dc-l="docker-compose logs"
alias dc-nl="docker-compose network list"
alias dc-ni="docker-compose network inspect"
alias dc-nr="docker-compose network rm"
alias dc-vl="docker-compose volume list"
alias dc-vr="docker-compose volume rm"
alias dc-il="docker-compose image list"
alias dc-ir="docker-compose image rm"


# Vagrant alias
alias v-i="vagrant init"
alias v-u="vagrant up"
alias v-st="vagrant status"
alias v-s="vagrant ssh"
alias v-r="vagrant reload"
alias v-st="vagrant status"
alias v-d="vagrant destroy"
alias v-h="vagrant halt"
alias v-ba="vagrant box add"
alias v-br="vagrant box rm"
alias v-v="vi Vagrantfile"

source $ZSH/oh-my-zsh.sh


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

# zplugin list
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-completions
zplugin light zsh-users/zsh-history-substring-search
zplugin light zsh-users/zsh-syntax-highlighting


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/d_ito/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/d_ito/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/d_ito/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/d_ito/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Zsh設定
#
## cdを使わずにディレクトリを移動できる
setopt auto_cd
cdpath=(.. ~ /)

## "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd

## コマンドの打ち間違いを指摘してくれる
setopt correct
