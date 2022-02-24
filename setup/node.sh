#!/bin/bash
mkdir -p "$HOME/.nvm"
ln -s "$HOME/.dotfiles/nvm/default-packages" "$HOME/.nvm/"


curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install node

