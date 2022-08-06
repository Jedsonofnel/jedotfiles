-- jedn and his nvim config

-- leader key
vim.g.mapleader = " "

-- Neovide specific stuff (how I mostly use neovim)
if vim.g.neovide then
  vim.opt.clipboard = "" -- breaks linewise pasting :(
  vim.opt.guifont = "JetBrainsMono NF:h11.9"
end

-- global options
require("jedn.options")

-- keymaps
require("jedn.keymaps")

-- lsp
require("jedn.lsp")

require("jedn.autocmds")
