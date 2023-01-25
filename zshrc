# Fig pre block. Keep at the top of this file.
# Clone zcomet if necessary
if [[ -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
    # Source zcomet.zsh
    autoload -U +X bashcompinit && bashcompinit
    autoload -U +X compinit && compinit
    source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh
    # =====Plugins=======
    zcomet load ohmyzsh plugins/git
    zcomet load ohmyzsh plugins/docker
    zcomet load ohmyzsh plugins/asdf
    zcomet load esc/conda-zsh-completion
    zcomet load zsh-users/zsh-syntax-highlighting
    zcomet load zsh-users/zsh-autosuggestions
    zcomet compinit
fi
if command -v starship 1> /dev/null 2>&1; then
	eval "$(starship init zsh)"
fi

export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=2000
# History auto completion with arrow keys
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
#####################################################
#													#
#						ALIAS						#
#													#	
#####################################################

alias ea='conda activate'
alias ipy=ipython 
alias dc='docker-compose'
alias e='$EDITOR'
alias va='source ./.venv/bin/activate'
alias vda='deactivate'
alias pxy='export HTTP_PTROXY=http://192.168.50.233:7890 HTTPS_PROXY=http://192.168.50.233:7890'
export EDITOR=nvim
export PATH="$HOME/go/bin:$PATH"


export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/Scripts:$PATH

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('~/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# pnpm
export PNPM_HOME="/Users/alexzhang/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end