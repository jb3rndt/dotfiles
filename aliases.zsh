#!/bin/zsh

alias cat="bat"
alias ls="eza --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions"
alias refresh="source ~/.zshrc"
alias reload="source ~/.zshrc"
alias update-dotfiles="zsh $DOTFILES_DIR/update.sh"
alias search="cat ~/.zsh_history | grep"
alias y="yarn"
alias cc="claude --allow-dangerously-skip-permissions"
alias oc="opencode"
alias dream="tree-me create"
alias term="open -a iTerm ."
alias lg="lazygit"
alias ys="yarn run start"
alias yd="yarn run dev"
alias ytf="yt frontend -u"
alias ytb="yt backend"

# Generic yarn workspace command runner
# Automatically finds the workspace name from package.json
yw() {
    local pkg=$1
    local cmd=$2
    local args=${@:3}

    # Find the package.json for the given package
    local pkg_json=""
    for dir in packages apps .; do
        if [[ -f "${dir}/${pkg}/package.json" ]]; then
            pkg_json="${dir}/${pkg}/package.json"
            break
        fi
    done

    if [[ -z "$pkg_json" ]]; then
        echo "Error: Package '$pkg' not found"
        return 1
    fi

    # Extract the workspace name from package.json
    local workspace=$(jq -r '.name' "$pkg_json")

    if [[ -z "$workspace" || "$workspace" == "null" ]]; then
        echo "Error: Could not determine workspace name for '$pkg'"
        return 1
    fi

    yarn workspace $workspace run $cmd $args
}

# Aliases for common commands
yt() { yw "$1" test "${@:2}" }
yb() { yw "$1" build "${@:2}" }
yl() { yw "$1" lint "${@:2}" }
