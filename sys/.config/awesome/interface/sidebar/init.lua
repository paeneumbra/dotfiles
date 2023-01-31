local gears = require("gears")
local wibox = require("wibox")

local helper = require("helpers.workspace")

local sliders_widget = require("interface.sidebar.sliders")

local width = helper.workspace_width() * 0.25
local height = helper.workspace_height()

local function round_widget(radius)
    return function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, radius)
    end
end

local function box_widget(widgets, box_width, box_height)
    return wibox.widget {
        {
            {
                widgets,
                margins = xdpi(10),
                widget = wibox.container.margin,
            },
            forced_width = xdpi(box_width),
            forced_height = xdpi(box_height),
            shape = round_widget(10),
            bg = Color.accent,
            widget = wibox.container.background,
        },
        margins = { left = xdpi(20), right = xdpi(20) },
        widget = wibox.container.margin,
    }
end


-- Combine some widgets
local sliders = box_widget(sliders_widget, 380, 210)

-- Sidebar
local sidebar = wibox {
    visible = false,
    ontop = true,
    width = width,
    height = height,
    y = helper.workspace_y(),
    x = helper.workspace_x(),
    bg = Color.bg,
    border_width = xdpi(2),
    border_color = Color.accent,
}

-- Sidebar widget setup
sidebar:setup {
    {
        sliders,
        spacing = xdpi(20),
        layout = wibox.layout.fixed.vertical,
    },
    margins = { top = xdpi(20), bottom = xdpi(20) },
    widget = wibox.container.margin,
}

-- Sidebar timer is not working
sidebar.timer = gears.timer {
    timeout = 0.5,
    single_shot = true,
    callback = function()
        sidebar.visible = not sidebar.visible
    end
}

-- Toggle function
sidebar.toggle = function()
    if sidebar.visible then
        sidebar.timer:start()
    else
        sidebar.visible = not sidebar.visible
    end
end

awesome.connect_signal("sidebar::toggle", function()
    sidebar.toggle()
end)

return sidebar
