--
-- jedn awesomerc
-- init.lua for theme folder - handles themes
--

local gtable = require("gears.table")
local default_theme = require("theme.default-theme")

-- Choose theme
local theme = require("theme.jedn-one")

local final_theme = {}
gtable.crush(final_theme, default_theme.theme)
gtable.crush(final_theme, theme.theme)
default_theme.awesome_overrides(final_theme)
theme.awesome_overrides(final_theme)

return final_theme
