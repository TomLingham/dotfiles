#!/bin/zsh

#=============================================
# Dotfiles
#=============================================
dots=(
  aliases
  tmux.conf
  zshrc
  gitignore
);

for i in "${dots[@]}"; do
  ln -s "$HOME/.dotfiles/dots/${i}" "$HOME/.${i}"
done

source $HOME/.zshrc

#=============================================
# Neovim Configuration
#=============================================
ln -s $HOME/.dotfiles/config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/.dotfiles/config/nvim/extras $HOME/.config/nvim/extras


#=============================================
# Install Vim Plug
#=============================================
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#=============================================
# ZSH Setup
#=============================================
mkdir $HOME/.zfunc


#=============================================
# Random bins
#=============================================
mkdir $HOME/.somebin


#=============================================
# Run Installer Scripts
#=============================================

sh ./setup/brew.sh
sh ./setup/rust.sh
sh ./setup/pip.sh
sh ./setup/source.sh
