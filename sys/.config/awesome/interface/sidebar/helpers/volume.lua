local _attributes = {}

function _attributes.pick(vol, muted)
    if muted then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰖁</span>",
            widget_color = Color.red,
            text = "<span foreground='" .. Color.red .. "'>" .. vol .. "%" .. "</span>",
        }
    else
        return {
            icon = "<span foreground='" .. Color.fg .. "'>󰕾</span>",
            widget_color = Color.accent,
            text = "<span foreground='" .. Color.fg .. "'>" .. vol .. "%" .. "</span>",
        }
    end
end

return _attributes