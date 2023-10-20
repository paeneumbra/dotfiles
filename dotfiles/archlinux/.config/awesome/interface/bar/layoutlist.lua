local awful = require "awful"
local wibox = require "wibox"

return function(s)
    local layoutlist = wibox.widget {
        awful.widget.layoutbox(s),
        top = Xdpi(4),
        bottom = Xdpi(4),
        widget = wibox.container.margin,
    }

    layoutlist:connect_signal("button::press", function()
        awful.layout.inc(1, s)
    end)

    return layoutlist
end
