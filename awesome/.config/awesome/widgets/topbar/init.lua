--
-- jedn awesome config
-- init.lua for topbar widget
--

local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = require("beautiful.xresources").apply_dpi

local apps = require("config.apps")

local button = require("lib.button")

local widget = function(inner_widget)
  return wibox.widget {
    widget = wibox.container.margin,
    top = dpi(5),
    bottom = dpi(5),
    left = dpi(6),
    right = dpi(6),
    {
      inner_widget,
      layout = wibox.layout.fixed.horizontal
    }
  }
end

-- sub widgetry
local session = require("widgets.topbar.session")
local taglist = require("widgets.topbar.taglist")
local clock = require("widgets.topbar.clock")
local battery = require("widgets.topbar.battery")
local tray_toggle = require("widgets.topbar.tray-toggle")

beautiful.systray_icon_spacing = dpi(12)
local systray = wibox.widget.systray()

-- setup
awful.screen.connect_for_each_screen(function(s)
  s.topbar = awful.wibar({
    ontop = false,
    screen = s,
    type = "dock",
    height = dpi(28),
    width = s.geometry.width,
    x = s.geometry.x,
    y = s.geometry.y,
    bg = beautiful.bg_normal
  })

  s.systray = wibox.widget {
    visible = false,
    base_size = dpi(20),
    horizontal = true,
    screen = 'primary',
    widget = wibox.widget.systray,
  }

  local bar_taglist = taglist.init(s)

  s.topbar:setup {
    layout = wibox.layout.align.horizontal,
    expand = "none",

    {   -- Left
      layout = wibox.layout.fixed.horizontal,
      spacing = dpi(10),

      widget(session),
      bar_taglist,
    },

    {   -- Middle
      layout = wibox.layout.fixed.horizontal,
      spacing = dpi(10),

      widget(clock),
    },

    {   -- Right
      layout = wibox.layout.fixed.horizontal,
      spacing = dpi(10),

      {
        s.systray,
        margins = dpi(5),
        widget = wibox.container.margin
      },

      widget(tray_toggle),
      widget(battery),
    }
  }
end)
