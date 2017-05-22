source $HOME/.aliases

if ! program_exists rustup ; then
  curl https://sh.rustup.rs -sSf | sh
fi

rustup completions zsh > ~/.zfunc/_rustup

