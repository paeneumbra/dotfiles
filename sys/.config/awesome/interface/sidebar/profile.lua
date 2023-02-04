local wibox = require("wibox")
local beautiful = require("beautiful")
local helper = require("helpers.icons")
local widgets = require("interface.helpers.widgets")

local profile_picture = wibox.widget({
    image = helper.recolor(beautiful.profile_picture, Color.fg),
    resize = true,
    halign = "center",
    valign = "center",
    widget = wibox.widget.imagebox,
})

local user_box = wibox.widget({
    font = Font(45),
    align = "center",
    widget = wibox.widget.textbox,
    markup = "󰣇󰰟󰯲󰰁󰰴"
})

return widgets.wrapping_widget(wibox.widget {
    profile_picture,
    user_box,
    layout = wibox.layout.fixed.vertical,
})