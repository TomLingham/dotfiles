#!/usr/bin/env zsh

#=============================================
# Dotfiles
#=============================================
echo "Installing dotfiles..."

for dot in dots/.*; do
  file=$(basename $dot)
  from="$HOME/.dotfiles/dots/$file"
  to="$HOME/$file"

  if [ -L "$to" ] ; then
    echo "File is already linked: $to"
    continue
  fi

  [ ! -d "$from" ] && [ ! -e "$to" ] && ln -s "$from" "$to" && echo "Linked $to"
done

touch $HOME/.custom
source $HOME/.aliases

echo "Completed setting up dotfiles!"; echo

#=============================================
# Neovim Configuration Files
#=============================================
echo "Installing Neovim configuration..."

ln -sF "$HOME/.dotfiles/config/nvim" "$HOME/.config/nvim"
ln -sF "$HOME/.dotfiles/config/alacritty" "$HOME/.config/alacritty"

echo "Finished installing Neovim configuration!"; echo

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
echo "Installing dependencies and packages..."

echo "> HomeBrew"
bash ./setup/brew.sh

echo "> Rust"
bash ./setup/rust.sh

echo "> Node"
bash ./setup/node.sh

echo "> Python"
bash ./setup/pip.sh

echo ">SDK Man"
curl -s "https://get.sdkman.io" | bash

echo "Finished installing dependencies and packages!"; echo

#=============================================
# Load terminfo for italics etc. in tmux
#=============================================
tic -x xterm-256color-italic.terminfo
tic -x tmux-256color.terminfo


#=============================================
# Global GIT config and hooks
#=============================================
git config --global core.hooksPath "$HOME/.dotfiles/git/hooks"
git config --global core.excludesfile "$HOME/.gitignore"

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
mkdir -p "$HOME/Library/Application Support/Code/User/"
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


#=============================================
# Extras
#=============================================

# Disable long press accented characters
defaults write -g ApplePressAndHoldEnabled -bool false

# Install FZF Shell History Search
~/.fzf/install --no-bash --no-fish --no-update-rc
