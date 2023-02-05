local gears = require("gears")
local wibox = require("wibox")

local widgets = require("interface.helpers.widgets")

-- Clock
local clock = widgets.basic_text()
clock.font = Font(18, "Bold")

local clock_icon = widgets.basic_icon("󰃰")

gears.timer({
    timeout = 60,
    autostart = true,
    call_now = true,
    callback = function()
        clock.markup = os.date(" %a %d/%m/%y | %H:%M ")
    end,
})

clock:connect_signal("button::press", function()
    awesome.emit_signal("sidebar::toggle")
end)

return widgets.wrapping_widget(wibox.widget {
    clock_icon,
    clock,
    spacing = Xdpi(10),
    layout = wibox.layout.fixed.horizontal,
})
