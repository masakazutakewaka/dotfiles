# prompt
PROMPT='%m:%F{green}%c%f $ '

# auto complition
autoload -U compinit
compinit

# editor
export EDITOR="nvim"
export BUNDLER_EDITOR="/Applications/RubyMine.app/Contents/MacOS/rubymine"

# command history
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

# direnv
eval "$(direnv hook zsh)"

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
