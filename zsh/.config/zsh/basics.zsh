# Syntax highlight
#
_load_basics_syntax_highlight() {
    local syntax_highlight_dir="$__ZSH_THIRD_PARTY_HOME/zsh-syntax-highlighting"
    if [[ ! -d "$syntax_highlight_dir" ]]; then
        git clone --depth 1 -- "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$syntax_highlight_dir"
    fi
    include "$syntax_highlight_dir/zsh-syntax-highlighting.zsh"

    unfunction _load_basics_zsh 2>/dev/null
}

# load auto suggestions
_load_basics_autosuggestions() {
    local autosuggestions_dir="$__ZSH_THIRD_PARTY_HOME/zsh-autosuggestions"
    if [[ ! -d "$autosuggestions_dir" ]]; then
        git clone --depth 1 -- "https://github.com/zsh-users/zsh-autosuggestions.git" "$autosuggestions_dir"
    fi
    include "$autosuggestions_dir/zsh-autosuggestions.zsh"

    unfunction _load_basics_zsh 2>/dev/null
}

_load_completions() {
    local completions_dir="$__ZSH_THIRD_PARTY_HOME/zsh-completions"
    if [[ ! -d "$completions_dir" ]]; then
        git clone --depth 1 -- https://github.com/zsh-users/zsh-completions.git "$completions_dir"
        echo "Remember to rebind completions after installing zsh-completions by 'rm -f ~/.zcompdump; compinit' "
    fi
    fpath=("$completions_dir/src" $fpath)
    autoload -Uz compinit
    compinit

    unfunction _load_completions 2>/dev/null
}

_load_vim_mode() {
    autoload -z edit-command-line
    zle -N edit-command-line
    bindkey "^X^E" edit-command-line
    unfunction _load_vim_mode 2>/dev/null
}


_load_basics() {
    _load_basics_syntax_highlight
    _load_basics_autosuggestions
    _load_completions
    _load_vim_mode
    unfunction _load_basics 2>/dev/null
    unfunction _load_completions 2>/dev/null
}

_load_basics
