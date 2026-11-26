local variables = require("conf.variables")

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,
		border_size = 2,

		col = {
			active_border = variables.active_border_color,
			inactive_border = variables.inactive_border_color,
		},

		resize_on_border = false,
		allow_tearing = false,

		layout = "dwindle",
	},

	dwindle = {
		preserve_split = true,
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = variables.shadow_color,
		},

		blur = {
			enabled = true,

			brightness = 1.5,
			contrast = 1,
			noise = 0.75,
			vibrancy = 0.3,
			vibrancy_darkness = 0.3,

			passes = 3,
			size = 5,

			special = false,
		},
	},

	animations = {
		enabled = true,
	},
})

-- Animation from:
-- https://github.com/HyDE-Project/HyDE/blob/master/Configs/.local/share/hypr/lua/animations/optimized.lua

local prod = function(ds)
	return ds * 0.5
end

hl.curve("quart", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })

hl.animation({ leaf = "windowsIn", enabled = true, speed = prod(6), bezier = "quart", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = prod(6), bezier = "quart", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = prod(6), bezier = "quart", style = "slide" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "fadeShadow", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "fadePopups", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "fadeDpms", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "windows", enabled = true, speed = prod(6), bezier = "quart", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "borderangle", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "fade", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "workspaces", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "fadePopupsIn", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "fadePopupsOut", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = prod(6), bezier = "quart" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = prod(6), bezier = "quart" })
