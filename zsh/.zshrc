#!/usr/bin/zsh

# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
which colorls >/dev/null && zpm load gretzky/auto-color-ls \
    || echo "install colorls"


if [[ ! -f ~/.zpm/zpm.zsh ]]; then
  git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
fi
source ~/.zpm/zpm.zsh

zpm load zpm-zsh/colors
zpm load zpm-zsh/autoenv
zpm load zsh-users/zsh-history-substring-search
zpm load Tarrasch/zsh-bd
zpm load zpm-zsh/check-deps
zpm load sei40kr/fast-alias-tips-bin #, from:gh-r, as:command, rename-to:def-matcher
zpm load sei40kr/zsh-fast-alias-tips



# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#!/usr/bin/zsh
bindkey -v 


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


n=$(( $(tmux list-sessions | \
    grep -oE 'ssh-[0-9]*' | \
    tail -n1 | cut -d'-' -f2)+1))
# tmux new -s "ssh-$n"
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec
