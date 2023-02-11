local wibox = require("wibox")

local widgets = require("helpers.dashboardwidgets")

local batteries = require("interface.dashboard.batteryprogressbar")
local cpu = require("interface.dashboard.cpuprogressbar")
local disk = require("interface.dashboard.diskprogressbar")
local wifi = require("interface.dashboard.wifiprogressbar")

-- Batteries
local bat0 = batteries.battery0
local bat1 = batteries.battery1

return widgets.wrapping_widget(wibox.widget {
    cpu,
    bat0,
    bat1,
    disk,
    wifi,
    spacing = Xdpi(30),
    layout = wibox.layout.fixed.vertical,
})
