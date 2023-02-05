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
                spacing = Xdpi(4),
                wibox.widget.systray,
                layout = wibox.layout.fixed.horizontal,
            },
            margins = { top = Xdpi(2), bottom = Xdpi(2), left = Xdpi(2), right = Xdpi(2) },
            widget = wibox.container.margin,
        },
        widget = wibox.container.background,
    },
    margins = { top = Xdpi(4), bottom = Xdpi(4) },
    widget = wibox.container.margin,
})

-- Menus
local menus = wibox.widget({
    {
        {
            {
                displays,
                launcher,
                spacing = Xdpi(4),
                wibox.widget.systray,
                layout = wibox.layout.fixed.horizontal,
            },
            margins = { top = Xdpi(2), bottom = Xdpi(2), left = Xdpi(1), right = Xdpi(2) },
            widget = wibox.container.margin,
        },
        widget = wibox.container.background,
    },
    margins = { top = Xdpi(4), bottom = Xdpi(4) },
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
            spacing = Xdpi(1),
            layout = wibox.layout.fixed.horizontal,
        },
        margins = { top = Xdpi(4), bottom = Xdpi(4), right = Xdpi(10) },
        widget = wibox.container.margin,
    })
end

-- Left
local function left(s)
    return wibox.widget({
        {
            tags(s),
            spacing = Xdpi(10),
            layout = wibox.layout.fixed.horizontal,
        },
        margins = { top = Xdpi(4), bottom = Xdpi(4), left = Xdpi(10) },
        widget = wibox.container.margin,
    })
end

-- Bar
local function get_bar(s)
    local bar = wibox({
        visible = true,
        ontop = false,
        width = s.geometry.width,
        height = Xdpi(40),
        y = s.geometry.height - Xdpi(40),
        bg = Color.bg,
        type = "dock",
    })

    bar:struts({ bottom = Xdpi(40), top = Xdpi(20), left = Xdpi(20), right = Xdpi(20) })

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
