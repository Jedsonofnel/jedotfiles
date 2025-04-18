-- jedn and his nvim config

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- global options and keymaps
require("jedn.options")
require("jedn.keymaps")

-- plugins (ie anything todo with lazy)
require("jedn.lazy")

-- lsp stuff
require("jedn.lsp")

-- python things
-- vim.g.python3_host_prog = "/home/jedn/.pyenv/versions/py3nvim/bin/python"
