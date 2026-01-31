_load_mise() {
    if command -v mise &> /dev/null; then
        echo "Loading mise shell integration..."
        local mise_bin=$(which mise)
        eval "$(mise activate zsh)"
    fi
    unfunction _load_mise 2>/dev/null
}

_load_mise
