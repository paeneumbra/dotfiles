local wibox = require("wibox")

local function wrapping_widget(widget)
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

-- Calendar
local month_calendar = wibox.widget({
    date = os.date("*t"),
    font = Bold_Font,
    widget = wibox.widget.calendar.month,
})

return wrapping_widget(wibox.widget {
    month_calendar,
    spacing = xdpi(10),
    layout = wibox.layout.fixed.vertical,
})