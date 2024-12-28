# https://www.webpro.nl/articles/getting-started-with-dotfiles

# https://github.com/webpro/dotfiles
echo "Setting up/udpating your Mac..."

if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

rm -rf $HOME/.zshrc
ln -sw $HOME/.dotfiles/.zshrc $HOME/.zshrc

brew update
brew bundle --file ./Brewfile
