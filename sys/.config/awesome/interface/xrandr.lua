-- https://awesomewm.org/recipes/xrandr/

-- local gtable = require("gears.table")
local naughty = require("naughty")
local awful = require("awful")
local wibox = require("wibox")

local area_width = awful.screen.focused().tiling_area.width
local area_height = awful.screen.focused().tiling_area.height

local arandr_command = "arandr"

local function active_outputs()
	local outputs = {}
	local xrandr = io.popen("xrandr -q --current")
	if xrandr then
		for line in xrandr:lines() do
			local output = line:match("^([%w-]+) connected ")
			if output then
				outputs[#outputs + 1] = output
			end
		end
		xrandr:close()
	end
	return outputs
end

-- TEMP: Notify
local function xrandrnotify(command)
	naughty.notification({
		title = "Achtung!",
		message = "CMD:" .. command,
	})
end

-- TEMP: Arandr widget
local arandr_widget = wibox.widget({
	widget = wibox.widget.textbox,
	valign = "center",
	halign = "center",
	text = "ARANDR",
	buttons = {
		awful.button({}, 1, nil, function()
			awful.spawn.with_shell(arandr_command)
		end),
	},
})

-- TODO: Replace by active outputs (intertwined with widget display array)
local function temp_layouts()
	local temp_outputs = {
		"eDP1 + DP2",
		"DP2 + eDP1",
		"DP2",
	}

	local active = active_outputs()

	for i, v in ipairs(temp_outputs) do
		if active then
			active[#active + 1] = v
		end
	end

	return active
end

local function display_widgets()
	local widgets = {}

	for i, v in ipairs(temp_layouts()) do
		local wid = wibox.widget({
			text = v,
			widget = wibox.widget.textbox,
			valign = "center",
			halign = "center",
			buttons = {
				awful.button({}, 1, nil, function()
					xrandrnotify(v)
				end),
			},
		})
		table.insert(widgets, wid)
	end

	table.insert(widgets, arandr_widget)

	return widgets
end

local displays = awful.popup({
	widget = {
		{
            -- TODO: Take a look at gears.table
			-- display_widgets(),

			display_widgets()[1],
			display_widgets()[2],
			display_widgets()[3],
			display_widgets()[4],
			display_widgets()[5],
			-- {
			-- 	text = active_outputs()[1],
			-- 	widget = wibox.widget.textbox,
			-- 	valign = "center",
			-- 	halign = "center",
			-- },
			-- display_buttons,
			layout = wibox.layout.flex.horizontal,
		},
		margins = Dimensions.border,
		widget = wibox.container.margin,
	},
	placement = awful.placement.centered,
	border_color = Color.accent,
	border_width = Dimensions.border,
	minimum_width = area_width * 0.50,
	minimum_height = area_height * 0.33,
	ontop = true,
	visible = false,
})

awesome.connect_signal("displays::toggle", function()
	displays.visible = not displays.visible
end)

-- -- A path to a fancy icon
-- local icon_path = ""
--
-- -- Get active outputs
-- local function outputs()
-- 	local outputs = {}
-- 	local xrandr = io.popen("xrandr -q --current")
--
-- 	if xrandr then
-- 		for line in xrandr:lines() do
-- 			local output = line:match("^([%w-]+) connected ")
-- 			if output then
-- 				outputs[#outputs + 1] = output
-- 			end
-- 		end
-- 		xrandr:close()
-- 	end
--
-- 	return outputs
-- end
--
-- local function arrange(out)
-- 	-- We need to enumerate all permutations of horizontal outputs.
--
-- 	local choices = {}
-- 	local previous = { {} }
-- 	for i = 1, #out do
-- 		-- Find all permutation of length `i`: we take the permutation
-- 		-- of length `i-1` and for each of them, we create new
-- 		-- permutations by adding each output at the end of it if it is
-- 		-- not already present.
-- 		local new = {}
-- 		for _, p in pairs(previous) do
-- 			for _, o in pairs(out) do
-- 				if not gtable.hasitem(p, o) then
-- 					new[#new + 1] = gtable.join(p, { o })
-- 				end
-- 			end
-- 		end
-- 		choices = gtable.join(choices, new)
-- 		previous = new
-- 	end
--
-- 	return choices
-- end
--
-- -- Build available choices
-- local function menu()
-- 	local menu = {}
-- 	local out = outputs()
-- 	local choices = arrange(out)
--
-- 	for _, choice in pairs(choices) do
-- 		local cmd = "xrandr"
-- 		-- Enabled outputs
-- 		for i, o in pairs(choice) do
-- 			cmd = cmd .. " --output " .. o .. " --auto"
-- 			if i > 1 then
-- 				cmd = cmd .. " --right-of " .. choice[i - 1]
-- 			end
-- 		end
-- 		-- Disabled outputs
-- 		for _, o in pairs(out) do
-- 			if not gtable.hasitem(choice, o) then
-- 				cmd = cmd .. " --output " .. o .. " --off"
-- 			end
-- 		end
--
-- 		local label = ""
-- 		if #choice == 1 then
-- 			label = 'Only <span weight="bold">' .. choice[1] .. "</span>"
-- 		else
-- 			for i, o in pairs(choice) do
-- 				if i > 1 then
-- 					label = label .. " + "
-- 				end
-- 				label = label .. '<span weight="bold">' .. o .. "</span>"
-- 			end
-- 		end
--
-- 		menu[#menu + 1] = { label, cmd }
-- 	end
--
-- 	return menu
-- end
--
-- -- Display xrandr notifications from choices
-- local state = { cid = nil }
--
-- local function naughty_destroy_callback(reason)
-- 	if
-- 		reason == naughty.notificationClosedReason.expired
-- 		or reason == naughty.notificationClosedReason.dismissedByUser
-- 	then
-- 		local action = state.index and state.menu[state.index - 1][2]
-- 		if action then
-- 			local result = awful.spawn.with_shell(action)
-- 			state.index = nil
-- 			naughty.notify({
-- 				text = "Action: " .. action .. " Result: " .. result,
-- 				timeout = 5,
-- 			})
--         else
--             naughty.notify({
--                 text = "Action was null",
--                 timeout = 5,
--             })
-- 		end
-- 	end
-- end
--
-- local function xrandr()
-- 	-- Build the list of choices
-- 	if not state.index then
-- 		state.menu = menu()
-- 		state.index = 1
-- 	end
--
-- 	-- Select one and display the appropriate notification
-- 	local label, action
-- 	local next = state.menu[state.index]
-- 	state.index = state.index + 1
--
-- 	if not next then
-- 		label = "Keep the current configuration"
-- 		state.index = nil
-- 	else
-- 		label, action = next[1], next[2]
-- 	end
-- 	state.cid = naughty.notify({
-- 		text = label,
-- 		icon = icon_path,
-- 		timeout = 4,
-- 		screen = mouse.screen,
-- 		replaces_id = state.cid,
-- 		destroy = naughty_destroy_callback,
-- 	}).id
-- end
--
-- return {
-- 	outputs = outputs,
-- 	arrange = arrange,
-- 	menu = menu,
-- 	xrandr = xrandr,
-- }
