local beautiful = require("beautiful")

local button = require("lib.button")

local color = beautiful.green
local color_hover = beautiful.green_light

return button.create_image_onclick(beautiful.home_icon, beautiful.home_icon_hi, function()
  --awesome.emit_signal("dashboard::toggle")
end)
