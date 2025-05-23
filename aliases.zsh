#!/bin/zsh

alias cat="bat"
alias ls="eza --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions"
alias refresh="source ~/.zshrc"
alias reload="source ~/.zshrc"
alias update-dotfiles="zsh $DOTFILES_DIR/update.sh"
alias search="cat ~/.zshrc_history | grep"
