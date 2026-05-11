hl.config({
	input = {
		kb_layout          = "us",
		kb_variant         = "",
		kb_model           = "",
		kb_options         = "",
		kb_rules           = "",

		follow_mouse       = 1,
		sensitivity        = 0,

		numlock_by_default = true,
		repeat_rate        = 50,
		repeat_delay       = 200,
		accel_profile      = "flat",

		touchpad           = {
			clickfinger_behavior    = true,
			scroll_factor           = 0.25,
			middle_button_emulation = true,
			tap_and_drag            = true,
			natural_scroll          = true,
		},
	},

	-- cursor.default_monitor is set in general.lua
	cursor = {
		no_hardware_cursors = 1,
	},
})

-- Per-device config
hl.device({
	name           = "elan06fa:00-04f3:31ad-touchpad",
	sensitivity    = 0.4,
	accel_profile  = "flat",
	natural_scroll = true,
})
