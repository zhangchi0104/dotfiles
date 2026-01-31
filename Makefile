.PHONY: all stow bootstrap install-opencode install-ghostty install-zed install-starship setup-superpowers \
        bat claude eza ghostty git lazyvim opencode ssh starship zellij zsh bootstrap-opencode bootstrap-ghostty bootstrap-zed bootstrap-starship bootstrap-mise bootstrap-1password-cli bootstrap-zoxide

all: stow

stow: bat claude eza ghostty git lazyvim opencode ssh starship zellij zsh

bootstrap: bootstrap-opencode bootstrap-ghostty bootstrap-zed bootstrap-starship bootstrap-mise bootstrap-1password-cli bootstrap-zoxide
bat:
	stow bat

claude:
	stow claude

eza:
	stow eza

ghostty:
	mkdir -p ~/.config/ghostty
	stow ghostty

git:
	stow git

lazyvim:
	mkdir -p ~/.config/nvim
	stow lazyvim

opencode:
	mkdir -p ~/.config/opencode
	stow opencode

ssh:
	mkdir -p ~/.ssh
	stow ssh

starship:
	mkdir -p ~/.config/starship
	stow starship

zellij:
	mkdir -p ~/.config/zellij
	stow zellij

zsh:
	stow zsh

bootstrap-opencode:
	"@scripts/setup-scripts/opencode.sh"
	mkdir -p ~/.config/opencode
	stow opencode

bootstrap-ghostty:
	"@scripts/setup-scripts/ghostty.sh"
	mkdir -p ~/.config/ghostty
	stow ghostty

bootstrap-zed:
	"@scripts/setup-scripts/zed.sh"
	mkdir -p ~/.config/zed
	stow zed

bootstrap-starship:
	"@scripts/setup-scripts/starship.sh"
	mkdir -p ~/.config/starship
	stow starship

bootstrap-mise:
	"@scripts/setup-scripts/mise.sh"
	mkdir -p ~/.config/mise
	stow mise
	mise install

bootstrap-starship:
	"@scripts/setup-scripts/starship.sh"
	mkdir -p ~/.config/starship
	stow starship

bootstrap-1password-cli:
	"@scripts/setup-scripts/1password.sh"

bootstrap-zoxide:
	"@scripts/setup-scripts/zoxide.sh"
