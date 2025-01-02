#!/bin/zsh

# Check if git is configured globally
if ! git config --global user.name >/dev/null; then
    echo "Configuring git globally..."
    read -p "Enter your name: " name
    read -p "Enter your email: " email
    git config --global user.name "$name"
    git config --global user.email "$email"
else
    echo "Git is already configured globally."
fi

# Clone the dotfiles repo into HOME/dotfiles
if [ ! -d "$HOME/dotfiles" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/jb3rndt/dotfiles.git "$HOME/dotfiles"
else
    echo "Dotfiles repository already exists."
fi

echo "Running run.sh..."

cd "$HOME/dotfiles" && ./run.sh
