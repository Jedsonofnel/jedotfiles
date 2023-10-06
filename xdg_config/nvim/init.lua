-- jedn and his nvim config

-- leader key
vim.g.mapleader = " "

-- global options and keymaps
require("jedn.options")
require("jedn.keymaps")

-- plugins (ie anything todo with lazy)
require("jedn.lazy")
