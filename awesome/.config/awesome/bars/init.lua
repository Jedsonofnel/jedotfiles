--
-- jedn awesomerc
-- init file for bar management
--

local awful = require("awful")
local topbar = require("bars.topbar")
local leftbar = require("bars.leftbar")

-- Create a wibox panel for each screen and add it
awful.screen.connect_for_each_screen(function(s)
    if s.index == 1 then
      s.leftbar = leftbar(s)
      s.topbar = topbar(s, true)
    else
      s.toppanel = topbar(s, false)
    end
  end
)

-- Hide bars when app goes fullscreen
function update_bars_visibility()
  for s in screen do
    if s.selected_tag then
      local fullscreen = s.selected_tag.fullscreen_mode
      s.topbar.visible = not fullscreen
      if s.leftbar then
        s.leftbar.visible = not fullscreen
      end
    end
  end
end

tag.connect_signal(
  "property::selected",
  function(t)
    update_bars_visibility()
  end
)

client.connect_signal(
  "property::fullscreen",
  function(c)
    if c.first_tag then
      c.first_tag.fullscreen_mode = c.fullscreen
    end
    update_bars_visibility()
  end
)

client.connect_signal(
  "unmanage",
  function(c)
    if c.fullscreen then
      c.screen.selected_tag.fullscreen_mode = false
      update_bars_visibility()
    end
  end
)
