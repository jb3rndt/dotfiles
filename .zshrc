export DOTFILES_DIR="$HOME/dotfiles"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions)

zstyle ':omz:update' mode auto

source $ZSH/oh-my-zsh.sh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $DOTFILES_DIR/.p10k.zsh ]] || source $DOTFILES_DIR/.p10k.zsh

[[ ! -f $DOTFILES_DIR/local.zshenv ]] || source $DOTFILES_DIR/local.zshenv

PATH="$PATH:/opt/homebrew/bin"
PATH="$PATH:/opt/homebrew/opt/libpq/bin"
PATH="$PATH:$HOME/.npm-global/bin/"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/Development/flutter/bin"
PATH="$PATH:$HOME/.pub-cache/bin"
PATH="$PATH:$HOME/Development/mx"
PATH="$PATH:$DOTFILES_DIR/bin"

[[ ! -n "$JAVA_HOME" ]] || PATH="$PATH:$JAVA_HOME/bin"
[[ ! -n "$M2_HOME" ]] || PATH="$PATH:$M2_HOME/bin"

# tree-me (git worktree wrapper) (Shoutouts: https://haacked.com/archive/2025/11/21/tree-me)
source <(tree-me shellenv)

# Bat (better cat) (https://github.com/sharkdp/bat)
export BAT_THEME="TwoDark"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jberndt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jberndt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jberndt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jberndt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH

source $DOTFILES_DIR/aliases.zsh

source $DOTFILES_DIR/keybinds.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
