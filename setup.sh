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

ln -s "$HOME/.dotfiles/config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -s "$HOME/.dotfiles/config/nvim/extras" "$HOME/.config/nvim/extras"

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
