DOTFILES_DIR="$HOME/dotfiles"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

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

PATH="$PATH:$HOME/.npm-global/bin/:/opt/homebrew/opt/libpq/bin:$HOME/Library/Python/3.11/bin"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:/opt/homebrew/bin"
PATH="$PATH:$HOME/Development/flutter/bin"
PATH="$PATH:$HOME/.pub-cache/bin"
PATH="$PATH:$HOME/Development/mx"

[[ ! -n "$JAVA_HOME" ]] || PATH="$PATH:$JAVA_HOME/bin"
[[ ! -n "$M2_HOME" ]] || PATH="$PATH:$M2_HOME/bin"

# Pyenv
if [[ -d $PYENV_ROOT/bin ]]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

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

source $DOTFILES_DIR/aliases.zsh

source $DOTFILES_DIR/keybinds.zsh
