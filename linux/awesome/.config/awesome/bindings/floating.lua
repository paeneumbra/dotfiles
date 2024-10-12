local awful = require "awful"

local useless_gap = Dimensions.useless_gap * 2
local border = Dimensions.border * 2
local combined_gap = useless_gap + border

local function screen_workarea_width(c)
    return c.screen.workarea.width - useless_gap * 4
end

local function screen_workarea_height(c)
    return c.screen.workarea.height - useless_gap * 4
end

local function screen_workarea_x(c)
    return c.screen.workarea.x + useless_gap * 2
end
local function screen_workarea_y(c)
    return c.screen.workarea.y + useless_gap * 2
end

local function cycle_width(c, screen_width)
    -- Get the current width of the client
    local current_width = c:geometry().width

    -- Define the width values to cycle through, adjusted for the useless_gap and border
    local widths = {
        (screen_width - 2 * combined_gap) / 2,
        (screen_width - 2 * combined_gap) / 3,
        (screen_width - 2 * combined_gap) / 4,
    }

    -- Find the current index of the width, if it's not in the list, default to first
    local index = 1
    for i, w in ipairs(widths) do
        if math.abs(current_width - w) < 10 then
            index = i
            break
        end
    end

    -- Cycle to the next width
    index = index % #widths + 1

    c:geometry { width = widths[index], height = screen_workarea_height(c) }
end

local function snap_to_right(c, screen_width)
    -- Cycle the client's width between half, third, and quarter of the screen
    cycle_width(c, screen_width)

    -- Get the updated width after cycling
    local new_width = c:geometry().width
    local new_x = screen_workarea_x(c) + screen_workarea_width(c) - new_width

    c:geometry {
        x = new_x,
        y = screen_workarea_y(c),
        width = new_width - border, -- Resize to adjust for the gap on the right side
        height = screen_workarea_height(c),
    }
end

local function snap_to_left(c, screen_width)
    -- Get the client's new width (cycled)
    cycle_width(c, screen_width)

    local new_x = screen_workarea_x(c)

    c:geometry {
        x = new_x,
        y = screen_workarea_y(c),
        width = c:geometry().width,
        height = screen_workarea_height(c),
    }
end

local function center_client(c)
    local screen_width = screen_workarea_width(c)
    local screen_height = screen_workarea_height(c)

    -- Cycle the client's width between half, third, and quarter of the screen
    cycle_width(c, screen_width)

    local new_width = c:geometry().width
    -- Center the client horizontally by adjusting the x position
    local new_x = screen_workarea_x(c) + (screen_width - new_width) / 2

    c:geometry {
        x = new_x,
        y = screen_workarea_y(c),
        width = new_width,
        height = screen_height,
    }
end

-- Floating layout bindings
awful.keyboard.append_global_keybindings {

    awful.key({ MetaKey, ControlKey }, "k", function()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        if current_layout == "floating" or c.floating == true then
            awful.placement.top_left(c, { honor_workarea = true })
            c:geometry {
                x = screen_workarea_x(c),
                y = screen_workarea_y(c),
                width = (screen_workarea_width(c) / 2) - border,
                height = (screen_workarea_height(c) / 2) - border,
            }
        end
    end, { description = " Floating: snap to top-left corner", group = "floating-layout" }),

    awful.key({ MetaKey, ControlKey }, "j", function()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        if current_layout == "floating" or c.floating == true then
            awful.placement.bottom_left(c, { honor_workarea = true })
            c:geometry {
                x = screen_workarea_x(c),
                width = (screen_workarea_width(c) / 2) - border,
                height = (screen_workarea_height(c) / 2) - combined_gap, -- Resize to adjust for the gap at the bottom
            }
        end
    end, { description = " Floating: snap to bottom-left corner", group = "floating-layout" }),

    awful.key({ MetaKey, ControlKey }, "h", function()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        if current_layout == "floating" or c.floating == true then
            awful.placement.left(c, { honor_workarea = true })
            snap_to_left(c, screen_workarea_width(c))
        end
    end, { description = " Floating: snap to left (half, third, quarter)", group = "floating-layout" }),

    awful.key({ MetaKey, ControlKey }, "l", function()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        if current_layout == "floating" or c.floating == true then
            awful.placement.right(c, { honor_workarea = true })
            snap_to_right(c, screen_workarea_width(c))
        end
    end, { description = " Floating: snap to right (half, third, quarter)", group = "floating-layout" }),

    awful.key({ MetaKey, ControlKey }, "c", function()
        local current_layout = awful.layout.getname(awful.layout.get(awful.screen.focused()))
        local c = client.focus
        if current_layout == "floating" or c.floating == true then
            center_client(c)
        end
    end, { description = " Floating: center client (half, third, quarter)", group = "floating-layout" }),
}
