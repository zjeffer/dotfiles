local mainMod    = "SUPER"
local HOME       = os.getenv("HOME")
local APP_FOLDER = HOME .. "/.config/hypr/apps"

-- Window control
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("kill -9 $(hyprctl activewindow -j | jq -r '.pid')"))
hl.bind(mainMod .. " + CTRL + SHIFT + Escape", hl.dsp.exit())
hl.bind(mainMod .. " + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({}))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Reload Hyprland and notify waybar
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(
    "hyprctl reload && sleep 0.2 && touch -m " .. APP_FOLDER .. "/waybar/config.jsonc"
))

-- Applications
hl.bind(mainMod .. " + SUPER_L",
    hl.dsp.exec_cmd("killall rofi || ~/.config/rofi/launchers/type-2/launcher.sh -show drun"),
    { release = true })
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd("wezterm --config-file ~/.config/wezterm/wezterm.lua"))
hl.bind(mainMod .. " + CTRL + return", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SHIFT + return", hl.dsp.workspace.toggle_special())
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("chromium"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("/usr/bin/spotify --ozone-platform-hint=wayland"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("code --new-window"))
hl.bind(mainMod .. " + ALT + Q", hl.dsp.exec_cmd("zed"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord --ozone-platform-hint=wayland"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m output -m active --clipboard-only"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a -f hex"))
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("gnome-system-monitor"))

-- Move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Move window
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

-- Tabbed windows
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())

-- Hyprspace
-- hl.bind(mainMod .. " + grave", hl.dsp.exec_cmd("hyprctl dispatch overview:toggle all"))

-- Navigate workspaces with brackets
hl.bind(mainMod .. " + bracketleft", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + bracketright", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + SHIFT + bracketleft", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.window.move({ workspace = "r+1" }))

-- Move/resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_SOURCE@ toggle"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"))
hl.bind("SHIFT + XF86AudioPrev", hl.dsp.exec_cmd("playerctl position 5-"))
hl.bind("SHIFT + XF86AudioNext", hl.dsp.exec_cmd("playerctl position 5+"))

-- Dunst notifications
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("dunstctl close"))
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.exec_cmd("dunstctl history-pop"))

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -d nvidia* set +10%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -d nvidia* set 10%-"), { repeating = true })

-- Screen lock
hl.bind("switch:on:Lid Switch",
    hl.dsp.exec_cmd(APP_FOLDER .. "/swaylock/lock.sh && sleep 2 && systemctl suspend-then-hibernate"),
    { locked = true })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Forward/back mouse buttons via ydotool
-- hl.bind(mainMod .. " + 123", hl.dsp.exec_cmd("ydotool key 159:1 159:0"))
-- hl.bind(mainMod .. " + 122", hl.dsp.exec_cmd("ydotool key 158:1 158:0"))

-- Pass key to window (global shortcuts forwarding)
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.pass({ window = "^(io\\.github\\.nuttyartist\\.notes)$" }))

-- Submap: passthru all keys to virtual machine
hl.define_submap("passthru", function()
    hl.bind(mainMod .. " + I", hl.dsp.submap("reset"))
end)
hl.bind(mainMod .. " + O", hl.dsp.submap("passthru"))


hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen_state({internal = 1, client = 0, action="toggle"}))

