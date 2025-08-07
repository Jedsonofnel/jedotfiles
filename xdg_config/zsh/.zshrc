#!/bin/zsh

# plugins
source $ZDOTDIR/.antidote/antidote.zsh
antidote load

# some options
unsetopt beep
bindkey -v

# env variables (ZDOTDIR & XDG_CONFIG_HOME set in .zshenv)
export EDITOR="nvim"
export VIMRUNTIME="/usr/share/nvim/runtime"
export NVM_DIR="$HOME/.nvim"
export PYENV_ROOT="$HOME/.pyenv"

# golang
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
if [ -d "$GOPATH" ]; then
  export PATH="$PATH:$GOBIN"
fi

# rust
if [ -d "$HOME/.cargo" ]; then
  . "$HOME/.cargo/env"
fi

# ruby
if [ -d "/usr/local/share/chruby" ]; then
  source /usr/local/share/chruby/chruby.sh
  chruby 3.3.6
fi

# add ~/.local/bin to PATH
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

# context
if [ -d "/home/jedn/Documents/context/tex/texmf-linux-64/bin" ]; then 
  export PATH="/home/jedn/Documents/context/tex/texmf-linux-64/bin:$PATH"
fi

# aliases
alias ls="ls --color"
alias la="ls -a"
alias nvimrc="cd ~/.config/nvim"
alias gl="git log --oneline -n 10"
alias s="kitten ssh"

eval "$(direnv hook zsh)"

# prompt
if ! type "$starship" > /dev/null; then
  eval "$(starship init zsh)"
fi

# fnm
# completions put in /usr/share/zsh/site-functions
FNM_PATH="/home/jedn/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/jedn/.local/share/fnm:$PATH"
  eval "`fnm env`"
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"
fi

. "$HOME/.local/share/../bin/env"
