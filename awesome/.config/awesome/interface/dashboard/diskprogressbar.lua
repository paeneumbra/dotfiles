local widgets = require "helpers.dashboardwidgets"

-- Disk
local disk_icon = widgets.simple_icon ""
local disk_progressbar = widgets.progressbar(100)
local disk_text = widgets.simple_text()
local disk = widgets.bar_group(disk_icon, disk_progressbar, disk_text)

local function update(disk_usage)
    if disk_usage == nil or disk_usage == 0 then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰀦</span>",
            widget_color = Color.red,
            text = "<span foreground='" .. Color.red .. "'>WARN</span>",
        }
    elseif disk_usage > 75 then
        return {
            icon = "<span foreground='" .. Color.red .. "'></span>",
            widget_color = Color.red,
            text = "<span foreground='" .. Color.red .. "'>" .. disk_usage .. "%</span>",
        }
    else
        return {
            icon = "<span foreground='" .. Color.fg .. "'></span>",
            widget_color = Color.accent,
            text = "<span foreground='" .. Color.fg .. "'>" .. disk_usage .. "%</span>",
        }
    end
end

awesome.connect_signal("signal::disk", function(disk_capacity)
    att = update(disk_capacity)
    disk_progressbar.value = disk_capacity
    disk_icon.markup = att.icon
    disk_progressbar.color = att.widget_color
    disk_text.markup = att.text
end)

return disk
