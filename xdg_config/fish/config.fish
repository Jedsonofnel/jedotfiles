set fish_greeting ""

# aliai (plural of alias)
alias la "ls -a"
alias nvimrc "cd ~/jedotfiles/xdg_config/nvim"
alias uni "cd /mnt/c/Users/jed/OneDrive\ -\ Imperial\ College\ London/"
alias comp "cd /mnt/c/Users/jed/OneDrive\ -\ Imperial\ College\ London/ME2/ME2MCP/Computing\ Bollocks/"

# misc env variables
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

# tmuxinator stuff
set -gx EDITOR nvim
set -gx SHELL fish

# rust
set -gx CARGO_HOME $HOME/.cargo
if test -f ~/.cargo/bin
    fish_add_path ~/.cargo/bin
end

# go
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin

if test -f ~/$GOPATH/bin
    fish_add_path $GOPATH/bin
end

# js stuff
set -gx PRETTIERD_DEFAULT_CONFIG $XDG_CONFIG_HOME/nvim/lua/jedn/lsp/settings/.prettierrc.json

# python to get mpl to work on wsl2
export LIBGL_ALWAYS_INDIRECT=1

# misc path stuff
if test -f ~/.local/bin
    fish_add_path ~/.local/bin
end

# pyenv stuff
pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1

# prompt stuff (hydro)
set --global hydro_multiline false

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/jedn/miniconda3/bin/conda
    eval /home/jedn/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/jedn/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/jedn/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/jedn/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
