set fish_greeting ""

# aliai (plural of alias)
alias nvimrc "cd ~/.config/nvim"
alias fishrc "cd ~/.config/fish"
alias la "ls -a"

# variables
set -g XDG_CONFIG_HOME $HOME/.config
set -g XINITRC $XDG_CONFIG_HOME/x11/xinitrc
set -gx EDITOR nvim
set -gx BROWSER firefox

# xinit stuff
if test -f $XINITRC
  alias startx "startx $XINITRC"
end

# ruby
fish_add_path ~/.rbenv/bin
rbenv init - | source

# go
set -g GOPATH $HOME/go
fish_add_path $GOPATH/bin

# fnm
set -gx PATH "/tmp/fnm_multishells/98566_1649368774895/bin" $PATH;
set -gx FNM_MULTISHELL_PATH "/tmp/fnm_multishells/98566_1649368774895";
set -gx FNM_DIR "/home/jedn/.fnm";
set -gx FNM_LOGLEVEL "info";
set -gx FNM_NODE_DIST_MIRROR "https://nodejs.org/dist";
set -gx FNM_ARCH "x64";

# other path
fish_add_path ~/.local/bin

# shell
starship init fish | source
