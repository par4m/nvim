#!/bin/bash

warnnvim() {
  git clone https://github.com/neovim/neovim.git ~/.config/nvim/neovim
  sudo rm /usr/local/bin/nvim
  sudo rm -r /usr/local/share/nvim/
  cd ~/.config/nvim/neovim
  make CMAKE_BUILD_TYPE=Release
  sudo make install
  rm -rf ~/.config/nvim/neovim
}

warnnode() {
  echo "Please install node"
  exit
}

warngit() {
  echo "Please install git"
  exit
}

changedirname() {
  mv $HOME/.config/nvim $HOME/.config/oldneovim
  echo "Your existing nvim config has been changed to oldneovim"
  clonerepo
}

clonerepo() {
  echo "Cloning repo..."
  git clone https://github.com/par4m/nvim ~/.config/nvim
  nvim +PackerSync
}

which nvim >/dev/null && echo "Neovim is installed" || warnnvim
which node >/dev/null && echo "Node is installed" || warnnode
which git >/dev/null && echo "Git is installed" || warngit

[ -d "$HOME/.config/nvim" ] && changedirname || clonerepo

