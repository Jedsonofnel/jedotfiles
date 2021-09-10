--
-- jedn awesomerc
-- brightness-popup.lua, handles signals for brightness popup
--

local beautiful = require("beautiful")
local createPopup = require("widgets.popup.popup")

local fetchBrightness = require("lib.fetch-brightness")

local popup = createPopup(beautiful.green)

awesome.connect_signal("evil::brightness", function(brightness)
  popup.update(brightness.value, brightness.image)
end)

awesome.connect_signal("popup::brightness", function()
  local brightness = fetchBrightness()
  popup.update(brightness.value, brightness.image)
  popup.show()
end)
