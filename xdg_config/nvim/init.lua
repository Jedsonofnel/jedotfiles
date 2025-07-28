-- JEDN neovim config
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"

-- team tabs these days
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 0
vim.opt.softtabstop = 0
vim.opt.list = true

vim.keymap.set("n", "<leader>sc", ":nohl<CR>")

vim.pack.add({
	{ src = "https://github.com/bluz71/vim-moonfly-colors" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

require "mini.pick".setup()
require "oil".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "ruby", "yaml", "lua", "html", "css", "javascript" },
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	modules = {},
	highlight = { enable = true }
})

vim.keymap.set("n", "<c-p>", ":Pick files<CR>")
vim.keymap.set("n", "<leader>/", ":Pick grep_live<CR>")

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.cmd.colorscheme("moonfly")
vim.cmd(":hi statusline guibg=NONE")
vim.cmd(":hi link MiniPickNormal Normal")
