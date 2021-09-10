--
-- jedn awesomerc
-- volume-popup.lua, handles signals for volume popup
--

local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi

local naughty = require("naughty")

local createPopup = require("widgets.popup.popup")

local fetchVolume = require("lib.fetch-volume")

local popup = createPopup(beautiful.blue)

awesome.connect_signal("evil::volume", function(volume)
  popup.update(volume.value, volume.image)
end)

awesome.connect_signal("popup::volume", function(change)
  local volume = fetchVolume()
  popup.update(volume.value, volume.image)
  popup.show()
end)
