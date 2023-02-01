local _attributes = {}

function _attributes.pick(muted)
    if muted then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰖁</span>",
            widget_color = Color.red,
        }
    else
        return {
            icon = "<span foreground='" .. Color.fg .. "'>󰕾</span>",
            widget_color = Color.accent,
        }
    end
end

return _attributes