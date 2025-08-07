#!/bin/bash

# tmux-launcher.sh - Launch tmuxinator configs with tofi

set -euo pipefail

TMUXINATOR_CONFIG_DIR="$HOME/.config/tmuxinator"

# Check dependencies
for cmd in ghostty tmuxinator tofi; do
	command -v "$cmd" >/dev/null || { echo "Error: $cmd not found"; exit 1; }
done

# Get available configs
get_configs() {
	find -L "$TMUXINATOR_CONFIG_DIR" -name "*.yml" -type f -exec basename {} .yml \; 2>/dev/null | sort
}

# Launch specific config
launch_config() {
	local config="$1"
	[ -f "$TMUXINATOR_CONFIG_DIR/$config.yml" ] || { echo "Config '$config' not found"; exit 1; }
	exec ghostty --fullscreen --command="tmuxinator start $config"
}

# Main
if [ $# -eq 1 ]; then
	launch_config "$1"
else
	configs=$(get_configs)
	[ -n "$configs" ] || { echo "No tmuxinator configs found"; exit 1; }

	selected=$(echo "$configs" | tofi --prompt-text="Tmux Config: ")
	[ -n "$selected" ] && launch_config "$selected"
fi
