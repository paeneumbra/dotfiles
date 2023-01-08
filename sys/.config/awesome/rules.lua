local awful = require("awful")
local ruled = require("ruled")
-- local helpers = require("helpers")

--- Get screen geometry
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

ruled.client.connect_signal("request::rules", function()
	--- Global
	ruled.client.append_rule({
		id = "global",
		rule = {},
		properties = {
			raise = true,
			size_hints_honor = false,
			honor_workarea = true,
			honor_padding = true,
			screen = awful.screen.focused,
			titlebars_enabled = false,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	})

	--- Tasklist order
	ruled.client.append_rule({
		id = "tasklist_order",
		rule = {},
		properties = {},
		callback = awful.client.setslave,
	})

	--- Titlebar rules
	ruled.client.append_rule({
		id = "titlebars",
		rule_any = {
			class = {
				"Org.gnome.Nautilus",
                "urxvt",
                "alacritty",
			},
		},
		properties = {
			titlebars_enabled = true,
		},
	})

    --- Image viewers
    -- TODO: Uncertain of usefulness
	ruled.client.append_rule({
		rule_any = {
			class = {
				"feh",
			},
		},
		properties = {
			floating = true,
			width = screen_width * 0.8,
			height = screen_height * 0.85,
		},
		callback = function(c)
			awful.placement.centered(c, { honor_padding = true, honor_workarea = true })
		end,
	})
end)
