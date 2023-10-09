local widgets = require("helpers.dashboardwidgets")
local system = require("system.volume")

-- Volume
local volume_button = widgets.dashboard_button("")
local volume_area = widgets.dashboard_box(volume_button)

volume_button:connect_signal("button::press", function()
    system.toggle_volume()
end)

volume_button:connect_signal("mouse::enter", function()
    volume_button.markup = widgets.recolor("", Color.fg)
end)

volume_button:connect_signal("mouse::leave", function()
    volume_button.markup = widgets.recolor("", Color.accent)
end)

local function update(muted)
    if muted then
        return {
            icon = "<span foreground='" .. Color.bg .. "'>󰸈</span>",
            background = Color.accent,
        }
    else
        return {
            icon = "<span foreground='" .. Color.accent .. "'></span>",
            background = Color.bg,
        }
    end
end

awesome.connect_signal("signal::volume", function(_, muted)
    att = update(muted)
    volume_button.markup = att.icon
    volume_area.bg = att.background
end)

return volume_area
