#!/bin/zsh

dots=(
  .agignore
  .aliases
  .tmux.conf
  .zshrc
);

for i in "${dots[@]}"; do
  ln -s ".dotfiles/${i}" "../${i}"
done

ln -s "../../.dotfiles/init.vim" "../.config/nvim/init.vim"

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
