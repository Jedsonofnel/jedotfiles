--
-- jedn awesomerc
-- init.lua for jedn-one theme
--

local filesystem = require("gears.filesystem")
local theme_dir = filesystem.get_configuration_dir() .. "/theme"

local theme = {}

theme.icons = theme_dir .. "/icons/"
theme.font = "Inter Regular 10"
theme.font_bold = "Inter Bold 10"

-- Colorscheme (Based on Ayu Dark)
theme.system_black_dark = '#000000'
theme.system_black_light = '#737d87'

theme.system_red_dark = '#f34a4a'
theme.system_red_light = '#ff3333'

theme.system_green_dark = '#bae67e'
theme.system_green_light = '#c2d94c'

theme.system_yellow_dark = '#ffee99'
theme.system_yellow_light = '#e7c547'

theme.system_blue_dark = '#73d0ff'
theme.system_blue_light = '#59c2ff'

theme.system_magenta_dark = '#d4bfff'
theme.system_magenta_light = '#b77ee0'

theme.system_cyan_dark = '#83cec6'
theme.system_cyan_light = '#5ccfe6'

theme.system_white_dark = '#f2f2f2'
theme.system_white_light = '#ffffff'

-- Accent color
theme.accent = theme.system_blue_light

-- Background color
theme.background = "#0f1419" .. "99"

theme.transparent = "#00000000"

-- Home icon
theme.jedn_icon = theme.icons .. "jedn.svg"
theme.jedn_icon_hi = theme.icons .. "jedn-hi.svg"

local awesome_overrides = function(theme) end

return {
  theme = theme,
  awesome_overrides = awesome_overrides
}
