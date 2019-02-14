#!/bin/bash

source $HOME/.aliases

# Taps (Repositories)
taps=(
  neovim/neovim
)

# Packages (CLI/Binaries)
packages=(
  coreutils
  git
  go
  kubernetes-cli
  mas
  neovim
  python
  python3
  rbenv
  ripgrep
  tmux
  tree
  vim
  yarn --ignore-dependencies
  zplug
  zsh
)

# Casks (Grpahical Applications)
casks=(
  docker
  firefox
  google-chrome
  iterm2
  marshallofsound-google-play-music-player
  postman
  slack
  visual-studio-code
)

if ! program_exists brew; then
  echo "Homebrew not installed."
  echo "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Homebrew finished installing."
fi

for tap in "${taps[@]}"; do
  brew tap $tap
done

for package in "${packages[@]}"; do
  if brew ls --versions $package >/dev/null; then
    echo "[homebrew:package] $package is already installed"
  else
    brew install $package
  fi
done

for cask in "${casks[@]}"; do
  if brew cask ls --versions $cask >/dev/null; then
    echo "[homebrew:cask] $cask is already installed"
  else
    brew cask install $cask
  fi
done
