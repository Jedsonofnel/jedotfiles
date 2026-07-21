#!/bin/bash

# Non-interactive guard
[[ $- != *i* ]] && return

# Environment

export EDITOR="nvim"
export VIMRUNTIME="/usr/share/nvim/runtime"

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

# History substring search on up/down
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\C-l": clear-screen'

# Completion

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# Aliases

alias ls='ls --color'
alias la='ls -a'
alias nvimrc='cd ~/.config/nvim'
alias gl='git log --oneline -n 10'

# Integrations

eval "$(direnv hook bash)"

if [ -f "$HOME/.local/bin/fnm" ]; then
    export FNM_DIR="$HOME/.local/share/fnm"
    eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell bash)"
fi

# Prompt
# Replicates: %c ${vcs_info_msg_0_} %%
# Shows basename of cwd + • if unstaged changes exist + $

_git_unstaged() {
    git diff --quiet 2>/dev/null || printf '*'
}

_set_prompt() {
    local mark
    mark=$(_git_unstaged)
    # ${mark:+$mark } adds a space only when mark is non-empty
    PS1="\W ${mark:+$mark }$ "
}

PROMPT_COMMAND='_set_prompt'
