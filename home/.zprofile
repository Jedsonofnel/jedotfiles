#!/bin/sh

# XDG Base Directory Spec
export XDG_CONFIG_HOME="/home/jedn/.config/"
export XDG_DATA_HOME="/home/jedn/.local/share"
export XDG_CACHE_HOME="/home/jedn/.local/cache"

# Create XDG directories
mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_CACHE_HOME"

# SSH stuff
SSH_ENV="$XDG_RUNTIME_DIR/ssh-agent.env"
if [ -f "$SSH_ENV" ]; then
	. "$SSH_ENV" > /dev/null
	if ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
		ssh-agent > "$SSH_ENV"
		. "$SSH_ENV" > /dev/null
		ssh-add
	fi
else
	ssh-agent > "$SSH_ENV"
	. "$SSH_ENV" > /dev/null
	ssh-add
fi

# Shell configuration
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

# Application specific XDG compliance
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export STARSHIP_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/starship"
