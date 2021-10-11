--
-- jedn awesomerc
-- clickable-container.rc, applies mouse effect on widgets
--

local wibox = require("wibox")
local beautiful = require("beautiful")

local create_click_events = function(widget)

  local container = wibox.widget {
    widget,
    widget = wibox.container.background
  }

  -- TODO add colours to theme for hover etc....

  -- Old and new widget
  local old_cursor, old_wibox

  -- Mouse hovers on the widget
  container:connect_signal(
    "mouse::enter",
    function()
      container.bg = beautiful.bg_normal .. "99"
      local w = mouse.current_wibox
      if w then
        old_cursor, old_wibox = w.cursor, w
        w.cursor = "hand1"
      end
    end
  )

  -- Mouse leaves the widget
  container:connect_signal(
    "mouse::leave",
    function()
      container.bg = beautiful.bg_normal .. "99"
      if old_wibox then
        old_wibox.cursor = old_cursor
        old_wibox = nil
      end
    end
  )

  -- Mouse pressed the widget
  container:connect_signal(
    "button::press",
    function()
      container.bg = beautiful.bg_normal
    end
  )

  -- Mouse releases the widget
  container:connect_signal(
    "button::release",
    function()
      container.bg = beautiful.bg_normal
    end
  )

  return container
end

return create_click_events
