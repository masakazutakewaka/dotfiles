# auto complition
autoload -U compinit
compinit

# prompt
PROMPT='%m:%F{green}%c%f $ '

# editor
export EDITOR="nvim"
export BUNDLER_EDITOR="/Applications/RubyMine.app/Contents/MacOS/rubymine"

# cmd history
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# search cmd history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# diff command
alias diff="coloddiff"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nodebrew nodejs version manager
export PATH="/Users/masakazutakewaka/.nodebrew/current/bin:$PATH"

# python
export PATH="$HOME/Library/Python/3.6/bin:$PATH"
export PATH="$$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
## Virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

# gcp
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# cargo rust package manager
export PATH="$HOME/.cargo/bin:$PATH"

# JVM
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home/"

# go
export GOPATH="$HOME/workspace/go"
export GOBIN="$GOPATH/bin"
export PATH="/usr/local/Cellar/go/1.10.3/bin/go:$GOBIN:$GOPATH:$PATH"
export VGOROOT='/usr/local/Cellar/go/1.10.3/libexec/'

# nvim
alias v="nvim"
alias lscpu="system_profiler SPHardwareDataType"

#git command shortcut
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gg='git grep'
alias gl='git log'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gco='git checkout'
alias gr='git reset'
alias gpl='git pull'
alias gps='git push'

# docker
# kill all running containers
alias dk="docker kill $(docker ps -q)"
# delete all stopped containers
alias dsc="docker rm $(docker ps -a -q)"
# delete all images
alias dri="docker rmi $(docker images -q)"

# docker compose
alias dc='docker-compose'

# bundle exec
alias be='bundle exec'

# rails new
alias rn='be rails new --database=postgresql -MCSJ --skip-turbolinks'

# search repository with ghq and peco
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# search history with ghq and peco
function peco_select_history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco_select_history
bindkey '^h' peco_select_history

# direnv
#export EDITOR='nvim'
eval "$(direnv hook zsh)"
