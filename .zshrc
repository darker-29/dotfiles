# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PATH


export PATH="$PATH:/Users/daiki.ito/Library/Python/3.8/bin"
export PATH="$PATH:/opt/homebrew/bin/"
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


export PATH="$PATH:/Users/daiki.ito/flutter/bin"

ZSH_THEME="powerlevel10k/powerlevel10k"

export PATH=${PATH}:~/.guard/bin

# zsh alias
alias vi="vim"
alias ls="exa"
alias ll="exa -la"
alias tree="tree -C"
alias mkdir="mkdir -p"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias mk="mkdir"
alias zconf="vim ~/.zshrc"
alias vconf="vim ~/.vimrc"
alias gconf="vim ~/.gitconfig"
alias phpunit="./vendor/bin/phpunit"
alias phpcs="./vendor/bin/phpcs"
alias phpcbf="./vendor/bin/phpcbf"

alias flutter="fvm flutter"
alias dart="fvm dart"


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



# bat
alias cat="bat --style=plain"

# python
alias python="python3"

# terraform
alias tf="terraform"


# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME'/google-cloud-sdk/path.zsh.inc' ]; then . $HOME'/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f $HOME'/google-cloud-sdk/completion.zsh.inc' ]; then . $HOME'/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Zsh設定
#
## cdを使わずにディレクトリを移動できる
setopt auto_cd

## "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd

## コマンドの打ち間違いを指摘してくれる
setopt correct



lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

ld()
{
    lazydocker "$@"
}

# Remove Docker Container
rm-con()
{
    docker rm $(docker stop $1)
}

# Clean Docker Container
clean-con()
{
    docker rm $(docker stop $(docker ps -a | awk '{print $1}' | tail -n +2))
}

# Clean Docker Image
clean-img()
{
    docker image rm $(docker image list | awk '{print $1":"$2}' | tail -n +2)
}


# AWS PROFILEの切り替えコマンドエイリアス
alias awsp="source _awsp"

eval "$(direnv hook zsh)"
export EDITOR=vim


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/daiki.ito/.dart-cli-completion/zsh-config.zsh ]] && . /Users/daiki.ito/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]



# viモードを設定
set -o vi

# zsh docker auto completion config
FPATH="$HOME/.zsh/completion:$FPATH"
#fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit


#--------------------------------
# プロンプトを2行表示し、現在のモードを表示する。
#--------------------------------

autoload -Uz colors
colors

PROMPT_INS="%d %{${fg[blue]}%}[INSERT] %{${reset_color}%}>> "
PROMPT_NOR="%d %{${fg[red]}%}[NORMAL] %{${reset_color}%}>> "
PROMPT_VIS="%d %{${fg[green]}%}[VISUAL] %{${reset_color}%}>> "

PROMPT=$PROMPT_INS

function zle-line-pre-redraw {
    if [[ $REGION_ACTIVE -ne 0 ]]; then
        NEW_PROMPT=$PROMPT_VIS
    elif [[ $KEYMAP = vicmd ]]; then
        NEW_PROMPT=$PROMPT_NOR
    elif [[ $KEYMAP = main ]]; then
        NEW_PROMPT=$PROMPT_INS
    fi

    if [[ $PROMPT = $NEW_PROMPT ]]; then
        return
    fi

    PROMPT=$NEW_PROMPT

    zle reset-prompt
}

function zle-keymap-select zle-line-init {
    case $KEYMAP in
        vicmd)
            PROMPT=$PROMPT_NOR
            ;;
        main|viins)
            PROMPT=$PROMPT_INS
            ;;
    esac

    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-pre-redraw

source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
