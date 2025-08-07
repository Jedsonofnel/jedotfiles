#!/bin/sh

# XDG Base Directory Spec
export XDG_CONFIG_HOME="/home/jedn/.config/"
export XDG_DATA_HOME="/home/jedn/.local/share"
export XDG_CACHE_HOME="/home/jedn/.local/cache"

# Create XDG directories
mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_CACHE_HOME"

# Shell configuration
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

# Application specific XDG compliance
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# Ruby/Gem XDG compliance
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
