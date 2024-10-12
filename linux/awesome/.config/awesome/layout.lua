local awful = require "awful"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
}

-- Client rules
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)

client.connect_signal("request::manage", function(c)
    if awesome.startup then
        awful.client.setslave(c)
    end
end)

-- Restore client after tiling layout
tag.connect_signal("property::layout", function(t)
    for k, c in ipairs(t:clients()) do
        if awful.layout.get(mouse.screen) == awful.layout.suit.floating then
            local cgeo = awful.client.property.get(c, "floating_geometry")
            if cgeo then
                c:geometry(awful.client.property.get(c, "floating_geometry"))
            end
        end
    end
end)

-- Floating Drag to the top to maximize
awful.mouse.resize.add_leave_callback(function(c, _, args)
    if (not c.floating) and awful.layout.get(c.screen) ~= awful.layout.suit.floating then
        return
    end

    local coords = mouse.coords()
    local sg = c.screen.geometry
    local snap = awful.mouse.snap.default_distance

    if
        coords.x > snap + sg.x
        and coords.x < sg.x + sg.width - snap
        and coords.y <= snap + sg.y
        and coords.y >= sg.y
    then
        awful.placement.maximize(c, { honor_workarea = true })
    end
end, "mouse.move")

client.connect_signal("manage", function(c)
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    elseif awful.layout.get(mouse.screen) == awful.layout.suit.floating then
        awful.client.property.set(c, "floating_geometry", c:geometry())
    end
end)

client.connect_signal("property::geometry", function(c)
    if awful.layout.get(mouse.screen) == awful.layout.suit.floating then
        awful.client.property.set(c, "floating_geometry", c:geometry())
    end
end)
