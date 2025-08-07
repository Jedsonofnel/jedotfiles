-- JEDN neovim config
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.incsearch = true
vim.opt.smartcase = true

-- team tabs these days
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 0
vim.opt.softtabstop = 0
vim.opt.list = true
vim.opt.listchars = {
	tab = "> ",
	leadmultispace = ". ",
}

vim.keymap.set("n", "<leader>sc", ":nohl<CR>")
vim.keymap.set("n", "<leader><leader>", "<c-6>")

vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require "mini.pick".setup()
require "mini.statusline".setup()
require "mini.icons".setup()
require "mini.pairs".setup()
require "oil".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "ruby", "yaml", "lua", "html", "css", "javascript", "liquid",
		"make", "go" },
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	modules = {},
	highlight = { enable = true }
})

vim.keymap.set("n", "<c-p>", ":Pick files<CR>")
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>/", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

vim.lsp.enable({ "lua_ls", "biome", "gopls", "html", "ruby_lsp" })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>lf", function()
	require("conform").format({
		lsp_fallback = true,
		timeout_ms = 1000,
	})
end, { desc = "Format buffer" })

require("lspconfig").html.setup({
	filetypes = { "html", "liquid" }
})

require("lspconfig").ruby_lsp.setup({
	init_options = {
		formatter = "rubocop",
		linters = { "rubocop" }
	}
})

require("conform").setup({
	formatters_by_ft = {
		ruby = { "rubocop" },
		eruby = { "erb_format" }
	},
})

vim.cmd.colorscheme("atelier-forest-dark")
