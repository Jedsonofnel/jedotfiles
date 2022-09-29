-- jedn and his nvim config

-- leader key
vim.g.mapleader = " "

-- global options
require("jedn.options")

-- keymaps
require("jedn.keymaps")

-- plugins
require("jedn.plugins")

-- lsp
require("jedn.lsp")

require("jedn.autocmds")
