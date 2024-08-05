local wibox = require "wibox"

local _widgets = {}

function _widgets.recolor(value, color)
    text = tostring(value)
    return "<span foreground='" .. color .. "'>" .. text .. "</span>"
end

function _widgets.wibar_icon(icon, color)
    if color == nil then
        wibar_markup = _widgets.recolor(icon, Color.green)
    else
        wibar_markup = _widgets.recolor(icon, color)
    end
    return wibox.widget {
        markup = wibar_markup,
        font = Icon_Font,
        valign = "center",
        halign = "center",
        widget = wibox.widget.textbox,
    }
end

function _widgets.wibar_text(icon, color)
    return wibox.widget {
        markup = _widgets.recolor(icon, color or Color.green),
        font = Font(18, "Bold"),
        valign = "center",
        halign = "center",
        widget = wibox.widget.textbox,
    }
end

return _widgets
