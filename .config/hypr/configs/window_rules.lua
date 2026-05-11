-- File dialogs
hl.window_rule({ match = { title = "^(Open Folder)$" },             float = true })
hl.window_rule({ match = { title = "^(Open File)$" },               float = true })
hl.window_rule({ match = { title = "^(Save As)$" },                 float = true })
hl.window_rule({ match = { title = "^(File Operation Progress)$" }, float = true })
hl.window_rule({ match = { title = "^(Firefox — Sharing Indicator)$" }, float = true })

-- LibreOffice
hl.window_rule({
    name           = "LibreOffice",
    match          = { class = "^(libreoffice.*)$" },
    suppress_event = "fullscreen",
    float          = false,
})

-- Calculator
hl.window_rule({ match = { class = "^(org.gnome.Calculator)$" }, float = true })

-- Rofi
hl.window_rule({
    name    = "Rofi",
    match   = { class = "^(Rofi)$" },
    float   = true,
    no_anim = true,
})

-- Opacity
hl.window_rule({ match = { class = "[gG]nome-terminal.*" },              opacity = 0.85 })
hl.window_rule({ match = { initial_class = "org.wezfurlong.wezterm" },    opacity = 0.85 })
hl.window_rule({ match = { class = "kitty" },                            opacity = 0.85 })
hl.window_rule({ match = { initial_title = "^(Spotify( Premium)?)$" },    opacity = 0.90 })
hl.window_rule({
    name    = "VSCode",
    match   = { class = "^([cC]ode(-[Ii]nsiders)?)$" },
    opacity = 0.90,
})
hl.window_rule({ match = { initial_class = "dev.zed.Zed" },  opacity = 0.90 })
hl.window_rule({ match = { class = "[Tt]hunar" },            opacity = 0.80 })
hl.window_rule({ match = { class = "[Dd]unst" },             opacity = 0.70 })
hl.window_rule({ match = { class = "[Dd]iscord" },           opacity = 0.95 })

-- Network Manager
hl.window_rule({ match = { class = "nm-connection-editor" },       float = true })
hl.window_rule({ match = { class = "nm-openconnect-auth-dialog" }, float = true })

-- ProtonVPN
hl.window_rule({
    name     = "ProtonVPN",
    match    = { class = "protonvpn-app" },
    float    = true,
    max_size = "400 600",
})

-- Flameshot workaround
hl.window_rule({
    name           = "Flameshot",
    match          = { title = "^(flameshot)" },
    move           = "0 0",
    float          = true,
    suppress_event = "fullscreen",
})

-- Steam Friends List
hl.window_rule({
    name     = "Steam - Friends List",
    match    = { initial_title = "^(Friends List)$", class = "^(Steam)$" },
    min_size = "320 600",
    size     = "400 700",
    float    = true,
})

-- Steam Tinker Launch
hl.window_rule({ match = { class = "yad" }, float = true })

-- Jellyfin
hl.window_rule({
    name         = "Jellyfin",
    match        = { class = "^(org.jellyfin.JellyfinDesktop)$" },
    idle_inhibit = "always",
})

-- Thunar rename dialog
hl.window_rule({
    name   = "Thunar",
    match  = { initial_title = "^(Rename.*)", class = "^([Tt]hunar)$" },
    float  = true,
    size   = "600 118",
    center = true,
})

-- GIMP color selection
hl.window_rule({ match = { class = "gimp" }, suppress_event = "activatefocus" })

-- Edge popup (no-focus overlay)
hl.window_rule({
    name             = "Edge Popup",
    match            = { class = "^$", title = "^$" },
    float            = true,
    no_initial_focus = true,
    no_focus         = true,
    no_anim          = true,
    no_shadow        = true,
    border_size      = 0,
    rounding         = 0,
    stay_focused     = true,
})
