#!/bin/bash

#=============================================
# Dotfiles
#=============================================
dots=(
  .alacritty.yml
  .aliases
  .gitignore
  .ignore
  .tmux.conf
  .zshenv
  .zshrc
)

for i in "${dots[@]}"; do
  [ ! -h "$HOME/$i" ] && ln -s "$HOME/.dotfiles/dots/$i" "$HOME/$i"
done

touch $HOME/.custom
source $HOME/.aliases

#=============================================
# Neovim Configuration
#=============================================
[ ! -d "$HOME/.config/nvim" ] && mkdir -p $HOME/.config/nvim
[ ! -h "$HOME/.config/nvim/init.vim" ] && ln -s $HOME/.dotfiles/config/nvim/init.vim $HOME/.config/nvim/init.vim
[ ! -h "$HOME/.config/nvim/extras" ] && ln -s $HOME/.dotfiles/config/nvim/extras $HOME/.config/nvim/extras


#=============================================
# ZSH Setup
#=============================================
[ ! -d "$HOME/.zfunc" ] && mkdir $HOME/.zfunc


#=============================================
# Random bins
#=============================================
[ ! -d "$HOME/.somebin" ] && mkdir $HOME/.somebin


#=============================================
# Run Installer Scripts
#=============================================
sh ./setup/brew.sh
sh ./setup/pip.sh
sh ./setup/rust.sh
sh ./setup/source.sh


#=============================================
# Global GIT config and hooks
#=============================================
git config --global core.hooksPath $HOME/.dotfiles/git/hooks


#=============================================
# Install Vim Plug
#=============================================
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

mkdir -p $HOME/.vim/undo
mkdir -p $HOME/.vim/backup
mkdir -p $HOME/.vim/swap


#=============================================
# VS Code Configuration
#=============================================
vsconfs=(
  keybindings.json
  settings.json
  vsicons.settings.json
)

for i in "${vsconfs[@]}"; do
  ln -sF "$HOME/.dotfiles/vscode/${i}" "$HOME/Library/Application Support/Code/User/${i}"
done

while read in; do
  vs --install-extension "$in"
done < "$HOME/.dotfiles/vscode/extensions"

