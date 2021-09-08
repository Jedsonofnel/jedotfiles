--
-- jedn awesome config
-- all the other files are sourced here
--

local awful = require("awful")
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Error handling
require("config.errorhandling")

-- Theme file
beautiful.init(awful.util.getdir("config") .. "theme.lua")

-- Config files
require("config.wallpaper")
require("config.layout")
require("config.rules")
require("config.tags")
require("config.keys")

-- Daemons
require("evil")

-- Widgets
require("widgets.topbar")
require("widgets.popup")

require("awful.autofocus")

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- autorun programs
awful.spawn.with_shell("~/.config/awesome/config/autorun.sh")
