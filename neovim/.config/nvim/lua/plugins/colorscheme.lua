--
-- jedn nvim config
-- colorscheme settings (Big fan of rose-pine atm)
--

-- settings
require('rose-pine').setup({
  dark_variant = 'main',
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_italics = false,
})

-- this needs to be last
vim.cmd('colorscheme rose-pine')
