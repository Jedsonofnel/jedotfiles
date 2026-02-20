#!/bin/zsh

# plugins
source $ZDOTDIR/.antidote/antidote.zsh
antidote load

# some options
unsetopt beep
bindkey -v
fpath=("$ZDOTDIR/completions" $fpath)

# env variables (ZDOTDIR & XDG_CONFIG_HOME set in .zshenv)
export EDITOR="nvim"
export VIMRUNTIME="/usr/share/nvim/runtime"
export PYENV_ROOT="$HOME/.pyenv"

# golang
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
if [ -d "$GOPATH" ]; then
	export PATH="$PATH:$GOBIN"
fi

if [ -d "/usr/local/go/bin" ]; then
	export PATH="$PATH:/usr/local/go/bin"
fi

# rust
if [ -d "$HOME/.cargo" ]; then
	. "$HOME/.cargo/env"
fi

# janet
export JANET_TREE="$HOME/.local/lib/janet"
export JANET_PATH="$HOME/.local/lib/janet/lib"

# guile
if [ -d "$HOME/.local/share/guile/site/3.0" ]; then
	export GUILE_LOAD_PATH="$HOME/.local/share/guile/site/3.0${GUILE_LOAD_PATH:+:}$GUILE_LOAD_PATH"
fi

# ruby
if [ -d "/usr/local/share/chruby" ]; then
	source /usr/local/share/chruby/chruby.sh

	RUBIES_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/rubies"
	mkdir -p "$RUBIES_DIR"
	RUBIES+=("$RUBIES_DIR"/*)

	chruby 3.3.6
fi

# add ~/.local/bin to PATH
if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# aliases
alias ls="ls --color"
alias la="ls -a"
alias nvimrc="cd ~/.config/nvim"
alias gl="git log --oneline -n 10"

eval "$(direnv hook zsh)"

# fnm
if [ -f "$HOME/.local/bin/fnm" ]; then
	export FNM_DIR="$HOME/.local/share/fnm"
	eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"
fi

. "$HOME/.local/share/../bin/env"

# prompt
setopt PROMPT_SUBST

autoload -Uz vcs_info
precmd() { vcs_info }

# Configure vcs_info to show a dot only for untracked files
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '•'
zstyle ':vcs_info:git:*' formats '%u'
zstyle ':vcs_info:git:*' actionformats '%u'

# Update your prompt
PROMPT='%c ${vcs_info_msg_0_} %% '
