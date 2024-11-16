#Start configuration added by Zim install {{{
# zmodload zsh/zprof

#
# User configuration sourced by interactive shells
#
#
export ZIM_HOME=~/.zim
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.

if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

# ------------
# KEY BINDINGS
# ------------
# History auto completion with arrow keys
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# -----
# ALIAS
# -----
alias ghcp="gh copilot"
alias tellme="gh copilot suggest"
alias lg='lazygit'
#---------
# Scripts 
#---------
# Starship init if starship in PATh
# if [[ "$TERM_PROGRAM" == "WarpTerminal" ]]; then
    # export STARSHIP_CONFIG=~/example/non/default/path/starship.toml
# fi
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)" 

command -v asdf > /dev/null 2>&1 && . /opt/homebrew/opt/asdf/libexec/asdf.sh
command -v thefuck > /dev/null 2>&1 && eval $(thefuck --alias)
command -v zoxide > /dev/null 2>&1 && eval "$(zoxide init zsh)"
# ----
# PATH
# ----  
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/Scripts:$PATH
export PATH=$HOME/.ghcup/bin/:$PATH
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
alias dotman="just --justfile ~/.dotfiles/justfile --working-directory ~/.dotfiles"
# -----
# CONDA
# -----
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
# . "$HOME/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
# export PATH="$HOME/miniconda3/bin:$PATH"  # commented out by conda initialize
    fi
fi
unset __conda_setup

# ---------------
#  SSH Key Agent 
# ---------------
if [ $(uname) = "Darwin" ]
then
	export SSH_AUTH_SOCK=$HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
else
	export SSH_AUTH_SOCK=$HOME/.1password/agent.sock
fi

# --------
#  zoxide
# --------
#


# ------------------------
# Source .zshrc.local
# ------------------------
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi
# zprof
