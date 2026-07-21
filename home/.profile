#!/bin/sh

# XDG Base Directory Spec
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.local/cache"
mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_CACHE_HOME"

# SSH agent
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

# XDG compliance
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
