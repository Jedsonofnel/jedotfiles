--
-- jedn awesomerc
-- fetch-volume.lua, function to return volume info
--

local fetchVolume = function()
  local GET_VOLUME_CMD = 'amixer -D pulse sget Master'

  local handle = io.popen(GET_VOLUME_CMD)
  local result = handle:read("*a")
  handle:close()

  local mute = string.match(result, "%[(o%D%D?)%]")   -- \[(o\D\D?)\] - [on] or [off]
  local volume = string.match(result, "(%d?%d?%d)%%") -- (\d?\d?\d)\%)
  volume = tonumber(string.format("% 3d", volume))

  local icon = ""

  if mute == 'off' then
      icon = ""
  elseif volume > 50 then
      icon = ""
  elseif volume > 5 then
      icon = ""
  else
      icon = ""
  end

  return {value=volume, image=icon}
end

return fetchVolume
