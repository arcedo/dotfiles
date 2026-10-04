--local variables = require("conf.variables")

hl.on("hyprland.start", function()
	--hl.exec_cmd(variables.terminal)
	hl.exec_cmd("nm-applet & blueman-applet")
	hl.exec_cmd("waybar & hyprpaper & hypridle")
	hl.exec_cmd("while true; do ~/.config/hypr/scripts/battery-check.sh; sleep 30; done") -- find an alternative please...
end)
