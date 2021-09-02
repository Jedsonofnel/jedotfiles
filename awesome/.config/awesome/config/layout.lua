--
-- jedn awesome config
-- layout.lua -> sourced in rc.lua
--

local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.floating
}
