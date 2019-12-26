# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.local/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#alias rvm-prompt="echo > /dev/null"
# ZSH_THEME="fino-time"
# ZSH_THEME="ys"
# ZSH_THEME="spaceship"
ZSH_THEME="gnzh"
# ZSH_THEME="gallifrey"
# ZSH_THEME="strug"
#ZSH_THEME="tom"


# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  archlinux
  colorize
  colored-man-pages
  common-aliases
  dircycle
  dirhistory
  docker
  #fzf
  git-extras
  gitfast
  glassfish
  go
  golang
#  jsontools
  history-substring-search
  man
  nmap
  pip
  python
  sudo
  systemd
  themes
  tmux
  web-search
#  tugboat
  $zsh_reload
  vi-mode
  z
)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
[[ -f ~/.private ]] && . ~/.private
if [[ -n ${LAUNCHER} ]]; then
        bindkey -s "^M" " & \n"
            bindkey -s "^[" "; exit \n"
                return
            fi
export PATH=$PATH:$HOME/bin:/usr/lib/jvm/default/bin
export JAVA_HOME=/usr/lib/jvm/default

alias gclr="git clone --recursive"
alias xev="xev -event keyboard"
alias purg="tsh ssh --insecure --user $tuser --proxy $tproxy \
    --cluster $tcluster $tuser@$purghost"
alias '$'=' '
#. /usr/local/oecore-x86_64/environment-setup-armv7at2hf-neon-angstrom-linux-gnueabi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# capture command and output
function capture {
  local PROMPT=${1-$}
  echo -n "${PROMPT} "
  echo -n "${history[$HISTCMD]}" | perl -pe 's/\s*\|\s*capture.*$//;s/\\\n/\\\n  /g'
  echo -ne "\n\n"
  cat
}
myshit=("$HOME/.profile" "$HOME/.slack"); for f in ${myshit[@]}; do
#    echo $f
    [[ -f $f ]] && . $f
done
setopt extendedglob
source /usr/share/doc/find-the-command/ftc.zsh
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin


export TOYBOX_HOME=src/docker-toybox/toybox
export PATH=$TOYBOX_HOME:$PATH
source ~/dots/zpr/.zshrc

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm"  ]] && source "$HOME/.rvm/scripts/rvm"
alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
which bonsai >/dev/null 2>&1 && bonsai
