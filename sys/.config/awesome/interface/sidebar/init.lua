local gears = require("gears")
local wibox = require("wibox")

local helper = require("helpers.workspace")

local calendar_widget = require("interface.sidebar.calendar")
local profile_widget = require("interface.sidebar.profile")
local progressbar_widget = require("interface.sidebar.progressbars")
local sliders_widget = require("interface.sidebar.sliders")
local uptime_widget = require("interface.sidebar.uptime")

local width = helper.workspace_width() * 0.25
local height = helper.workspace_height()

local function round_box(radius)
    return function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, radius)
    end
end

local function box_widget(widgets, box_width, box_height)
    return wibox.widget {
        {
            {
                widgets,
                margins = Xdpi(20),
                widget = wibox.container.margin,
            },
            forced_width = Xdpi(box_width),
            --forced_height = Xdpi(box_height), -- ignored for now
            shape = round_box(20),
            bg = Color.gray,
            widget = wibox.container.background,
        },
        widget = wibox.container.margin,
    }
end


-- Combine widgets
local profile = box_widget(profile_widget, width, height * 0.10)
local uptime = box_widget(uptime_widget, width, height * 0.025)
local calendar = box_widget(calendar_widget, width, height * 0.20)
local sliders = box_widget(sliders_widget, width, height * 0.10)
local progressbar = box_widget(progressbar_widget, width, height * 0.10)

-- Sidebar
local sidebar = wibox {
    visible = false,
    ontop = true,
    width = width,
    height = height,
    y = helper.workspace_y(),
    x = helper.workspace_x(),
    bg = Color.bg,
    border_width = Xdpi(4),
    border_color = Color.accent,
}

-- Sidebar widget setup
sidebar:setup {
    {
        profile,
        calendar,
        progressbar,
        sliders,
        uptime,
        spacing = Xdpi(10),
        layout = wibox.layout.fixed.vertical,
    },
    margins = { top = Xdpi(40), bottom = Xdpi(40), left = Xdpi(40), right = Xdpi(40) },
    widget = wibox.container.margin,
}

-- Timer for closing the sidebar
sidebar.timer = gears.timer {
    timeout = 0.2,
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
