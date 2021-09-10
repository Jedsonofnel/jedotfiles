--
-- jedn awesomerc
-- brightness.lua, brightness "daemon"
--

local watch = require("awful.widget.watch")
local naughty = require("naughty")

local fetchBrightness = require("lib.fetch-brightness")

local GET_BRIGHTNESS_CMD = "brightnessctl info"

watch(GET_BRIGHTNESS_CMD, 1, function(_, _, _, _, _)
  local brightness_info = fetchBrightness()
  local brightness = brightness_info.value
  local icon = brightness_info.image

  awesome.emit_signal("evil::brightness", {
    value = brightness,
    image = icon
  })
end, nil)
