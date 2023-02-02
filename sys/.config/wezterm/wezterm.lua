local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		{ family = "Iosevka Term", weight = "Medium" },
		"Fira Code",
		"Material Design Icons"
	}),
    font_size = 12,
	color_scheme = "Bright (base16)",

	-- Padding
	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 20,
	},

	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = true,

	-- General
	automatically_reload_config = true,
	window_background_opacity = 0.95,
	window_close_confirmation = "NeverPrompt",
}
