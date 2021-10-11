local beautiful = require("beautiful")

local button = require("lib.button")

local color = beautiful.green
local color_hover = beautiful.green_light

return button.create_image_onclick(beautiful.jedn_icon, beautiful.jedn_icon_hi, function()
  --awesome.emit_signal("dashboard::toggle")
end)
