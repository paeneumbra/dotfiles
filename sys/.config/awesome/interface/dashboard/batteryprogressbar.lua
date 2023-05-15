local widgets = require("helpers.dashboardwidgets")

local bat0_icon = widgets.simple_icon("")
local bat0_progressbar = widgets.progressbar(100)
local bat0_text = widgets.simple_text()
local bat0 = widgets.bar_group(bat0_icon, bat0_progressbar, bat0_text)

local bat1_icon = widgets.simple_icon("")
local bat1_progressbar = widgets.progressbar(100)
local bat1_text = widgets.simple_text()
local bat1 = widgets.bar_group(bat1_icon, bat1_progressbar, bat1_text)

local function update(battery, charging)
    if battery == nil then
        return {
            icon = "<span foreground='" .. Color.yellow .. "'></span>",
            widget_color = Color.yellow,
            text = "<span foreground='" .. Color.yellow .. "'>WARN</span>",
        }
    elseif charging then
        return {
            icon = "<span foreground='" .. Color.yellow .. "'></span>",
            widget_color = Color.yellow,
            text = "<span foreground='" .. Color.yellow .. "'>" .. battery .. "%</span>",
        }
    elseif battery ~= nil and battery < 20 then
        return {
            icon = "<span foreground='" .. Color.red .. "'></span>",
            widget_color = Color.red,
            text = "<span foreground='" .. Color.red .. "'>" .. battery .. "%</span>",
        }
    else
        return {
            icon = "<span foreground='" .. Color.fg .. "'></span>",
            widget_color = Color.accent,
            text = "<span foreground='" .. Color.fg .. "'>" .. battery .. "%</span>",
        }
    end
end

awesome.connect_signal("signal::battery", function(battery0, _, charging)
    att = update(battery0, charging)
    bat0_progressbar.value = battery0
    bat0_icon.markup = att.icon
    bat0_progressbar.color = att.widget_color
    bat0_text.markup = att.text
end)

awesome.connect_signal("signal::battery", function(_, battery1, charging)
    att = update(battery1, charging)
    bat1_progressbar.value = battery1
    bat1_icon.markup = att.icon
    bat1_progressbar.color = att.widget_color
    bat1_text.markup = att.text
end)

return {
    battery0 = bat0,
    battery1 = bat1,
}
