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
  tmux
  tree
  vim
  yarn
  zplug
  zsh
)

# Casks (Grpahical Applications)
casks=(
  google-chrome
  iterm2
  visual-studio-code
)

if ! program_exists brew; then
  echo "Homebrew not installed."
  echo "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" >/dev/null
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
