#!/bin/bash

source $HOME/.aliases

# Global Packages
packages=(
  serverless
)

for package in "${packages[@]}"; do
  if npm list -g $package > /dev/null; then
    echo "[npm:package] $package is already installed"
  else
    npm install -g $package
  fi
done
