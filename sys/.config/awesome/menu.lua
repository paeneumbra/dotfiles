local awful = require("awful")
local gears = require("gears")

-- local screenshot = require("lib.screenshot")

-- TODO: Introduce maim
-- screenshotMenu = {
-- 	{
-- 		"Screenshot Now",
-- 		function()
-- 			screenshot.now()
-- 		end,
-- 	},
-- 	{
-- 		"Screenshot Later",
-- 		function()
-- 			screenshot.later()
-- 		end,
-- 	},
-- }

powerMenu = {
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
	{
		"Quit Awesome",
        function ()
            awesome.quit()
        end
	},
}

mainmenu = awful.menu({
	items = {
		{ "Refresh", awesome.restart },
		{ "Terminal", apps.terminal },
		{ "Browser", apps.browser },
		{ "File Manager", apps.fileManager },
		-- { "Screenshot", screenshotMenu },
		{ "Power Options", powerMenu },
	},
})

mainmenu.wibox.shape = function(cr, w, h)
	gears.shape.rounded_rect(cr, w, h, 8)
end
