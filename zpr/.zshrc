#!/bin/zsh
#
if [[ ! -L ~/.zpreztorc ]]; then
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        [[ "zshrc" == "$(basename $rcfile)" ]] && continue
        ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi

. "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/zshrc
