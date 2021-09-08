--
-- jedn awesomerc
-- script to fetch volume
--

local GET_VOLUME_CMD = 'amixer -D pulse sget Master'

local fetchVolume = function(stdout)
    local mute = string.match(stdout, "%[(o%D%D?)%]")   -- \[(o\D\D?)\] - [on] or [off]
    local volume = string.match(stdout, "(%d?%d?%d)%%") -- (\d?\d?\d)\%)
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

    return {volume=volume, icon=icon}
end

return fetchVolume
