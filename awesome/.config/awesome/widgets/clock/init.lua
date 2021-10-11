--
-- jedn awesomerc
-- clock widget for topbar
--

local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require("lib.clickable-container")
local config = require("config.config")
local military_mode = config.widget.clock.military_mode or false

local create_clock = function(s)
  local clock_format = nil
  if not military_mode then
    clock_format = '<span font="Inter Bold 11">%I:%M %p</span>'
  else
    clock_format = '<span font="Inter Bold 11">%H:%M</span>'
  end

  s.clock_widget = wibox.widget.textclock(
    clock_format,
    1
  )

  s.clock_widget = wibox.widget {
    {
      s.clock_widget,
      margins = dpi(7),
      widget = wibox.container.margin
    },
    widget = clickable_container
  }

  return s.clock_widget
end

return create_clock
