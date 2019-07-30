# Path to your oh-my-zsh installation.
export ZSH="/Users/masakazutakewaka/.oh-my-zsh"
ZSH_THEME="pygmalion" # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ENABLE_CORRECTION="true" # command auto-correction.
source $ZSH/oh-my-zsh.sh


plugins=(
  rails
)


# nvim
alias v="nvim"
# device info for Mac
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
alias gbl='git blame -l'
alias gst='git stash'
alias gpp='git stash pop'
alias gcp='git cherry-pick'
# docker
alias dk="docker kill $(docker ps -q)" # kill all running containers
alias dsc="docker rm $(docker ps -a -q)" # delete all stopped containers
alias dri="docker rmi $(docker images -q)" # delete all images
# docker compose
alias dc='docker-compose'
# bundle exec
alias be='bundle exec'
# cd by dir name only for ..
alias ..="cd .."
# diff command
alias diff="coloddiff"
# rubocop
alias cop="rubocop $(git diff --cached --name-only --diff-filter=MA)"


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
