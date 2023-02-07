local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local _widgets = {}

-- Screen of 2560x1440
_widgets.full_screen_height = awful.screen.focused().geometry.height
_widgets.full_screen_width = awful.screen.focused().geometry.width

-- Screen of 2560x1440 in a grid
_widgets.dashboard_height = Xdpi(_widgets.full_screen_height / 10)
_widgets.dashboard_width = Xdpi(_widgets.full_screen_width / 20)

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
            forced_width = _widgets.dashboard_width,
            forced_height = _widgets.dashboard_height,
            widget = wibox.container.margin,
        },
        shape = round_box(),
        bg = Color.bg,
        border_width = Xdpi(5),
        border_color = Color.transparent,
        widget = wibox.container.background,
    }
end

return _widgets
