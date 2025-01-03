#!/bin/zsh

# Clone the dotfiles repo into HOME/dotfiles
if [ ! -d "$HOME/dotfiles" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/jb3rndt/dotfiles.git "$HOME/dotfiles"
else
    echo "Dotfiles repository already exists."
fi

echo "Running run.sh..."

cd "$HOME/dotfiles" && ./run.sh
