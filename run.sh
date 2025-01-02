#!/bin/bash

# https://www.webpro.nl/articles/getting-started-with-dotfiles

# https://github.com/webpro/dotfiles
echo "Setting up/updating your Mac..."

if [ ! -d "$ZSH" ]; then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

printf "\e[32m✔ Oh my zsh installed\e[0m\n"

rm -rf $HOME/.zshrc
ln -sw $HOME/dotfiles/.zshrc $HOME/.zshrc

printf "\e[32m✔ .zshrc linked\e[0m\n"

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

brew update
brew bundle --file $HOME/dotfiles/Brewfile
brew upgrade

source ~/.zshrc
