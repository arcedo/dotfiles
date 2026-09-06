hl.window_rule({
	name = "float-zen-profile",
	match = {
		class = "zen",
		title = "Zen - Choose a profile",
	},

	float = true,
})

-- Ignore maximize requests from apps
hl.window_rule({
	name = "suppress-maximize",
	match = {
		class = ".*",
	},

	suppress_event = "maximize",
})

-- Fix dragging issues for XWayland windows
hl.window_rule({
	name = "xwayland-dragging-fix",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "translucent_apps",
	match = {
		class = "kitty|discord|waybar|rofi|Spotify",
	},
	opacity = 0.8,
})
