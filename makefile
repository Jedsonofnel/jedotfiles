.PHONY: all nix

all:
	stow --verbose --target=$$XDG_CONFIG_HOME --restow xdg_config
	stow --verbose --target=$$HOME/.local/bin --restow scripts
	stow --verbose --target=$$HOME --restow home

nix:
	nix profile upgrade nix 2>/dev/null || nix profile add $(CURDIR)/nix#default
