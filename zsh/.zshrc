#!/bin/zsh
# uncomment this and the last line for zprof info
# zmodload zsh/zprof
zlog=/tmp/zshrc.log
cat /dev/null > $zlog
loge() {
    echo $@ >> $zlog
}
export PATH=$PATH:$HOME/bin
# antibody
[[ -d $HOME/bin ]] || mkdir -p $HOME/bin
which antibody || curl -sfL git.io/antibody | sh -s - -b $HOME/bin
alias abdy="$HOME/bin/antibody"


# shortcut to this dotfiles path is $DOTFILES
export DOTFILES="$HOME/.zsh" #"dotfiles"
DF=$DOTFILES
[[ -d $DOTFILES ]] || mkdir $DOTFILES

# your project folder that we can `c [tab]` to
export PROJECTS="$HOME/src"

# your default editor
EDITOR='nvim'
which $EDITOR >/dev/null 2>&1 || EDITOR='vim'
export EDITOR
export VISUAL=$EDITOR

export VEDITOR='code'

# [[ -d $DF/purer ]] || git clone https://github.com/DFurnes/purer.git $DF/purer
# oh-my-zsh

ZSH=$DOTFILES/oh-my-zsh
[[ -d $ZSH ]] || git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH
DISABLE_AUTO_UPDATE=true
plugins=(
    archlinux
    catimg
    colored-man-pages
    docker
    docker-compose
    docker-machine
    dotenv
    emoji
    git
    man
    nmap
    mosh
    perms
    profiles
    python
    salt
    tmux
    web-search
    vi-mode
    sudo
    systemd
)
# FIXME: parser error in .zcompdump
source $ZSH/oh-my-zsh.sh

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/*/*.zsh)

# load the path files
for f in ${(M)config_files:#*/path.zsh}; do
    loge $f
  source "$f"
done

# load antibody plugins
#
myplugs=$HOME/.zbundles
aplugs=$HOME/.zsh_plugins.sh
[[ -f $myplugs ]] || cp $DOTFILES/antibody/bundles.txt $myplugs
antibody bundle <$myplugs >$aplugs
md5sum $aplugs > /tmp/$(basename $aplugs).md5
doupdate=true
if [[ -f $aplugs.md5 ]]; then
    diff $aplugs.md5 /tmp/$(basename $aplugs).md5 && doupdate=false
fi
mv /tmp/$(basename $aplugs).md5 $aplugs.md5
[[ true == $doupdate ]] && antibody update
source $aplugs

# load everything but the path and completion files
for f in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do
    loge $f
  source "$f"
done

autoload bashcompinit
bashcompinit
source /usr/share/bash-completion/completions/aria2c
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C


# load every completion after autocomplete loads
for f in ${(M)config_files:#*/completion.zsh}; do
    loge $f
  source "$f"
done

unset config_files updated_at

# use .localrc for SUPER SECRET CRAP that you don't
# want in your public, versioned repo.
# shellcheck disable=SC1090
[ -f ~/.localrc ] && . ~/.localrc

# add color
autoload colors
colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


def_iface=$(ip route show default | grep -Po 'dev \K.*?(?= )')
ss_bin="ncmatrix"
ss_args="-s -b -u 10 -I $def_iface -C blue -T red -R yellow"
alias ss="$ss_bin $ss_args"
sss="$HOME/bin/sss"
zstyle ":morpho" screen-saver "$sss" 
# select screen saver "zmorpho"; available: zmorpho, zmandelbrot, zblank, pmorpho
                                        # this  can also be a command, e.g. "cmatrix"
zstyle ":morpho" arguments "$ss_args"         
# arguments given to screen saver program; -s - every key press ends

zstyle ":morpho" delay "600"            
# 5 minutes before screen saver starts

zstyle ":morpho" check-interval "60"    
# check every 1 minute if to run screen saver
# make sure python is setup correctly
py37=$(pyenv versions | grep -oE '^\s+3.7[^/]+$' | tr -d '[:space:]')
if [[ -z $py37 ]]; then
    py37='3.7.7'
    pyenv install $py37
fi
echo $py37
if [[ -z "$(pyenv virtualenvs | grep neovim)" ]]; then 
    pyenv virtualenv $py37 neovim
    echo "|-----------------------|"
    echo "| you should run these: |"
    echo "| pyenv activate neovim |"
    echo "| pip install neovim    |"
    echo "| deactivate            |"
    echo "|-----------------------|"
fi
    # pyenv virtualenv $py37 neovim3
    # pyenv activate neovim3
    # pip install neovim


# autoload -U promptinit; promptinit
# prompt purer
which direnv >/dev/null 2>&1 && source <(direnv hook zsh)
which ksdk >/dev/null 2>&1 && source <(_KSDK_COMPLETE=source_zsh ksdk)
which pyenv >/dev/null 2>&1 && source <(pyenv init -)
which pyenv >/dev/null 2>&1 && source <(pyenv virtualenv-init -)
which pyenv >/dev/null 2>&1 && source /usr/share/zsh/site-functions/_pyenv
which pyenv >/dev/null 2>&1 && pyenv virtualenvwrapper_lazy


# zprof
pager=/usr/share/nvim/runtime/macros/less.sh
[[ -f $pager ]] && alias less=$pager
alias nmcs="nmcli con show"
alias nmc=nmcs
alias nmcu="nmcli con up"
alias nmcd="nmcli con down"
