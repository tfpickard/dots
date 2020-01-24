# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# What does this do?
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    at:0``.11.0, \
    as:command, \
    use:"*darwin*amd64*", \
    rename-to:fzf
# It grabs the binary of fzf-bin version 0.11.0 from GitHub Release and uses
# the file that matches "*darwin*amd64" as a command called fzf!

zplug "mafredri/zsh-async", from:github, defer:0
zplug "jimmijj/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"

zplug "plugins/git",   from:oh-my-zsh
zplug "olivierverdier/zsh-git-prompt", use:"*.sh"
zplug "b4b4r07/enhancd", use:enhancd.zsh
zplug "raylee/tldr", from:github, as:command, use:"tldr"


zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug check || zplug install
zplug load --verbose
