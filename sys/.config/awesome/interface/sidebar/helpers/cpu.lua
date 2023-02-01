local _attributes = {}

function _attributes.pick(cpu_temperature)
    if cpu_temperature > 90 then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰈸</span>",
            widget_color = Color.red,
            text = "<span foreground='" .. Color.red .. "'>" .. cpu_temperature .. "°C" .. "</span>"
        }
    elseif cpu_temperature > 70 then
        return {
            icon = "<span foreground='" .. Color.yellow .. "'>󰔏</span>",
            widget_color = Color.yellow,
            text = "<span foreground='" .. Color.yellow .. "'>" .. cpu_temperature .. "°C" .. "</span>"
        }
    else
        return {
            icon = "<span foreground='" .. Color.fg .. "'>󰔏</span>",
            widget_color = Color.accent,
            text = "<span foreground='" .. Color.fg .. "'>" .. cpu_temperature .. "°C" .. "</span>"
        }
    end
end

return _attributes