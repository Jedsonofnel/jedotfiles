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
vim.opt.softtabstop = 0
vim.opt.list = false

-- netrw stuff
vim.g.netrw_banner = 0    -- hidden
vim.g.netrw_liststyle = 0 -- normal by default, treeview is 3
vim.g.netrw_altv = 1      -- open splits to the right
vim.g.netrw_winsize = 25  -- open splits at 25% width
vim.keymap.set("n", "<leader>e", ":Explore<CR>")
vim.keymap.set("n", "<leader>E", ":Vexplore<CR>")

vim.keymap.set("n", "<leader>sc", ":nohl<CR>")
vim.keymap.set("n", "<leader><leader>", "<c-6>")

vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.pick" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/nvim-mini/mini.base16" },
    { src = "https://github.com/miikanissi/modus-themes.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    -- lisp exploration
    { src = "https://github.com/jpalardy/vim-slime" },
    { src = "https://github.com/guns/vim-sexp" },
    { src = "https://github.com/tpope/vim-sexp-mappings-for-regular-people" },
})

-- UI
require("vim._core.ui2").enable({
    enable = true,
    msg = { target = "msg",
    }
})

require("mini.pick").setup()
vim.keymap.set("n", "<c-p>", ":Pick files<CR>")
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")

vim.lsp.enable({ "clangd", "lua_ls", "biome", "gopls", "html", "ruby_lsp", "pyright" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>lr", ":lsp restart<CR>")
vim.keymap.set("n", "<leader>lf", function()
    require("conform").format({
        lsp_fallback = true,
        timeout_ms = 1000,
    })
end, { desc = "Format buffer" })

require("conform").setup({
    formatters_by_ft = {
        ruby   = { "rubocop" },
        eruby  = { "erb_format" },
        css    = { "biome" },
        python = { "black" },
        c      = { "clang_format" }
    },
})

vim.g.slime_target = "tmux"

-- require("modus-themes").setup({
--     style = "auto",
--     on_highlights = function(highlights, colors)
--         highlights.NonText = { fg = colors.border }
--         highlights.DiagnosticUnnecessary = {}
--     end,
-- })

vim.cmd.colorscheme("onedark16")
