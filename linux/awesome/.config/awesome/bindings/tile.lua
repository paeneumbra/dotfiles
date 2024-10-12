local awful = require "awful"

-- Tile layout bindings
awful.keyboard.append_global_keybindings {
    awful.key({ MetaKey, ShiftKey }, "j", function()
        awful.client.swap.byidx(1)
    end, { description = "Tile: swap with next client by index", group = "tile-layout" }),
    awful.key({ MetaKey, ShiftKey }, "k", function()
        awful.client.swap.byidx(-1)
    end, { description = "Tile: swap with previous client by index", group = "tile-layout" }),

    awful.key({ MetaKey, AltKey }, "h", function()
        awful.tag.incnmaster(1, nil, true)
    end, { description = "Tile: rotate positioning left", group = "tile-layout" }),
    awful.key({ MetaKey, AltKey }, "l", function()
        awful.tag.incnmaster(-1, nil, true)
    end, { description = "Tile: rotate positioning right", group = "tile-layout" }),
    awful.key({ MetaKey, AltKey }, "k", function()
        awful.tag.incmwfact(-0.05)
    end, { description = "Tile: decrease master width factor", group = "tile-layout" }),
    awful.key({ MetaKey, AltKey }, "j", function()
        awful.tag.incmwfact(0.05)
    end, { description = "Tile: increase master width factor", group = "tile-layout" }),
}

-- TODO: Revisit client.connect_signal("request::default_keybindings", function()
-- Client bindings
client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings {
        awful.key(
            { MetaKey, ControlKey },
            "space",
            awful.client.floating.toggle,
            { description = "Tile: toggle floating", group = "tile-layout" }
        ),
    }
end)
