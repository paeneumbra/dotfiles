local awful = require("awful")
local wibox = require("wibox")

-- Helpers
local widgets = require("helpers.wibar_widgets")

-- Widgets
local battery = require("interface.bar.battery")
local date = require("interface.bar.date")
local dashboard = require("interface.bar.dashboard")
local displays = require("interface.bar.displays")
local rofi_launcher = require("interface.bar.launcher")
local layoutlist = require("interface.bar.layoutlist")
local tags = require("interface.bar.tags")
local task = require("interface.bar.tasks")
local volume = require("interface.bar.volume")
local wifi = require("interface.bar.wifi")

-- Separator
local separator = widgets.wibar_icon("|", Color.accent)
local spacer = widgets.wibar_icon(" ", Color.transparent)

-- Margins
local systray_margin = { top = Xdpi(5), bottom = Xdpi(5) }
local systray_spacing = Xdpi(5)

-- Systray
local systray = wibox.widget({
    {
        rofi_launcher,
        separator,
        dashboard,
        separator,
        displays,
        wifi,
        volume,
        battery,
        separator,
        date,
        separator,
        spacing = systray_spacing,
        wibox.widget.systray,
        layout = wibox.layout.fixed.horizontal,
    },
    margins = systray_margin,
    widget = wibox.container.margin,
})

-- Right
local function right(s)
    return wibox.widget({
        {
            systray,
            layoutlist(s),
            spacer,
            spacing = systray_spacing,
            layout = wibox.layout.fixed.horizontal,
        },
        margins = systray_margin,
        widget = wibox.container.margin,
    })
end

-- Left
local function left(s)
    return wibox.widget({
        {
            spacer,
            tags(s),
            spacing = systray_spacing,
            layout = wibox.layout.fixed.horizontal,
        },
        margins = systray_margin,
        widget = wibox.container.margin,
    })
end

-- Bar
local function set_bar(s)
    local bar = awful.wibar {
        position = "bottom",
        screen = s,
        bg = Color.bg,
    }

    bar:setup({
        left(s),
        {
            nil,
            task(s),
            expand = "none",
            layout = wibox.layout.align.horizontal,
        },
        right(s),
        layout = wibox.layout.align.horizontal,
    })
end

awful.screen.connect_for_each_screen(function(s)
    set_bar(s)
end)
