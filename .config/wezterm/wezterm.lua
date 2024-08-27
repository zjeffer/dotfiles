local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.enable_wayland = false
config.color_scheme = "nord"
config.font = wezterm.font_with_fallback({
	"FiraMono Nerd Font",
	"JetBrainsMono NF",
	"Cascadia Code",
	"JetBrains Mono",
	"PingFang SC",
})
config.font_size = 11.0

config.keys = {}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.line_height = 0.95

-- Tab switching with ALT+number
config.keys = {
	{
		key = "[",
		mods = "ALT",
		action = wezterm.action.MoveTabRelative(-1),
	},
	{
		key = "]",
		mods = "ALT",
		action = wezterm.action.MoveTabRelative(1),
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make task numbers clickable
-- the first matched regex group is captured in $1.
table.insert(config.hyperlink_rules, {
	regex = [[\b(PRJ\d+-\d+)\b]],
	format = "https://barco-nv.atlassian.net/browse/$1",
})

return config

