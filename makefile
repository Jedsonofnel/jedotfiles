all:
	stow --verbose --target=$$XDG_CONFIG_HOME --restow xdg_config
	stow --verbose --target=$$HOME/.local/bin --restow scripts
