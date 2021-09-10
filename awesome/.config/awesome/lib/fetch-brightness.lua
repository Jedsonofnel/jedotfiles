--
-- jedn awesomerc
-- fetch-brightness.lua, function to return brightness info
--

local fetchBrightness = function ()
  local GET_BRIGHTNESS_CMD = "brightnessctl info"

  local handle = io.popen(GET_BRIGHTNESS_CMD)
  local result = handle:read("*a")
  handle:close()

  local brightness = tonumber(string.match(string.match(result, "%d+%%"), "%d+"))

  return {value=brightness, image=""}
end

return fetchBrightness
