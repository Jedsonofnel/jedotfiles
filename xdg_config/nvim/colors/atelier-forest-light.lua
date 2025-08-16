-- colors/atelier-forest-light.lua
require('mini.base16').setup({
	palette = {
		base00 = '#f1efee', -- background
		base01 = '#e6e2e0', -- lighter background
		base02 = '#9c9491', -- selection background
		base03 = '#a8a19f', -- comments
		base04 = '#68615e', -- dark foreground
		base05 = '#766e6b', -- foreground
		base06 = '#2c2421', -- light foreground
		base07 = '#1b1918', -- lightest foreground
		base08 = '#f22c40', -- red
		base09 = '#df5320', -- orange
		base0A = '#c38418', -- yellow
		base0B = '#7b9726', -- green
		base0C = '#00ad9c', -- cyan
		base0D = '#407ee7', -- blue
		base0E = '#6666ea', -- purple
		base0F = '#c33ff3', -- magenta
	},
	use_cterm = true,
	plugins = { default = true },
})

-- Override the psychedelic delimiters
vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#766e6b' }) -- base05 (foreground)
vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#766e6b' })
vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#766e6b' })

-- Set the colorscheme name
vim.g.colors_name = 'atelier-forest-light'
