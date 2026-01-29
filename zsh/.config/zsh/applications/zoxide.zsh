
function _setup_zoxide() {
    if command -v zoxide >/dev/null 2>&1; then
        eval "$(zoxide init zsh)"
    fi
    unfunction _setup_zoxide 2>/dev/null
}
_setup_zoxide
