--
-- jedn nvim config
-- nvim-tree related settings
--

require 'nvim-tree'.setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})

local map = vim.api.nvim_set_keymap

map('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })
