--
-- jedn awesomerc
-- watches volume, functions as a "Daemon"
--

local awful = require("awful")
local watch = require("awful.widget.watch")

-- Function that returns volume icom & level
-- Putting this in a separate file means I can use it for other things
local fetchVolume = require("lib.volume-fetch")

local GET_VOLUME_CMD = 'amixer -D pulse sget Master'

local handleVolume = function(stdout)
  local volume_info = fetchVolume(stdout)
  local volume = volume_info.volume
  local icon = volume_info.icon

  awesome.emit_signal("evil::volume", {
    value = volume,
    image = icon
  })
end

watch(GET_VOLUME_CMD, 1, function(_, stdout, _, _, _)
    handleVolume(stdout)
end, nil)
