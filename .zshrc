# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Move Cursor bindings
bindkey "[C" forward-word
bindkey "[D" backward-word

PATH="$PATH:/Users/jberndt/.npm-global/bin/:/opt/homebrew/opt/libpq/bin:/Users/jberndt/Library/Python/3.11/bin"
PATH="$PATH:/Users/jberndt/.local/bin"
PATH="$PATH:/Users/jberndt/Development/flutter/bin"
PATH="$PATH:/Users/jberndt/.pub-cache/bin"

export GRAALVM_HOME="/Library/Java/JavaVirtualMachines/graalvm-jdk-21.0.3+7.1/Contents/Home"
export GRAALVM23_HOME="/Library/Java/JavaVirtualMachines/graalvm-jdk-23.0.1+11.1/Contents/Home"
export OPENLABS_HOME="/Library/Java/JavaVirtualMachines/labsjdk-ce-21.0.2-jvmci-23.1-b33/Contents/Home"
export JDK21_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"

export JAVA_HOME=$GRAALVM23_HOME

PATH="$PATH:$JAVA_HOME/bin"
PATH="$PATH:/opt/apache-maven-3.9.6/bin"

PATH="$PATH:/Users/jberndt/Development/mx"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export GRAALPY_HOME="$HOME/Documents/SWD24/venv"

# Bat (better cat) (https://github.com/sharkdp/bat)

export BAT_THEME="TwoDark"
alias cat="bat"

# Eza (better ls)

alias ls="eza --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions"

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

alias refresh="source ~/.zshrc"
