local variables = require("conf.variables")

hl.monitor({
	output = "eDP-1",
	mode = "2880x1800@120",
	position = "auto",
	scale = "1.5",
})

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

-- Home external monitor
hl.monitor({
	output = "DP-1",
	mode = "2560x1440@180",
	position = "auto-up",
	scale = "1.25",
})

hl.bind(
	"switch:on:Lid Switch",
	hl.dsp.exec_cmd("hyprctl keyword monitor " .. variables.laptop_monitor .. ",disable"),
	{ locked = true }
)

hl.bind(
	"switch:off:Lid Switch",
	hl.dsp.exec_cmd("hyprctl keyword monitor " .. variables.laptop_monitor .. "," .. variables.laptop_mode),
	{ locked = true }
)
