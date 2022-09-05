-- jedn and his nvim config

-- leader key
vim.g.mapleader = " "

-- global options
require("jedn.options")

-- keymaps
require("jedn.keymaps")

-- lsp
require("jedn.lsp")

require("jedn.autocmds")

-- Neovide specific stuff (how I mostly use neovim)
if vim.g.neovide then
  vim.opt.mouse = ""
  vim.opt.clipboard = ""
  vim.opt.guifont = "CaskaydiaCove NF:h12"
end
