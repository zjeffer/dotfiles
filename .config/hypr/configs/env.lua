local HOME = os.getenv("HOME")

-- Cursor
hl.env("HYPRCURSOR_THEME", "Nordzy-cursors-white")
hl.env("HYPRCURSOR_SIZE", "32")
hl.env("XCURSOR_SIZE", "32")
hl.env("XCURSOR_THEME", "Nordzy-cursors-white")

-- NVIDIA
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__GL_GSYNC_ALLOWED", "0")
hl.env("__GL_VRR_ALLOWED", "0")
hl.env("WLR_DRM_NO_ATOMIC", "1")

-- Wayland / session
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("GDK_BACKEND", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland,x11")
hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Qt
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("DESKTOP_SESSION", "gnome")

-- XDG directories
hl.env("XDG_CONFIG_HOME", HOME .. "/.config")
hl.env("XDG_CACHE_HOME", HOME .. "/.cache")
hl.env("XDG_DATA_HOME", HOME .. "/.local/share")
hl.env("XDG_DATA_DIRS", "/usr/local/share:/usr/share")
hl.env("XDG_CONFIG_DIRS", "/etc/xdg")

-- App paths (also available as shell env vars in exec_cmd)
hl.env("HYPR_FOLDER", HOME .. "/.config/hypr")
hl.env("EWW_CONFIG_DIR", HOME .. "/.config/eww")
hl.env("APP_FOLDER", HOME .. "/.config/hypr/apps")
hl.env("PLUGIN_FOLDER", HOME .. "/.local/share/hyprload/plugins/bin")

-- Docking station workaround: use correct GPU
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card0:/dev/dri/card1")
