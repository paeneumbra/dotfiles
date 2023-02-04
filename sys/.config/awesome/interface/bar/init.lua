local awful = require("awful")
local wibox = require("wibox")

-- Widgets
local battery = require("interface.bar.battery")
local clock = require("interface.bar.clock")
local displays = require("interface.bar.displays")
local launcher = require("interface.bar.launcher")
local layoutlist = require("interface.bar.layoutlist")
local tags = require("interface.bar.tags")
local task = require("interface.bar.tasks")
local volume = require("interface.bar.volume")
local wifi = require("interface.bar.wifi")
--

-- Separator
local separator = wibox.widget({
    markup = "<span foreground='" .. Color.accent .. "'>󱋱</span>",
    widget = wibox.widget.textbox,
    font = Icon_Font,
})

-- Systray
local systray = wibox.widget({
    {
        {
            {
                wifi,
                volume,
                battery,
                spacing = Xdpi(2),
                wibox.widget.systray,
                layout = wibox.layout.fixed.horizontal,
            },
            margins = { top = Xdpi(1), bottom = Xdpi(1), left = Xdpi(1), right = Xdpi(1) },
            widget = wibox.container.margin,
        },
        widget = wibox.container.background,
    },
    margins = { top = Xdpi(2), bottom = Xdpi(2) },
    widget = wibox.container.margin,
})

-- Menus
local menus = wibox.widget({
    {
        {
            {
                displays,
                launcher,
                spacing = Xdpi(2),
                wibox.widget.systray,
                layout = wibox.layout.fixed.horizontal,
            },
            margins = { top = Xdpi(1), bottom = Xdpi(1), left = Xdpi(1), right = Xdpi(1) },
            widget = wibox.container.margin,
        },
        widget = wibox.container.background,
    },
    margins = { top = Xdpi(2), bottom = Xdpi(2) },
    widget = wibox.container.margin,
})

-- Right
local function right(s)
    return wibox.widget({
        {
            menus,
            separator,
            systray,
            separator,
            clock,
            layoutlist(s),
            layout = wibox.layout.fixed.horizontal,
        },
        margins = { top = Xdpi(2), bottom = Xdpi(2), right = Xdpi(6) },
        widget = wibox.container.margin,
    })
end

-- Left
local function left(s)
    return wibox.widget({
        {
            tags(s),
            spacing = Xdpi(5),
            layout = wibox.layout.fixed.horizontal,
        },
        margins = { top = Xdpi(2), bottom = Xdpi(2), left = Xdpi(6) },
        widget = wibox.container.margin,
    })
end

-- Bar
local function get_bar(s)
    local bar = wibox({
        visible = true,
        ontop = false,
        width = s.geometry.width,
        height = Xdpi(20),
        y = s.geometry.height - Xdpi(20),
        bg = Color.bg,
        type = "dock",
    })

    bar:struts({ bottom = Xdpi(20), top = Xdpi(10), left = Xdpi(10), right = Xdpi(10) })

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
    get_bar(s)
end)
