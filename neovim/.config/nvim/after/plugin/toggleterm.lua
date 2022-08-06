-- toggleterm config

local nnoremap = require("jedn.utils").nnoremap
local highlights = require("rose-pine.plugins.toggleterm")

require("toggleterm").setup({
  size = 15,
  persist_size = false,
  hide_numbers = true,
  shade_terminals = true,
  direction = "horizontal",
  highlights = highlights,

  open_mapping = "<leader>tt",
  start_in_insert = true,
  insert_mappings = false,
  terminal_mappings = false,

  close_on_exit = true,
})

nnoremap("<leader>g", function()
  require("toggleterm.terminal").Terminal
    :new({ cmd = "lazygit", hidden = true, direction = "float" })
    :toggle()
end, { silent = true })
