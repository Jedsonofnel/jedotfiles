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
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- leader key
vim.g.mapleader = " "
