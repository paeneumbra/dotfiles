local awful = require("awful")
-- local gears = require("gears")

local powerMenu = {
	{
		"Quit Awesome",
		function()
			awesome.quit()
		end,
	},
	{
		"Poweroff",
		function()
			awful.spawn("poweroff", false)
		end,
	},
	{
		"Reboot",
		function()
			awful.spawn("reboot", false)
		end,
	},
}

-- TODO: It's a global variable, needs refactoring
mainmenu = awful.menu({
	items = {
		{ "Refresh", awesome.restart },
		{ "Terminal", Apps.terminal },
		{ "Browser", Apps.browser },
		{ "File Manager", Apps.fileManager },
		{ "Power Options", powerMenu },
	},
	-- TODO: shape is totally ignored, don't know why.
	-- shape = function(cr, width, height)
	-- 	gears.shape.rounded_rect(cr, width, height, 5)
	-- end,
})
