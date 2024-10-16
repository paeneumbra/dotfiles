local wibox = require "wibox"
local beautiful = require "beautiful"
local helper = require "helpers.icons"

return wibox.widget {
    image = helper.recolor(beautiful.profile_picture, Color.fg),
    resize = true,
    halign = "center",
    valign = "center",
    widget = wibox.widget.imagebox,
}
