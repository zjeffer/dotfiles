hl.config({
	general = {
		gaps_in          = 5,
		gaps_out         = 10,

		border_size      = 4,

		col              = {
			active_border   = "rgba(5e81acff)",
			inactive_border = "rgba(00000000)",
		},

		layout           = "dwindle",

		resize_on_border = true,
	},

	dwindle = {
		preserve_split = true,
	},

	misc = {
		vrr                        = 0,
		focus_on_activate          = true,
		force_default_wallpaper    = 0,
		initial_workspace_tracking = 0,
		enable_anr_dialog          = false,
	},

	cursor = {
		default_monitor = "DP-1",
	},

	debug = {
		overlay        = false,
		disable_logs   = false,
		disable_time   = false,
		error_limit    = 2,
		error_position = 2, -- bottom
	},

	opengl = {
		nvidia_anti_flicker = true,
	},

	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},
})


-- unscale XWayland
hl.config({
  xwayland = {
    force_zero_scaling = true
  }
})

