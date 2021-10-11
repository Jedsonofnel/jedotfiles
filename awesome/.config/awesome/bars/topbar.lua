--
-- jedn awesomerc
-- topbar setup
--

local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local icons = require("theme.icons")
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require("lib.clickable-container")

local topbar = function(s, offset)
  local offsetx = 0

  if offset == true then
    offsetx = dpi(45)
  end

  local bar = wibox
  {
    ontop = true,
    screen = s,
    type = "dock",
    height = dpi(28),
    width = s.geometry.width - offsetx,
    x = s.geometry.x + offsetx,
    y = s.geometry.y,
    stretch = false,
    bg = beautiful.background,
    fg = beautiful.fg_normal
  }

  bar:struts
  {
    top = dpi(28)
  }

  bar:connect_signal(
    'mouse::enter',
    function()
      local w = mouse.current_wibox
      if w then
        w.cursor = 'left_ptr'
      end
    end
  )

  s.systray = wibox.widget {
    visible = false,
    base_size = dpi(20),
    horizontal = true,
    screen = 'primary',
    widget = wibox.widget.systray
  }

  -- widget setup
  local clock       = require("widgets.clock")(s)
  s.tray_toggler    = require("widgets.tray-toggle")

  bar : setup {
    layout = wibox.layout.align.horizontal,
    expand = 'none',
    {
      layout = wibox.layout.fixed.horizontal
    },
    clock,
    {
      layout = wibox.layout.fixed.horizontal,
      spacing = dpi(5),
      {
        s.systray,
        margins = dpi(5),
        widget = wibox.container.margin
      },
      s.tray_toggler
    }
  }
  return bar
end

return topbar
