# Fig pre block. Keep at the top of this file.
# Clone zcomet if necessary
if [[ -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
    # Source zcomet.zsh
    source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh
    
    # =====Plugins=======
    zcomet load ohmyzsh plugins/git
    zcomet load ohmyzsh plugins/docker
    zcomet load zsh-users/zsh-syntax-highlighting
    zcomet load esc/conda-zsh-completion
    zcomet compinit
fi
if command -v starship 1> /dev/null 2>&1; then
	eval "$(starship init zsh)"
fi
#####################################################
#													#
#						ALIAS						#
#													#	
#####################################################

alias watch-temp='sudo powermetrics --samplers smc |grep -i "CPU die temperature"'
alias ea='conda activate'
alias ipy=ipython 
alias dc='docker-compose'
alias e='nvim'
alias va='source ./.venv/bin/activate'
alias vda='deactivate'
alias pxy='export HTTP_PTROXY=http://192.168.50.233:7890 HTTPS_PROXY=http://192.168.50.233:7890'
export EDITOR=nvim
export PATH="$HOME/go/bin:$PATH"

if [[ -d $HOME/.pyenv ]] then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi


# eval "$(lua $HOME/github.com/z.lua/z.lua --init zsh)"
if command -v keychain 1>/dev/null 2>&1; then 
    keychain id_rsa 
    . ~/.keychain/`uname -n`-sh 
fi

export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/Scripts:$PATH

# WSL Specific settings 
if [[ -v WSLENV ]]; then
  alias copy='clip.exe'
  alias paste='powershell.exe -command "Get-Clipboard"'
fi

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
# export DOCKER_HOST=unix:///run/user/1000/docker.sock

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


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
