#a load antigen
ANTIGEN_PATH="$HOME/antigen.zsh"
source $ANTIGEN_PATH
MINICONDA_PREFIX="$HOME/miniconda3"

if [ $(uname -s) = 'Darwin' ]; then
	if [[ -a ~/.bash_profile ]]; then
		source ~/.bash_profile
	fi
fi 
# =====Antigen Configs=======
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle docker
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle esc/conda-zsh-completion
antigen apply

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
export EDITOR=nvim
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
if [ -e fuck ]; then
    eval $(thefuck --alias)
fi

if command -v pyenv 1>/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi
if [ -e /usr/local/bin/starship ]; then
    eval "$(starship init zsh)"
fi

# eval "$(lua $HOME/github.com/z.lua/z.lua --init zsh)"
if command -v keychain 1>/dev/null 2>&1; then 
    keychain id_rsa 
    . ~/.keychain/`uname -n`-sh 
fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/Scripts:$PATH

# WSL Specific settings 
if [[ -v WSLENV ]]; then
  alias copy='clip.exe'
  alias paste='powershell.exe -command "Get-Clipboard"'
fi

if [ -e nvim-dev ]; then
    alias nvim='nvim-dev'
fi

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/flutter/bin"

export DOCKER_HOST=unix:///run/user/1000/docker.sock

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

