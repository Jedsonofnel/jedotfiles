-- JEDN neovim config
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.winborder = "single"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
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
vim.opt.list = false -- true to get the > for tab etc
vim.opt.listchars = {
	tab = "> ",
	leadmultispace = ". ",
}

-- netrw stuff
vim.g.netrw_banner = 0    -- hidden
vim.g.netrw_liststyle = 0 -- normal by default, treeview is 3
vim.g.netrw_altv = 1      -- open splits to the right
vim.g.netrw_winsize = 25  -- open splits at 25% width
vim.keymap.set("n", "<leader>e", ":Explore<CR>")
vim.keymap.set("n", "<leader>E", ":Vexplore<CR>")

local scripts = require("scripts")
vim.keymap.set("n", "<leader>sc", ":nohl<CR>")
vim.keymap.set("n", "<leader><leader>", "<c-6>")
vim.keymap.set("n", "<leader>d", scripts.open_do)
vim.keymap.set("n", "<leader>rc", scripts.reload_colourscheme)

vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/miikanissi/modus-themes.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/jpalardy/vim-slime" },
	{ src = "https://github.com/dundalek/parpar.nvim" },
	{ src = "https://github.com/gpanders/nvim-parinfer" },
	{ src = "https://github.com/julienvincent/nvim-paredit" },
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

require("mini.pick").setup()
vim.keymap.set("n", "<c-p>", ":Pick files<CR>")
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")

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
		python = { "black" },
		c      = { "indent" }
	},
})

require("conform").formatters.indent = {
	append_args = { "-kr", "-ts4" }
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

vim.g.slime_target = "tmux"

vim.cmd.colorscheme("modus")
