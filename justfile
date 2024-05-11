# This is a justfile for managing dotfiles

# links dotfiles and run hooks, options: nvchad, tmux, zsh, conda
deploy target:
    echo "installing {{target}}"
    just _deploy_{{target}}

# links dotfiles, options: nvchad, tmux, zsh, conda
link target:
    just _link_{{target}}


_deploy_nvchad:
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    just _link_nvchad

_link_nvchad:
    if [ -d  ~/.config/nvim ]; then mv ~/.config/nvim ~/.config/nvim.old fi
    ln -sf $(pwd)/nvim ~/.config/nvim

_deploy_tmux:
    git clone https://github.com/gpakosz/.tmux.git ~/.tmux
    mkdir -p ~/.config/tmux
    ln -sf ~/.tmux/.tmux.conf ~/.config/tmux/tmux.conf
    just _link_tmux

_link_tmux:
    ln -sf $(pwd)/tmux.conf.local ~/.config/tmux/tmux.conf.local

_deploy_zsh:
    just _link_zsh

_link_zsh:
    ln -s $(pwd)/zshrc "~/.zshrc"
    ln -s $(pwd)/zimrc "~/.zimrc"

_deploy_conda:
    just _link_conda

_link_conda:
    ln -s $(pwd)/condarc "~/.condarc"

_link_wezterm:
    ln -s $(pwd)/wezterm.lua "~/.config/wezterm/wezterm.lua"

_deploy_wezterm:
  mkdir -p ~/.config/wezterm
  just _link_wezterm
