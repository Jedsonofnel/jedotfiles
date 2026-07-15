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
vim.opt.expandtab = true
vim.opt.shiftwidth = 0
vim.opt.list = false

-- netrw stuff
vim.g.netrw_banner = 0 -- hidden
vim.g.netrw_altv = 1 -- open splits to the right
vim.g.netrw_winsize = 25 -- open splits at 25% width
vim.g.netrw_browse_split = 4 -- open buffer in previous window
vim.keymap.set("n", "<leader>e", ":Explore %:p:h<CR>")
vim.keymap.set("n", "<leader>E", ":Vexplore %:p:h<CR>")

vim.keymap.set("n", "<leader>sc", ":nohl<CR>")
vim.keymap.set("n", "<leader><leader>", "<c-6>")

vim.pack.add({
	{ src = "https://codeberg.org/comfysage/artio.nvim" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-mini/mini.base16" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/romus204/tree-sitter-manager.nvim" },
	-- lisp exploration
	{ src = "https://github.com/jpalardy/vim-slime" },
	{ src = "https://github.com/guns/vim-sexp" },
	{ src = "https://github.com/tpope/vim-sexp-mappings-for-regular-people" },
})

-- UI
require("vim._core.ui2").enable({
	enable = true,
	msg = { target = "msg" },
})

-- FZF
require("artio").setup({
	win = {
		height = 10,
	},
	mappings = {
		["<down>"] = "down",
		["<up>"] = "up",
		["<c-n>"] = "down",
		["<c-p>"] = "up",
		["<cr>"] = "accept",
		["<esc>"] = "cancel",
		["<tab>"] = "mark",
		["<c-g>"] = "togglelive",
		["<c-l>"] = "togglepreview",
		["<c-q>"] = "setqflist",
		["<m-q>"] = "setqflistmark",
	},
})
vim.ui.select = require("artio").select

vim.keymap.set("n", "<c-p>", "<Plug>(artio-files)")
vim.keymap.set("n", "<leader>ff", "<Plug>(artio-smart)")
vim.keymap.set("n", "<leader>fg", "<Plug>(artio-grep)")
vim.keymap.set("n", "<leader>fb", "<Plug>(artio-buffers)")
vim.keymap.set("n", "<leader>fo", "<Plug>(artio-oldfiles)")

-- LSP
vim.lsp.enable({ "clangd", "lua_ls", "biome", "gopls", "html", "ruby_lsp", "pyright" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>lr", ":lsp restart<CR>")
vim.keymap.set("n", "<leader>lf", function()
	require("conform").format({
		timeout_ms = 1000,
	})
end, { desc = "Format buffer" })

-- Disable Lua semantic highlighting
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "lua_ls" then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

-- Formatting
require("conform").setup({
	formatters_by_ft = {
		ruby = { "rubocop" },
		eruby = { "erb_format" },
		css = { "biome" },
		python = { "black" },
		c = { "clang_format" },
		lua = { "stylua" },
	},
})

-- Treesitter
require("tree-sitter-manager").setup({
	ensure_installed = { "c", "lua", "go", "python", "ruby" },
	highlight = true,
})

vim.g.slime_target = "tmux"

-- Colourscheme (managed by a script)
vim.cmd.colorscheme("jn_dracula")
