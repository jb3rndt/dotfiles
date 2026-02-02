#!/bin/zsh

alias cat="bat"
alias ls="eza --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions"
alias refresh="source ~/.zshrc"
alias reload="source ~/.zshrc"
alias update-dotfiles="zsh $DOTFILES_DIR/update.sh"
alias search="cat ~/.zsh_history | grep"
alias y="yarn"
alias cc="claude --allowed-tools=Edit"

# Generic yarn workspace command runner
# Automatically finds the workspace name from package.json
_yw() {
    local cmd=$1
    local pkg=$2
    local args=("${(@)argv[3,-1]}")

    if [[ -z "$pkg" ]]; then
        # If no package specified, run in current directory
        yarn run "$cmd" "${args[@]}"
        return $?
    fi

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

    yarn workspace "$workspace" "$cmd" "${args[@]}"
}

# Aliases for common commands
yt() { _yw test "$@" }
yb() { _yw build "$@" }
yl() { _yw lint "$@" }
