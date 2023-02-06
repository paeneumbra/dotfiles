local _attributes = {}


function _attributes.button_area(is_on)
    if is_on then
        return {
            icon = "<span foreground='" .. Color.accent .. "'>󰂯</span>",
            background = Color.bg,
        }
    else
        return {
            icon = "<span foreground='" .. Color.bg .. "'>󰂲</span>",
            background = Color.accent,
        }
    end
end

return _attributes
