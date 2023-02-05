local wibox = require("wibox")
local widgets = require("interface.helpers.widgets")

local colored_icon = "<span foreground='" .. Color.accent .. "'>󰋚</span>"
local uptime = widgets.basic_text()
local uptime_icon = widgets.basic_icon(colored_icon)

-- Uptime
local function get_status()
    awesome.connect_signal("signal::uptime", function(stdout)
        uptime.markup = stdout
    end)
end

get_status()

return widgets.wrapping_widget(wibox.widget {
    uptime_icon,
    uptime,
    layout = wibox.layout.fixed.vertical,
})