#!/bin/zsh
kil() {
    killall $1 1>/dev/null 2>&1 ; $@ >/tmp/$1.log 2>&1 &
}

alias pd="pushd"
alias pdh"pushd ~"
alias ppd="popd"

go="$HOME/go"
gosrc="$go/src"
gobin="$go/bin"
[[ ! -d $gosrc ]] && mkdir -p $gosrc
[[ ! -d $gobin ]] && mkdir -p $gobin
export PATH="$PATH:$gobin"
export GOPATH="$go"
export XDG_CONFIG_HOME="$HOME/.config"
which dotnet && PATH="$PATH:~/.dotnet/tools"
