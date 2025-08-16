-- colors/atelier-forest-dark.lua
local palette = {
	base00 = '#1b1918', -- background
	base01 = '#2c2421', -- lighter background
	base02 = '#68615e', -- selection background
	base03 = '#766e6b', -- comments
	base04 = '#9c9491', -- dark foreground
	base05 = '#a8a19f', -- foreground
	base06 = '#e6e2e0', -- light foreground
	base07 = '#f1efee', -- lightest foreground
	base08 = '#f22c40', -- red
	base09 = '#df5320', -- orange
	base0A = '#c38418', -- yellow
	base0B = '#7b9726', -- green
	base0C = '#00ad9c', -- cyan
	base0D = '#407ee7', -- blue
	base0E = '#6666ea', -- purple
	base0F = '#c33ff3', -- magenta
}

require('mini.base16').setup({
	palette = palette,
	use_cterm = true,
	plugins = { default = true },
})

-- Override the psychedelic delimiters
vim.api.nvim_set_hl(0, 'Delimiter', { fg = palette.base05 }) -- base05
vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = palette.base05 })
vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = palette.base05 })

-- Set other defaults
vim.api.nvim_set_hl(0, "@variable.member.ruby", { fg = palette.base08 })
vim.api.nvim_set_hl(0, "@variable.builtin", { fg = palette.base08 })

-- Set the colorscheme name
vim.g.colors_name = 'atelier-forest-dark'
