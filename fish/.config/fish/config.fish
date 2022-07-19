set fish_greeting ""

# aliai (plural of alias)
alias fishrc "cd ~/.config/fish"
alias la "ls -a"
alias emacs="emacsclient -c -a 'emacs'"

# variables
set -g XDG_CONFIG_HOME $HOME/.config
set -g XINITRC $XDG_CONFIG_HOME/x11/xinitrc
set -gx BROWSER firefox

# go
set -g GOPATH $HOME/go
fish_add_path $GOPATH/bin

# asdf
source /opt/asdf-vm/asdf.fish

# other path
fish_add_path ~/.local/bin
fish_add_path ~/.emacs.d/bin

# shell
starship init fish | source
