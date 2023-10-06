-- jedn and his nvim config

-- leader key
vim.g.mapleader = " "

-- global options
require("jedn.options")

-- lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require("lazy").setup("jedn.plugins", {
  install = {
    colorscheme = { "kanagawa" },
  },
  change_detection = {
    notify = false,
  },
})

-- keymaps (last because we are using which-key)
require("jedn.keymaps")
