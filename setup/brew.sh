#!/bin/bash

source $HOME/.aliases

if ! program_exists brew; then
  echo "Homebrew not installed."
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Homebrew finished installing."
else
  echo "Brew is already installed. Skipping installation..."
fi

brew bundle
