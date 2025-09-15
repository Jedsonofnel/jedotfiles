-- JEDN neovim config
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.winborder = "none"
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

local scripts = require("scripts")
vim.keymap.set("n", "<leader>sc", ":nohl<CR>")
vim.keymap.set("n", "<leader><leader>", "<c-6>")
vim.keymap.set("n", "<leader>d", scripts.open_do)
vim.keymap.set("n", "<leader>rc", scripts.reload_colourscheme)

vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/tpope/vim-rails" },
	{ src = "https://github.com/jpalardy/vim-slime" },
})

require "mini.pick".setup({
	window = {
		config = {
			border = "rounded",
		}
	},
})

require "mini.statusline".setup()
require "mini.icons".setup()
require "mini.pairs".setup()

require "oil".setup({
	view_options = {
		show_hidden = true
	}
})

require "nvim-treesitter.configs".setup({
	ensure_installed = { "ruby", "yaml", "lua", "html", "css", "javascript", "liquid",
		"make", "go", "python", "janet_simple", "scheme", "glimmer" },
	sync_install = false,
	auto_install = true,
	ignore_install = {},
	modules = {},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	}
})

vim.treesitter.language.register("glimmer", {
	"mustache", "hbs", "html.mustache", "handlebars"
})

local pickers = require("pickers")
vim.keymap.set("n", "<c-p>", ":Pick files<CR>")
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fh", pickers.files_with_hidden)
vim.keymap.set("n", "<leader>/", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

vim.lsp.enable({ "lua_ls", "biome", "gopls", "html", "ruby_lsp", "pyright" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>")
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
		ruby   = { "rubocop" },
		eruby  = { "erb_format" },
		css    = { "biome" },
		python = { "black" }
	},
})

vim.g.slime_target = "tmux"

vim.cmd.colorscheme("2tone-forest-dark")

local function add_style_to_hl(group, styles)
	local hl = vim.api.nvim_get_hl(0, { name = group })
	for key, value in pairs(styles) do
		hl[key] = value
	end
	vim.api.nvim_set_hl(0, group, hl)
end

add_style_to_hl('Comment', { italic = true })
add_style_to_hl('@comment', { italic = true })
add_style_to_hl('Keyword', { bold = true })
add_style_to_hl('@keyword', { bold = true })
