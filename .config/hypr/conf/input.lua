hl.config({
	input = {
		kb_layout = "es",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,
		sensitivity = 0,
		natural_scroll = false,

		touchpad = {
			scroll_factor = 1,
			natural_scroll = true,
			tap_and_drag = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "apple-inc.-magic-trackpad-1",
	accel_profile = "flat",
	sensitivity = 0,
	scroll_factor = 1,
})
