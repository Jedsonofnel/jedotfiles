--
-- jedn nvim config
-- nvim-tree related settings
--

require 'nvim-tree'.setup {}

local map = vim.api.nvim_set_keymap

map('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })
