-- colors/atelier-forest-light.lua
local palette = {
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
}

local base16 = require("base16")
base16.from_palette(palette)
vim.g.colors_name = 'atelier-forest-light'
