--
-- jedn awesomerc
-- volume.lua, volume "daemon"
--

local awful = require("awful")
local watch = require("awful.widget.watch")

local fetchVolume = require("lib.fetch-volume")

local handleVolume = function()
  local volume_info = fetchVolume()
  local volume = volume_info.volume
  local icon = volume_info.icon

  awesome.emit_signal("evil::volume", {
    value = volume,
    image = icon
  })
end

watch(GET_VOLUME_CMD, 1, function(_, _, _, _, _)
  handleVolume()
end, nil)
