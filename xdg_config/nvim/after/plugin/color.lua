-- colorscheme
vim.opt.termguicolors = true

require("rose-pine").setup({
  dark_variant = "main",
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = true,

  highlight_groups = {
    NonText = { fg = "overlay" },
    IndentBlanklineChar = { fg = "overlay" },
    CursorLineNr = { fg = "rose" },
    IndentBlanklineContextChar = { fg = "gold" },
  },
})

vim.cmd("colorscheme rose-pine")

-- colorizer
require("colorizer").setup()
