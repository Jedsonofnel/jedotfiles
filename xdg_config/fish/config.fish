set fish_greeting ""

# aliai (plural of alias)
alias la "ls -a"
alias nvimrc "cd ~/jedotfiles/xdg_config/nvim"

# misc env variables
set -gx XDG_CONFIG_HOME $HOME/.config

# asdf (version manager for ruby and js)
source ~/.asdf/asdf.fish

# rust
fish_add_path ~/.cargo/bin

# go
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
fish_add_path $GOPATH/bin

# js stuff
set -gx PRETTIERD_DEFAULT_CONFIG $XDG_CONFIG_HOME/nvim/lua/jedn/lsp/settings/.prettierrc.json

# misc path stuff
fish_add_path ~/.local/bin

# starship (prompt)
starship init fish | source
