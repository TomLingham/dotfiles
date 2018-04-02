#!/bin/bash

source $HOME/.aliases

if ! program_exists brew ; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

function is_installed {
  brew ls --versions $1 > /dev/null
}

# Taps
brew tap neovim/neovim

# Packages
packages=(
  coreutils
  git
  go
  kubernetes-cli
  mas
  neovim
  nvm
  peco
  python
  python3
  reattach-to-user-namespace
  tmux
  tree
  vim
  zplug
  zsh
)

for package in "${packages[@]}"; do
  if is_installed $package ; then
    echo "[homebrew] $package is already installed"
  else
    brew install $package
  fi
done

# Casks
brew cask install google-chrome
brew cask install iterm2
brew cask install visual-studio-code
