local _attributes = {}

function _attributes.pick(disk_usage)
    if disk_usage == nil or disk_usage == 0 then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰀦</span>",
            widget_color = Color.red,
            text = "<span foreground='" .. Color.red .. "'>WARN</span>",
        }
    elseif disk_usage > 75 then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰋊</span>",
            widget_color = Color.red,
            text = "<span foreground='" .. Color.red .. "'>" .. disk_usage .. "%</span>",
        }
    else
        return {
            icon = "<span foreground='" .. Color.fg .. "'>󰋊</span>",
            widget_color = Color.accent,
            text = "<span foreground='" .. Color.fg .. "'>" .. disk_usage .. "%</span>",
        }
    end
end

return _attributes
