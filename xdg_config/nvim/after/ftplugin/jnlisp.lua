vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

-- wrapping
vim.opt_local.textwidth = 0
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.showbreak = "> "
-- vim.opt_local.colorcolumn = "80"

-- helpful for softwrapping
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
