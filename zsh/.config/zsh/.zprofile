#!/bin/zsh

# Profile file.  Runs on login.  Environmental variables are set here.

# Adds '~/.local/bin' to $PATH so that the scripts in there can be run
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

# Adds GOBIN to path
export PATH="$HOME/go/bin:$PATH"

# Default programs:
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
