#!/bin/bash

# Non-interactive guard
[[ $- != *i* ]] && return

# Environment

export EDITOR="nvim"

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
[ -d "$GOPATH" ]            && export PATH="$PATH:$GOBIN"
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
[ -d "$HOME/.local/lib" ] && export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"

# uv env shim
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# Shell behaviour

set -o vi
bind 'set bell-style none'

# History
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/bash_history"
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
alias pyenv='source ~/.venv/bin/activate'

# Nuclear data
export NUCLEAR_DATA_DIR="$HOME/.local/share/nuclear_data"

# Fast Prompt (No expensive branch counting)

_git_state() {
    # Fast check: bail immediately if not in a git repo
    [ -d .git ] || git rev-parse --is-inside-work-tree &>/dev/null || return

    local marks=""
    # Quick index check for modified files
    git diff --quiet --no-ext-diff 2>/dev/null          || marks+="*"
    git diff --cached --quiet --no-ext-diff 2>/dev/null || marks="+"

    printf '%s' "$marks"
}

_set_prompt() {
    local mark pwd_clean
    mark=$(_git_state)
    pwd_clean="${PWD%/}"
    [ -z "$pwd_clean" ] && pwd_clean="/"
    PS1="\[\e[36m\](jnl)\[\e[0m\] $(basename "$pwd_clean")${mark:+ \[\e[33m\]$mark\[\e[0m\]} $ "
}

# Integrations

eval "$(direnv hook bash)"

if [ -f "$HOME/.local/bin/fnm" ]; then
    export FNM_DIR="$HOME/.local/share/fnm"
    eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell bash)"
fi

PROMPT_COMMAND+=('_set_prompt')
