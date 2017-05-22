#!/bin/zsh

#=============================================
# Dotfiles
#=============================================
dots=(
  agignore
  aliases
  tmux.conf
  zshrc
  gitignore
);

for i in "${dots[@]}"; do
  ln -s "$HOME/.dotfiles/${i}" "$HOME/.${i}"
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
# Run Installer Scripts
#=============================================

# Brew
sh ./scripts/brew.sh
sh ./scripts/rust.sh
sh ./scripts/source.sh
