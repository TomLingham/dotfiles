#!/bin/bash

#=============================================
# Dotfiles
#=============================================
dotfiles="$(ls -aA dots)"
GLOBIGNORE=".:.." && for dot in dotfiles; do
  [ ! -d "$f" ] && ln -s "$(pwd)/$dot" "$HOME/$dot"
done

touch $HOME/.custom
source $HOME/.aliases

#=============================================
# Neovim Configuration Files
#=============================================
nvimconfs=(
  init.vim
  extras
)

mkdir -p $HOME/.config/nvim

for i in "${nvimconfs[@]}"; do
  ln -sF "$HOME/.dotfiles/config/nvim/${i}" "$HOME/.config/nvim/${i}"
done


#=============================================
# Directories
#=============================================

# ZSH functions
mkdir -p $HOME/.zfunc

# Random bins
mkdir -p $HOME/.somebin


#=============================================
# Run Installer Scripts
#=============================================
sh ./setup/brew.sh
sh ./setup/npm.sh
sh ./setup/pip.sh
sh ./setup/rust.sh


#=============================================
# Load terminfo for italics etc. in tmux
#=============================================
tic -x xterm-256color-italic.terminfo
tic -x tmux-256color.terminfo


#=============================================
# Global GIT config and hooks
#=============================================
git config --global core.hooksPath $HOME/.dotfiles/git/hooks
git config --global core.excludesfile $HOME/.gitignore

git config --global alias.cane 'commit --amend --no-edit'
git config --global alias.unstage 'reset HEAD --'


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

