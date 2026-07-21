#!/bin/bash

# Non-interactive guard
[[ $- != *i* ]] && return

# Environment

export EDITOR="nvim"

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
[ -d "$GOPATH" ]           && export PATH="$PATH:$GOBIN"
[ -d "/usr/local/go/bin" ] && export PATH="$PATH:/usr/local/go/bin"

# Rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Janet
export JANET_TREE="$HOME/.local/lib/janet"
export JANET_PATH="$HOME/.local/lib/janet/lib"

# Guile
if [ -d "$HOME/.local/share/guile/site/3.0" ]; then
    export GUILE_LOAD_PATH="$HOME/.local/share/guile/site/3.0${GUILE_LOAD_PATH:+:}$GUILE_LOAD_PATH"
fi

# Ruby / chruby
if [ -f "/usr/local/share/chruby/chruby.sh" ]; then
    . /usr/local/share/chruby/chruby.sh
    RUBIES_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/rubies"
    mkdir -p "$RUBIES_DIR"
    RUBIES+=("$RUBIES_DIR"/*)
    chruby 3.3.6
fi

# Local bin
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

# uv env shim
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# Shell behaviour

set -o vi
bind 'set bell-style none'

# History
export HISTFILE="$XDG_DATA_HOME/bash_history"
export HISTSIZE=10000
export HISTFILESIZE=20000
shopt -s histappend   # don't clobber on exit
shopt -s cmdhist      # fold multi-line commands to one history entry
shopt -s checkwinsize # update LINES/COLS after each command

# Other bits and pieces
shopt -s globstar
shopt -s cdspell
shopt -s autocd
bind 'set completion-ignore-case on'

# History substring search on up/down
bind -m vi-insert '"\e[A": history-search-backward'
bind -m vi-insert '"\e[B": history-search-forward'
bind -m vi-insert '"\C-l": clear-screen'

# Completion

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# Aliases

alias ls='ls --color'
alias la='ls -a'
alias nvimrc='cd ~/.config/nvim'
alias gl='git log --oneline -n 10'

# Prompt

_git_state() {
    git rev-parse --is-inside-work-tree &>/dev/null || return
    local marks=""
    git diff --quiet 2>/dev/null          || marks+="*"
    git diff --cached --quiet 2>/dev/null || marks+="+"

    local ahead behind
    read -r ahead behind < <(git rev-list --left-right --count 'origin/main...HEAD' 2>/dev/null | awk '{print $2, $1}')
    [ "${ahead:-0}" -gt 0 ]  && marks+="^"   # HEAD is ahead of origin -> need to push
    [ "${behind:-0}" -gt 0 ] && marks+="/"  # HEAD is behind origin -> need to pull

    printf '%s' "$marks"
}

_set_prompt() {
    local mark mode
    mark=$(_git_state)
    PS1="\[\e[36m\](jnl)\[\e[0m\] \W ${mark:+$mark }$ "
}
PROMPT_COMMAND='_set_prompt'

# Integrations

eval "$(direnv hook bash)"

if [ -f "$HOME/.local/bin/fnm" ]; then
    export FNM_DIR="$HOME/.local/share/fnm"
    eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell bash)"
fi
