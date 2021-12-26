#!/bin/zsh

# Profile file.  Runs on login.  Environmental variables are set here.

# Adds '~/.local/bin' to $PATH so that the scripts in there can be run
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

# Adds GOBIN to path
export PATH="$HOME/go/bin:$PATH"

# Add bin/doom to PATH
export PATH="$HOME/.emacs.d/bin:$PATH"

# Adds NPM prefix to PATH
export PATH=~/.local/share/npm-global/bin:$PATH

# Don't really know what this means but it was in Luke Smith's Dotfiles.
unsetopt PROMPT_SP

# Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

# Config file cleanup:
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"
export NODE_REPL_HISTORY=""
export GTK_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
