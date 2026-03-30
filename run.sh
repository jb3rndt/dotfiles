#!/bin/zsh

# https://www.webpro.nl/articles/getting-started-with-dotfiles

# https://github.com/webpro/dotfiles
echo "Setting up/updating your Mac..."

DOTFILES_DIR="$HOME/dotfiles"

if [ ! -d "$ZSH" ]; then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

printf "\e[32m✔ Oh my zsh installed\e[0m\n"

rm -rf $HOME/.zshrc
ln -sw $DOTFILES_DIR/.zshrc $HOME/.zshrc

if [ ! -f "$DOTFILES_DIR/.zshenv" ]; then
  cp "$DOTFILES_DIR/templates/.zshenv" "$DOTFILES_DIR/local.zshenv"
fi

printf "\e[32m✔ .zshenv copied from template\e[0m\n"

printf "\e[32m✔ .zshrc linked\e[0m\n"

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

brew update
brew bundle --file $DOTFILES_DIR/Brewfile
brew upgrade

printf "\e[32m✔ Brewfile installed\e[0m\n"

source ~/.zshrc

printf "\e[32m✔ Shell reloaded\e[0m\n"

# Copy preferences files and back up existing ones
BACKUP_DIR="$DOTFILES_DIR/backup_preferences/$(date +%Y%m%d%H%M%S)"
mkdir -p $BACKUP_DIR
for file in $DOTFILES_DIR/preferences/*; do
  filename=$(basename "$file")
  if [ -e "$HOME/Library/Preferences/$filename" ]; then
    cp "$HOME/Library/Preferences/$filename" "$BACKUP_DIR"
    rm "$HOME/Library/Preferences/$filename"
  fi
  cp "$file" "$HOME/Library/Preferences/"
done

printf "\e[32m✔ Preferences copied\e[0m\n"

source $DOTFILES_DIR/.macos

printf "\e[32m✔ macOS settings applied. Consider restarting\e[0m\n"
