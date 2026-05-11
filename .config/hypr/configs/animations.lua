hl.config({
	animations = {
		enabled = true,
	},
})

-- Old format: animation = NAME, ENABLED, SPEED, CURVE[, STYLE]
-- Speed is in ds (1 ds = 100ms)
hl.animation({ leaf = "windows", enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4, bezier = "default", style = "slidevert" })
