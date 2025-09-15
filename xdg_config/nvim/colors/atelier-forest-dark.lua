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

local base16 = require("base16")
base16.from_palette(palette)
vim.g.colors_name = 'atelier-forest-dark'
