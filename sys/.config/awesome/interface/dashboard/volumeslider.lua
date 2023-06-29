local widgets = require("helpers.dashboardwidgets")
local system = require("system.volume")

local volume_icon = widgets.simple_icon("")
local volume_slider = widgets.slider(153) -- Max volume is 153%
local volume_text = widgets.simple_text()
local volume = widgets.bar_group(volume_icon, volume_slider, volume_text)

volume_slider:connect_signal("property::value", function(_, value)
    system.set(value)
end)

local function update(vol, muted)
    if muted then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰸈</span>",
            widget_color = Color.red,
            text = "<span foreground='" .. Color.red .. "'>" .. vol .. "%</span>",
        }
    else
        return {
            icon = "<span foreground='" .. Color.fg .. "'></span>",
            widget_color = Color.accent,
            text = "<span foreground='" .. Color.fg .. "'>" .. vol .. "%</span>",
        }
    end
end

awesome.connect_signal("signal::volume", function(vol, muted)
    att = update(vol, muted)
    volume_slider.value = vol
    volume_icon.markup = att.icon
    volume_slider.bar_active_color = att.widget_color
    volume_slider.handle_color = att.widget_color
    volume_text.markup = att.text
end)

return volume
