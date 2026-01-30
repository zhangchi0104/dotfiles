.PHONY: ghostty lazyvim

ghostty:
	mkdir -p ~/.config/ghostty
	stow ghostty

lazyvim:
	mkdir -p ~/.config/nvim
	stow lazyvim
