local _attributes = {}

function _attributes.pick(charging, battery)
	if battery == nil then
		return {
			icon = "<span foreground='" .. Color.yellow .. "'>󰀦</span>",
			widget_color = Color.yellow,
			text = "<span foreground='" .. Color.yellow .. "'>WARN</span>",
		}
	elseif charging then
		return {
			icon = "<span foreground='" .. Color.yellow .. "'>󰢞</span>",
			widget_color = Color.yellow,
			text = "<span foreground='" .. Color.yellow .. "'>" .. battery .. "%</span>",
		}
	elseif battery ~= nil and battery < 20 then
		return {
			icon = "<span foreground='" .. Color.red .. "'>󰁺</span>",
			widget_color = Color.red,
			text = "<span foreground='" .. Color.red .. "'>" .. battery .. "%</span>",
		}
	else
		return {
			icon = "<span foreground='" .. Color.fg .. "'>󰁹</span>",
			widget_color = Color.accent,
			text = "<span foreground='" .. Color.fg .. "'>" .. battery .. "%</span>",
		}
	end
end

return _attributes
