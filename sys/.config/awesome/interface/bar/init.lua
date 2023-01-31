local awful = require("awful")
local wibox = require("wibox")

-- Widgets
local battery = require("interface.bar.battery")
local clock = require("interface.bar.clock")
local launcher = require("interface.bar.launcher")
local layoutlist = require("interface.bar.layoutlist")
local sidebar = require("interface.bar.sidebar")
local tags = require("interface.bar.tags")
local task = require("interface.bar.tasks")
local volume = require("interface.bar.volume")
local wifi = require("interface.bar.wifi")
--

-- Separator
local separator = wibox.widget({
    markup = "<span foreground='" .. Color.accent .. "'>󱋱</span>",
    widget = wibox.widget.textbox,
    font = Bold_Font,
})

-- Systray
local systray = wibox.widget({
    {
        {
            {
                wifi,
                volume,
                battery,
                spacing = xdpi(2),
                wibox.widget.systray,
                layout = wibox.layout.fixed.horizontal,
            },
            margins = { top = xdpi(1), bottom = xdpi(1), left = xdpi(1), right = xdpi(1) },
            widget = wibox.container.margin,
        },
        widget = wibox.container.background,
    },
    margins = { top = xdpi(2), bottom = xdpi(2) },
    widget = wibox.container.margin,
})

-- Menus
local menus = wibox.widget({
    {
        {
            {
                launcher,
                sidebar,
                spacing = xdpi(2),
                wibox.widget.systray,
                layout = wibox.layout.fixed.horizontal,
            },
            margins = { top = xdpi(1), bottom = xdpi(1), left = xdpi(1), right = xdpi(1) },
            widget = wibox.container.margin,
        },
        widget = wibox.container.background,
    },
    margins = { top = xdpi(2), bottom = xdpi(2) },
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
        margins = { top = xdpi(2), bottom = xdpi(2), right = xdpi(6) },
        widget = wibox.container.margin,
    })
end

-- Left
local function left(s)
    return wibox.widget({
        {
            tags(s),
            spacing = xdpi(5),
            layout = wibox.layout.fixed.horizontal,
        },
        margins = { top = xdpi(2), bottom = xdpi(2), left = xdpi(6) },
        widget = wibox.container.margin,
    })
end

-- Bar
local function get_bar(s)
    local bar = wibox({
        visible = true,
        ontop = false,
        width = s.geometry.width,
        height = xdpi(20),
        y = s.geometry.height - xdpi(20),
        bg = Color.bg,
        type = "dock",
    })

    bar:struts({ bottom = xdpi(20), top = xdpi(10), left = xdpi(10), right = xdpi(10) })

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
