local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

-- Clock
local clock = wibox.widget({
    widget = wibox.widget.textbox,
    font = Bold_Font,
})

local month_calendar = awful.widget.calendar_popup.month({
    position = "br",
    margin = Dimensions.border,
    style_month = {
        border_color = Color.blue,
        padding = xdpi(10),
    },
    style_header = { border_width = 0 },
    style_weekday = { border_width = 0 },
    style_normal = { border_width = 0 },
    style_focus = {
        border_width = 0,
        bg_color = Color.bg,
        fg_color = Color.blue,
    },

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
    month_calendar:toggle()
end)

return clock
