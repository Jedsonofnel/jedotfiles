--
-- jedn awesomerc
-- taglist part of leftbar
--

local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi
local icons = require("theme.icons")
local tag_list = require("widgets.tag-list")
local clickable_container = require("lib.clickable-container")

return function(s, bar, action_bar_width)
  local menu_icon = wibox.widget {
    {
      id = "menu_btn",
      image = icons.menu,
      resize = true,
      widget = wibox.widget.imagebox
    },
    margins = dpi(10),
    widget = wibox.container.margin
  }

  local open_dashboard_button = wibox.widget {
    {
      menu_icon,
      widget = clickable_container
    },
    bg = beautiful.background .. "66",
    widget = wibox.container.background
  }

  open_dashboard_button:buttons(
    gears.table.join(
      awful.button(
        {},
        1,
        nil,
        function()
          -- panel:toggle()
        end
      )
    )
  )

  return wibox.widget {
    id = "action_bar",
    layout  = wibox.layout.align.vertical,
    forced_width = action_bar_width,
    {
      tag_list(s),
      layout = wibox.layout.fixed.vertical
    },
    nil,
    open_dashboard_button
  }
end
