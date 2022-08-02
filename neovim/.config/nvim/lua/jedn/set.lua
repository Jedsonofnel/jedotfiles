local options = {
    termguicolors = true,
    hidden = true,
    clipboard = "unnamedplus",
    cmdheight = 1,
    nu = true,
    relativenumber = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    hlsearch = false,
    incsearch = true,
    smartcase = true,
    ignorecase = true,
    smartindent = true,
    wrap = false,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    showmode = false,
    showtabline = 0,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    undofile = true,
    cursorline = true,
    signcolumn = "yes",
    scrolloff = 8,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- leader key
vim.g.mapleader = " "
