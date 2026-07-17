hl.config({
    plugin = {
        -- overview = {
        --     workspaceActiveBorder   = "rgba(5e81acff)",
        --     workspaceInactiveBorder = "rgba(00000000)",
        --     dragAlpha               = 0.7,
        --     disableBlur             = true,
        --     overrideGaps            = false,
        --     centerAligned           = true,
        --     showNewWorkspace        = false,
        -- },
    },
})

package.path = package.path .. ";./?/init.lua"
local smw = require("plugins.split-monitor-workspaces")

smw.setup({
    -- Number of workspaces assigned to each monitor.
    workspace_count = 5,

    -- Monitor priority order — determines which monitor gets the lowest workspace IDs.
    -- Monitors not listed are assigned priorities in the order Hyprland reports them.
    monitor_priority = { "DP-1", "DP-2" },

    -- Per-monitor workspace count overrides (optional).
    -- max_workspaces = { ["DP-2"] = 3 },

    -- Keep the currently focused workspace when the config is reloaded.
    keep_focused = true,

    -- Show a Hyprland notification on init and remap.
    enable_notifications = false,

    -- Keep workspaces alive even when empty.
    enable_persistent_workspaces = true,

    -- Wrap around when cycling past the first or last workspace.
    enable_wrapping = true,

    -- Switch all monitors simultaneously when changing workspaces (Gnome-style).
    link_monitors = false,
})

local mainMod = "SUPER"
for i = 1, smw.get_amount_of_workspaces() do
    local n = tostring(i)
    if n == "10" then n = "0" end                                          -- Optional if you configured 10 workspaces: bind workspace 10 to SUPER + 0
    hl.bind(mainMod .. " +" .. n, smw.workspace(n))                        -- Switch to workspace N.
    hl.bind(mainMod .. " + SHIFT +" .. n, smw.move_to_workspace_silent(n)) -- Move the active window to workspace N silently (no focus change).
end

-- Cycle workspaces on the current monitor.
hl.bind(mainMod .. " + mouse_down", smw.cycle_workspaces("next"))
hl.bind(mainMod .. " + mouse_up", smw.cycle_workspaces("prev"))

-- Register dispatchers so that hyprctl can call them

-- Move orphaned windows (not assigned to any mapped workspace) to the current workspace.
hl.bind(mainMod .. " + K", smw.grab_rogue_windows())


