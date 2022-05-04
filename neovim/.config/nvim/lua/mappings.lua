local cmd = vim.cmd
local g = vim.g
local map = vim.api.nvim_set_keymap

-- comma is the leader
g.mapleader = ','

-- window navigation
map('n', '<c-h>', '<c-w>h', { noremap = true })
map('n', '<c-j>', '<c-w>j', { noremap = true })
map('n', '<c-k>', '<c-w>k', { noremap = true })
map('n', '<c-l>', '<c-w>l', { noremap = true })

-- buffer navigation
map('n', '<C-n>', ':bnext<CR>', { noremap = true })
map('n', '<C-p>', ':bprev<CR>', { noremap = true })

-- term navigation
map('t', '<C-h>', '<C-\\><C-n><C-W>h', { noremap = true })
map('t', '<C-j>', '<C-\\><C-n><C-W>j', { noremap = true })
map('t', '<C-k>', '<C-\\><C-n><C-W>k', { noremap = true })
map('t', '<C-l>', '<C-\\><C-n><C-W>l', { noremap = true })

-- copy, paste using system clipboard
map('v', '<C-c>', '"+y',    { noremap = true })
map('i', '<C-v>', '<C-r>+', { noremap = true })

-- paste last yanked
map('', ';p', '"0P', { noremap = true })

-- screen line movement
map('n', 'j', 'gj', { noremap = true })
map('n', 'k', 'gk', { noremap = true })

-- remove search highlight
map('n', '<Leader><Space>', ':set hlsearch!<CR>', { noremap = true })

-- close buffer
map('n', '<Leader>c', ':bd!<CR>', { noremap = true })

-- format
map('n', '<Leader>F', '<cmd>lua vim.lsp.buf.formatting()<cr>', { noremap = true })

-- toggleterm
map('n', '<Leader>t', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true})
map('t', '<Leader>t', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true})

-- leave term
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true } )
