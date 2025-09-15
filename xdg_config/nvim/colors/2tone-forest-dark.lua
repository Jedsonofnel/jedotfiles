local palette = {
	base00 = "#2a2d2a", -- A0, bg
	base01 = "#353b35", -- A1, lighter bg
	base02 = "#485148", -- A2, selection bg
	base03 = "#535f53", -- A3, comments/whitespace

	base04 = "#a1a58d", -- C2, dark fg
	base05 = "#b2b5a1", -- C3, fg
	base06 = "#d7dac8", -- C5, light fg
	base07 = "#fbfbf8", -- C7, lightest fg

	base08 = "#b1c44f",  -- D3, Errors (first hue, most saturated)
	base09 = "#687d68",  -- B3, Constants (second hue, medium)
	base0A = "#bfd454",  -- D4, Warnings (second hue, brighter)
	base0B = "#8fae8f",  -- B4, Strings (neutral, less emphasis)
	base0C = "#cbe25a",  -- D5, Info (second hue, brightest)
	base0D = "#b3d6b3",  -- B5, Functions (second hue, bright)
	base0E = "#daf06a",  -- D6, Keywords (first hue, medium)
	base0F = "#c8e4c8",  -- B6, Special (first hue, dark)
}

-- experimenting with 2tone colour schemes
-- A is background hue
-- B is first hue
-- C is foreground hue
-- D is second hue
-- Each series: 8 steps from darkest/most saturated → lightest/least saturated
-- This is forest: https://base2t.one/demo/forest/
local base16 = require("base16")
base16.from_palette(palette)
vim.g.colors_name = "2tone-forest-dark"
