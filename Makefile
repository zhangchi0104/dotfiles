.PHONY: all stow install-opencode install-ghostty install-zed install-starship setup-superpowers \
        bat claude eza ghostty git lazyvim opencode ssh starship zellij zsh

all: stow

stow: bat claude eza ghostty git lazyvim opencode ssh starship zellij zsh

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

install-opencode:
	"@scripts/setup-scripts/opencode.sh"

install-ghostty:
	"@scripts/setup-scripts/ghostty.sh"

install-zed:
	"@scripts/setup-scripts/zed.sh"

install-starship:
	"@scripts/setup-scripts/starship.sh"

setup-superpowers:
	bun run @scripts/setup-superpowers.ts --agent open-code
