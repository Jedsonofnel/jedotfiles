--
-- jedn awesome config
-- all the other files are sourced here
--

local gears = require("gears")
local beautiful = require("beautiful")
local awful = require("awful")
require("awful.autofocus")

-- Error handling
require("config.errorhandling")

--  Shell
awful.util.shell = "sh"

-- Theme
beautiful.init(require("theme"))

-- Bars
require("bars")

-- Config
require("config.client")
require("config.wallpaper")
require("config.rules")
require("config.tags")
require("config.keys")

-- Daemons
require("evil")

-- Widgets
require("widgets.popup")
