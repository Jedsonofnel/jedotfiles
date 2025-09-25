local palette = {
	base00 = "#24242e", -- A0, bg
	base01 = "#333342", -- A1, lighter bg
	base02 = "#515167", -- A2, selection bg
	base03 = "#5b5b76", -- A3, comments/whitespace

	base04 = "#737391", -- C2, dark fg
	base05 = "#767693", -- C3, fg
	base06 = "#aaaaca", -- C5, light fg
	base07 = "#ebebff", -- C7, lightest fg

	base08 = "#5151e6", -- D3, Errors (first hue, most saturated)
	base09 = "#dd672c", -- B3, Constants (second hue, medium)
	base0A = "#ec7336", -- D4, Warnings (second hue, brighter)
	base0B = "#7b736f", -- B4, Strings (neutral, less emphasis)
	base0C = "#fe8c52", -- D5, Info (second hue, brightest)
	base0D = "#f37b3f", -- B5, Functions (second hue, bright)
	base0E = "#7676f4", -- D6, Keywords (first hue, medium)
	base0F = "#6363ee", -- B6, Special (first hue, dark)
}

-- This is space: https://base2t.one/demo/space/
local base16 = require("base16")
base16.from_palette(palette)
vim.g.colors_name = "2tone-space-dark"
