-- Hyprland Lua config entry point
local config_folder = "./configs"

require(config_folder .. ".env")
require(config_folder .. ".monitors")
require(config_folder .. ".general")
require(config_folder .. ".plugins")
require(config_folder .. ".decoration")
require(config_folder .. ".animations")
require(config_folder .. ".input")
require(config_folder .. ".keybinds")
require(config_folder .. ".window_rules")
require(config_folder .. ".workspace_rules")


-- Autostart
-- Note: dbus-update-activation-environment must be last
hl.on("hyprland.start", function()
    hl.exec_cmd("xhost + local:")
    hl.exec_cmd("/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("hyprpaper --config $HYPR_FOLDER/hyprpaper.conf")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("ydotoold")
    hl.exec_cmd("bash $APP_FOLDER/waybar/launch.sh")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd(
        "ratbagctl 'Logitech G502 HERO Gaming Mouse' profile active set 0 && ratbagctl 'Logitech G502 HERO Gaming Mouse' profile 0 resolution active set 2")
    hl.exec_cmd("dbus-update-activation-environment --systemd --all") -- Needs to be last
end)
