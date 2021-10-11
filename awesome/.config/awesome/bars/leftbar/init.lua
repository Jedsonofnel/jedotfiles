--
-- jedn awesomerc
-- code for left bar, where taglist will be
--

local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local apps = require("config.apps")

local leftbar = function(screen)
  local action_bar_width = dpi(45)

  local bar = wibox {
    screen = screen,
    width = action_bar_width,
    type = "dock",
    height = screen.geometry.height,
    x = screen.geometry.x,
    y = screen.geometry.y,
    ontop = true,
    shape = gears.shape.rectangle,
    bg = beautiful.background,
    fg = beautiful.fg_normal
  }

  bar:struts {
    left = action_bar_width
  }

  bar:setup {
    layout = wibox.layout.align.horizontal,
    nil,
    {
      id = "panel_content",
      bg = beautiful.transparent,
      widget = wibox.container.background,
      visible = false,
      forced_width = panel_content_width,
      {
        layout = wibox.layout.stack
      }
    },
    require("bars.leftbar.action-bar")(screen, bar, action_bar_width)
  }
  return bar
end

return leftbar
