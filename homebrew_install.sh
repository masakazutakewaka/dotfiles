#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

brew upgrade --all

formulas=(
    git
    wget
    curl
    tree
    openssl
    colordiff
    #"--without-etcdir zsh"
    zsh-completions
    #"--with-cocoa --srgb emacs"
    cask
    #ansible
    peco
    ghq
    hub
    tig
    node
    yarn
    python3
    mysql
    postgresql
    sqlite
    redis
    memcached
    elasticsearch
    solr
    #"php55 --homebrew-apxs"
    #httpd22
    #composer
    #markdown
    ctags
    #ssh-copy-id
    mecab
)

"brew tap..."
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew tap homebrew/apache
brew tap sanemat/font

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    bettertouchtool
    google-chrome
    google-japanese-ime
    slack
    iterm2
    virtualbox
    vagrant
    vagrant-manager
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
