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

ZSH_THEME="powerlevel10k/powerlevel10k"

# zsh alias
alias vi="vim"
alias ll="ls -la"
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

# bat
alias cat="bat --style=plain"


### Added by Zinit's installer

# zplugin list
zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-completions
zinit load zsh-users/zsh-history-substring-search
zinit load zsh-users/zsh-syntax-highlighting


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
cdpath=(.. ~ /)

## "cd -"の段階でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd

## コマンドの打ち間違いを指摘してくれる
setopt correct


# PowerLine-Shellの実行
function powerline_precmd() {
    echo "\n"
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk



lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}
