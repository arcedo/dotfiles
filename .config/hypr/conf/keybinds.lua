local variables = require("conf.variables")

local mainMod = variables.mainMod
local terminal = variables.terminal
local menu = variables.menu
local browser = variables.browser
local filemanager = variables.filemanager
local left = { x = -10, y = 0, relative = true }
local down = { x = 0, y = 10, relative = true }
local up = { x = 0, y = -10, relative = true }
local right = { x = 10, y = 0, relative = true }

-- Restart Hyprland
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Restart Waybar
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("pkill waybar; waybar &"))

-- Restart hyprpaper
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("pkill hyprpaper; hyprpaper &"))

-- Applications
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(filemanager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd("bash ~/shared/scripts/power-menu/powermenu.sh"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("bash ~/shared/scripts/rofi-bluetooth.sh"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("bash ~/shared/scripts/network/rofi-network-manager.sh"))

-- Launcher / menu binds
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.exec_cmd("rofi -show run"))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("rofi -show window"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("rofi -show filebrowser"))

-- Window management
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + C", hl.dsp.window.center())
hl.bind(mainMod .. " + P", hl.dsp.window.pin())
hl.bind(mainMod .. " + V", function()
	local layout = hl.get_config("general.layout")
	if layout == "dwindle" then
		hl.dispatch(hl.dsp.layout("togglesplit"))
	end
end, { description = "Toggle split direction" })
--hl.bind(mainMod .. " + V", hl.dsp.layout("togglesplit"))

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move focused window
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Resize windows
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize(left))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize(right))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize(up))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize(down))

-- Workspaces
for i = 1, 10 do
	local key = i % 10

	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))

	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move / resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%+"), { locked = true, repeating = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%-"), { locked = true, repeating = true })

-- Media keys
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Toggle laptop power button LED
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("sudo /usr/local/bin/toggle-power-led"))

-- Screenshot
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("flameshot gui"))
