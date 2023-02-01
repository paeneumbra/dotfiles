local wibox = require("wibox")

local _widgets = {}

function _widgets.wrapping_widget(widget)
    return wibox.widget {
        nil,
        {
            nil,
            widget,
            expand = "none",
            layout = wibox.layout.align.horizontal,
        },
        expand = "none",
        layout = wibox.layout.align.vertical,
    }
end

function _widgets.basic_widget()
    return wibox.widget({
        font = Bold_Font,
        align = "center",
        widget = wibox.widget.textbox,
    })
end

return _widgets