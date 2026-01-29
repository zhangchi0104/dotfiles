# ================
# zsh basics
# ================
__ZSH_CONFIG_HOME=$HOME/.config/zsh
__ZSH_THIRD_PARTY_HOME=~/.zsh/third_party
source $__ZSH_CONFIG_HOME/zsh_debug.zsh
source $__ZSH_CONFIG_HOME/helpers.zsh

# ===============
# load basics
# ===============
include $__ZSH_CONFIG_HOME/basics.zsh
include $__ZSH_CONFIG_HOME/aliases.zsh
include $__ZSH_CONFIG_HOME/applications/applications.zsh
include $__ZSH_CONFIG_HOME/.zshrc.local
include ~/.zshrc.local
