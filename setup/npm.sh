#!/bin/bash

source $HOME/.aliases

mkdir -p "$HOME/.nvm"
ln -s "$HOME/.dotfiles/nvm/default-packages" "$HOME/.nvm/"


if ! program_exists node; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
  . ~/.nvm/nvm.sh
  nvm install --lts --latest-npm
fi


for package in "${packages[@]}"; do
  if npm list -g $package > /dev/null; then
    echo "[npm:package] $package is already installed"
  else
    npm install -g $package
  fi
done

