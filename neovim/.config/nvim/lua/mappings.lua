local cmd = vim.cmd
local g = vim.g
local map = vim.api.nvim_set_keymap

-- comma is the leader
g.mapleader = ','

-- jk or kj to escape
map('i', 'jk', '<esc>', { noremap = true })
map('i', 'kj', '<esc>', { noremap = true })

-- window navigation
map('n', '<c-h>', '<c-w>h', { noremap = true })
map('n', '<c-j>', '<c-w>j', { noremap = true })
map('n', '<c-k>', '<c-w>k', { noremap = true })
map('n', '<c-l>', '<c-w>l', { noremap = true })

-- buffer navigation
map('n', '<C-n>', ':bnext<CR>', { noremap = true })
map('n', '<C-p>', ':bprev<CR>', { noremap = true })

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
map('n', '<Leader>c', ':bd<CR>', { noremap = true })
