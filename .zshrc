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

export JAVA_HOME="/Library/Java/JavaVirtualMachines/graalvm-jdk-21.0.3+7.1/Contents/Home"

PATH="$PATH:$JAVA_HOME/bin"
PATH="$PATH:/opt/apache-maven-3.9.6/bin"

# Bat (better cat) (https://github.com/sharkdp/bat)

export BAT_THEME="TwoDark"
alias cat="bat"

# Eza (better ls)

alias ls="eza --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions"
