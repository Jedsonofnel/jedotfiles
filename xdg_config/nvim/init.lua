-- jedn and his nvim config

-- leader key
vim.g.mapleader = " "

-- global options
require("jedn.options")

-- plugins
require("jedn.lazy")

-- keymaps (last because we are using which-key)
-- eventually any which-key keymaps should be moved to which-key.lua
-- in plugins
require("jedn.keymaps")
