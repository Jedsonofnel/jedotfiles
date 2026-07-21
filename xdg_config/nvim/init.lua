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

-- team spaces these days
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 0

-- Directory exploration
vim.keymap.set("n", "<leader>e", function()
    vim.cmd.edit(vim.fn.expand("%:p:h"))
end)

-- Misc keybinds
vim.keymap.set("n", "<leader>sc", ":nohl<CR>")
vim.keymap.set("n", "<leader><leader>", "<c-6>")

vim.pack.add({
    { src = "https://codeberg.org/comfysage/artio.nvim" },
    { src = "https://github.com/nvim-mini/mini.icons" },
    { src = "https://github.com/nvim-mini/mini.base16" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    -- lisp exploration
    { src = "https://github.com/jpalardy/vim-slime" },
    { src = "https://github.com/guns/vim-sexp" },
    { src = "https://github.com/tpope/vim-sexp-mappings-for-regular-people" },
    { src = "https://github.com/olical/conjure" },
})

-- UI
require("vim._core.ui2").enable({
    enable = true,
    msg = { target = "msg" },
})

-- FZF
require("artio").setup({
    opts = { promptprefix = ">", pointer = ">" },
    win = { height = 10 },
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
        fennel = { "fnlfmt" },
    },
})

-- Treesitter
require("tree-sitter-manager").setup({
    ensure_installed = { "c", "lua", "go", "python", "ruby", "fennel" },
    highlight = true,
})

-- Indentblankline
local hooks = require("ibl.hooks")

local function blend(fg, bg, ratio)
    local function chan(c, i)
        return math.floor(c / (256 ^ i)) % 256
    end
    local r = math.floor(chan(fg, 2) * ratio + chan(bg, 2) * (1 - ratio))
    local g = math.floor(chan(fg, 1) * ratio + chan(bg, 1) * (1 - ratio))
    local b = math.floor(chan(fg, 0) * ratio + chan(bg, 0) * (1 - ratio))
    return r * 65536 + g * 256 + b
end

local bg_comment_ratio = 0.3

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    local comment = vim.api.nvim_get_hl(0, { name = "Comment" })

    vim.api.nvim_set_hl(0, "IblIndent", { fg = blend(comment.fg, normal.bg, bg_comment_ratio) })
    vim.api.nvim_set_hl(0, "Whitespace", { fg = blend(comment.fg, normal.bg, bg_comment_ratio) })
end)

hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)

require("ibl").setup({
    indent = { char = "▏" },
    scope = { enabled = false },
})

-- Lisp stuff
vim.g.slime_target = "tmux"
vim.g.sexp_enable_insert_mode_mappings = 1
vim.g["conjure#mapping#doc_word"] = "gk"

-- Colourscheme (managed by a script)
vim.cmd.colorscheme("jn_gruvbox-dark-hard")
