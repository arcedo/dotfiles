--local variables = require("conf.variables")

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
	render = {
		cm_auto_hdr = 0,
	},
})

-- Home external monitor
hl.monitor({
	output = "DP-1",
	mode = "2560x1440@180",
	position = "auto-up",
	scale = "1.25",
	bitdepth = 10,
})

hl.monitor({
	output = "DP-2",
	mode = "2560x1440@180",
	position = "auto-up",
	scale = "1.25",
	bitdepth = 10,
})
