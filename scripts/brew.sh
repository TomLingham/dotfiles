source $HOME/.aliases

if ! program_exists brew ; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Taps
brew tap neovim/neovim

# Packages
brew install coreutils
brew install git
brew install kubernetes-cli
brew install mas
brew install neovim
brew install python
brew install python3
brew install reattach-to-user-namespace
brew install the_silver_searcher
brew install tmux
brew install tree
brew install zsh
brew install zplug

# Casks
brew cask install google-chrome
brew cask install iterm2
