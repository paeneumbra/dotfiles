local _attributes = {}

function _attributes.pick(charging, battery)
    if charging then
        return {
            icon = "<span foreground='" .. Color.yellow .. "'>󰢞</span>",
            slider_color = Color.yellow,
        }
    elseif battery ~= nil and battery < 20 then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰁺</span>",
            slider_color = Color.red,
        }
    else
        return {
            icon = "<span foreground='" .. Color.fg .. "'>󰁹</span>",
            slider_color = Color.accent,
        }
    end
end

return _attributes