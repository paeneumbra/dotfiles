local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local default_markup = "<span foreground='" .. Color.cyan .. "'> 󱥨 </span>"
local launcher = wibox.widget({
    markup = default_markup,
    widget = wibox.widget.textbox,
    font = Default_Font,
})

launcher:connect_signal("mouse::enter", function()
    launcher.markup = "<span foreground='" .. Color.gray .. "'> 󱥨 </span>"
end)

launcher:connect_signal("mouse::leave", function()
    launcher.markup = default_markup
end)

launcher:buttons(gears.table.join(awful.button({}, 1, function()
    awful.spawn(Apps.launcher, false)
end)))

return launcher
