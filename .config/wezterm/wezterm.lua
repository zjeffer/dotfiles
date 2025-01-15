-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = 'nord'
config.default_prog = { '/usr/bin/fish', '-l' }
config.enable_wayland = true

-- and finally, return the configuration to wezterm
return config

