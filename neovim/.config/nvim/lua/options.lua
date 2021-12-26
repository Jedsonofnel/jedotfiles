local api = vim.api
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local opt = vim.opt

-- Basic options
opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- case sensitive when uppercase
opt.undofile = true -- enable undo file
opt.swapfile = false -- disable swap file
opt.hidden = true -- don't save on buffer change
opt.completeopt = "menu,menuone,noselect" -- better completion
opt.showmode = false -- don't display --insert-- or something
opt.scrolloff = 8 -- keep cursor 8 lines away from bottom
opt.clipboard = "unnamedplus" -- use system keyboard
opt.shortmess = opt.shortmess + 'c' -- TODO find out what this does
opt.pumheight = 10 -- popup menu height

-- split right and bottom instead of left and top
opt.splitbelow = true
opt.splitright = true

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.textwidth = 0
opt.wrap = false
opt.smartindent = true

-- lines and line numbers
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.signcolumn = "yes" -- always show gutter

-- colorscheme
opt.termguicolors = true
opt.background = 'dark'

-- custom filetype settings
cmd [[filetype plugin on]]

-- highlight on yank
api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- disable new line comments
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove all spaces and lines at the end of the file on save
cmd [[au BufWritePre * %s/\s\+$//e]]
cmd [[au BufWritePre * %s/\n\+\%$//e]]
