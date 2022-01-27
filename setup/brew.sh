#!/bin/bash

source $HOME/.aliases

taps=(
  homebrew/cask-fonts
  federico-terzi/espanso
)

packages=(
  coreutils
  espanso
  flutter
  git
  go
  jq
  kubernetes-cli
  mas
  neovim
  pdfgrep
  python3
  rbenv
  ripgrep
  starship
  tmux
  tree
  vim
  yq
  zplug
  zsh
  zsh-autosuggestions
)

casks=(
  android-studio
  beekeeper-studio
  docker
  firefox
  font-fira-code-nerd-font
  gpg-suite-no-mail
  intellij-idea
  iterm2
  keeweb
  miro
  monitorcontrol
  obsidian
  postman
  rectangle
  visual-studio-code
)

if ! program_exists brew; then
  echo "Homebrew not installed."
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
  if brew ls --versions --cask $cask >/dev/null; then
    echo "[homebrew:cask] $cask is already installed"
  else
    brew install --cask $cask
  fi
done
