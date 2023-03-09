set fish_greeting ""

# aliai (plural of alias)
alias la "ls -a"
alias nvimrc "cd ~/jedotfiles/xdg_config/nvim"

# misc env variables
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share

# asdf (version manager for ruby and js)
if test -f ~/.asdf/asdf.fish
    source ~/.asdf/asdf.fish
end

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

# misc path stuff
if test -f ~/.local/bin
    fish_add_path ~/.local/bin
end

# theme etc
source ./tokyonight_storm.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f ~/home/jedn/miniconda3
    eval /home/jedn/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

# starship (prompt)
starship init fish | source
