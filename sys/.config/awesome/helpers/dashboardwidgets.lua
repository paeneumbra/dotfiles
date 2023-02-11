local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local _widgets = {}

-- Screen of 2560x1440
local full_screen_height = awful.screen.focused().geometry.height
local full_screen_width = awful.screen.focused().geometry.width

-- Screen of 2560x1440 in a grid
local dashboard_height = Xdpi(full_screen_height / 10)
local dashboard_width = Xdpi(full_screen_width / 20)

-- Dashboard widgets
function _widgets.recolor(value, color)
    text = tostring(value)
    return "<span foreground='" .. color .. "'>" .. text .. "</span>"
end

-- Common to progressbar and sliders sizes
local bar_color = Color.cyan
local bar_background = Color.fg
local bar_height = Xdpi(20)
local bar_width = Xdpi(400)

local function bar_shape()
    return function(cr, w, h)
        gears.shape.rounded_bar(cr, w, h)
    end
end

local function handle_shape(radius)
    return function(cr, w, h)
        gears.shape.circle(cr, w, h, radius)
    end
end

local function round_box()
    return function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, 10)
    end
end

function _widgets.wrapping_widget(widget)
    return wibox.widget {
        nil,
        {
            nil,
            widget,
            expand = "none",
            layout = wibox.layout.align.horizontal,
        },
        expand = "none",
        layout = wibox.layout.align.vertical,
    }
end

function _widgets.dashboard_button(icon)
    return wibox.widget({
        markup = _widgets.recolor(icon, Color.accent),
        font = Font(100),
        align = "center",
        widget = wibox.widget.textbox,
    })
end

function _widgets.simple_icon(icon)
    return wibox.widget({
        markup = icon,
        font = Icon_Font,
        align = "center",
        widget = wibox.widget.textbox,
    })
end

function _widgets.simple_text()
    return wibox.widget {
        markup = "󰀦",
        valign = "center",
        halign = "center",
        widget = wibox.widget.textbox,
    }
end

function _widgets.bar_group(icon, widget, label)
    return wibox.widget {
        icon,
        widget,
        label,
        forced_height = bar_height,
        spacing = Xdpi(10),
        layout = wibox.layout.fixed.horizontal,
    }
end

function _widgets.progressbar(max_bar_value)
    return wibox.widget {
        forced_width = bar_width,
        color = bar_color,
        background_color = bar_background,
        shape = bar_shape(),
        bar_shape = bar_shape(),
        max_value = max_bar_value,
        margins = {
            top = Xdpi(1),
            bottom = Xdpi(1),
        },
        widget = wibox.widget.progressbar,
    }
end

function _widgets.slider(max_bar_value)
    return wibox.widget {
        forced_width = bar_width,
        bar_color = bar_background,
        bar_active_color = bar_color,
        bar_shape = bar_shape(),
        bar_margins = Xdpi(5),
        handle_color = bar_color,
        handle_shape = handle_shape(bar_height / 2), -- radius
        shape = bar_shape(),
        minimum = 0,
        maximum = max_bar_value,
        widget = wibox.widget.slider,
    }
end

function _widgets.dashboard_box(widgets)
    return wibox.widget {
        {
            widgets,
            margins = Xdpi(20),
            forced_width = dashboard_width,
            forced_height = dashboard_height,
            widget = wibox.container.margin,
        },
        shape = round_box(),
        bg = Color.bg,
        border_width = Xdpi(5),
        border_color = Color.transparent,
        widget = wibox.container.background,
    }
end

-- Full button
function _widgets.full_button(icon, command)
    local button = _widgets.dashboard_button(icon)
    local box = _widgets.dashboard_box(button)

    box:connect_signal("button::press", function()
        command()
    end)

    box:connect_signal("mouse::enter", function()
        button.markup = _widgets.recolor(icon, Color.fg)
        box.bg = Color.accent
    end)

    box:connect_signal("mouse::leave", function()
        button.markup = _widgets.recolor(icon, Color.accent)
        box.bg = Color.bg
    end)

    return box
end

-- Blurred dashboard
function _widgets.dashboard(layout)
    local dashboard = wibox {
        visible = false,
        ontop = true,
        width = full_screen_width,
        height = full_screen_height,
        y = 0,
        x = 0,
    }

    dashboard:setup {
        widget = layout,
    }

    -- Timer for closing after button press
    dashboard.timer = gears.timer {
        timeout = 0.2,
        single_shot = true,
        callback = function()
            dashboard.visible = not dashboard.visible
        end
    }

    -- Open
    dashboard.open = function()
        dashboard.visible = true
    end

    -- Close
    dashboard.close = function()
        dashboard.visible = false
    end

    -- Toggle
    dashboard.toggle = function()
        if dashboard.visible then
            dashboard.close()
        else
            dashboard.open()
        end
    end

    return dashboard
end

return _widgets
