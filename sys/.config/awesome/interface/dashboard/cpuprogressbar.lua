local widgets = require("helpers.dashboardwidgets")

-- CPU Temperature
local cpu_icon = widgets.simple_icon("󰔏")
local cpu_progressbar = widgets.progressbar(100) --Unknown max, however, 100 = bad
local cpu_text = widgets.simple_text()
local cpu = widgets.bar_group(cpu_icon, cpu_progressbar, cpu_text)

local function update(cpu_temperature)
    if cpu_temperature == nil or cpu_temperature == 0 then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰀦</span>",
            widget_color = Color.red,
            text = "<span foreground='" .. Color.red .. "'>WARN</span>",
        }
    elseif cpu_temperature > 90 then
        return {
            icon = "<span foreground='" .. Color.red .. "'>󰈸</span>",
            widget_color = Color.red,
            text = "<span foreground='" .. Color.red .. "'>" .. cpu_temperature .. "°C</span>",
        }
    elseif cpu_temperature > 70 then
        return {
            icon = "<span foreground='" .. Color.yellow .. "'>󰔏</span>",
            widget_color = Color.yellow,
            text = "<span foreground='" .. Color.yellow .. "'>" .. cpu_temperature .. "°C</span>",
        }
    else
        return {
            icon = "<span foreground='" .. Color.fg .. "'>󰔏</span>",
            widget_color = Color.accent,
            text = "<span foreground='" .. Color.fg .. "'>" .. cpu_temperature .. "°C</span>",
        }
    end
end

awesome.connect_signal("signal::cpu", function(cpu_temperature)
    att = update(cpu_temperature)
    cpu_progressbar.value = cpu_temperature
    cpu_icon.markup = att.icon
    cpu_progressbar.color = att.widget_color
    cpu_text.markup = att.text
end)

return cpu
