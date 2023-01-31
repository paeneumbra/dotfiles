local wibox = require("wibox")
local beautiful = require("beautiful")
local helper = require("helpers.icons")

local profile_picture = wibox.widget({
    image = helper.recolor(beautiful.profile_picture, Color.fg),
    resize = true,
    halign = "center",
    valign = "center",
    widget = wibox.widget.imagebox,
})

local user_box = wibox.widget({
    font = Large_Font,
    align = "center",
    widget = wibox.widget.textbox,
    markup = "󰳣 󰣇󰰟󰯲󰰁󰰴"
})

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

return wrapping_widget(wibox.widget {
    profile_picture,
    user_box,
    spacing = xdpi(20),
    layout = wibox.layout.fixed.vertical,
})