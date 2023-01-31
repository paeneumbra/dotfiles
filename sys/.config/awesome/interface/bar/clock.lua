local gears = require("gears")
local wibox = require("wibox")

-- Clock
local clock = wibox.widget({
    widget = wibox.widget.textbox,
    font = Bold_Font,
})

gears.timer({
    timeout = 60,
    autostart = true,
    call_now = true,
    callback = function()
        clock.markup = os.date(" 󰃰 %a %d/%m/%y | %H:%M ")
    end,
})

clock:connect_signal("button::press", function()
    awesome.emit_signal("sidebar::toggle")
end)

return clock
