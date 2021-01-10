--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "Terminus normal 9"
theme.fg   = "#fff"
theme.bg   = "#1f1f1f"
theme.fg_selected = theme.fg
theme.bg_selected = "#444444"
theme.fg_disabled = "#ccc"
theme.bg_disabled = theme.bg

-- Genaral colours
theme.success_fg = "#090"
theme.loaded_fg  = "#33AADD"
theme.error_fg = "#900"
theme.error_bg = theme.bg

-- Warning colours
theme.warning_fg = "#990"
theme.warning_bg = theme.bg

-- Notification colours
theme.notif_fg = theme.fg
theme.notif_bg = theme.bg

-- Menu colours
theme.menu_fg                   = theme.fg
theme.menu_bg                   = theme.bg
theme.menu_selected_fg          = theme.fg
theme.menu_selected_bg          = theme.bg_selected
theme.menu_title_bg             = theme.bg
theme.menu_primary_title_fg     = theme.fg
theme.menu_secondary_title_fg   = theme.fg

-- Proxy manager
--
theme.proxy_active_menu_fg      = theme.fg
theme.proxy_active_menu_bg      = theme.bg
theme.proxy_inactive_menu_fg    = theme.fg_disabled
theme.proxy_inactive_menu_bg    = theme.bg_disabled

-- Statusbar specific
theme.sbar_fg         = theme.fg
theme.sbar_bg         = theme.bg

-- Downloadbar specific
theme.dbar_fg         = "#fff"
theme.dbar_bg         = "#000"
theme.dbar_error_fg   = "#F00"

-- Input bar specific
theme.ibar_fg           = theme.fg
theme.ibar_bg           = theme.bg

-- Tab label
theme.tab_fg            = theme.fg
theme.tab_bg            = theme.bg
theme.tab_ntheme        = "#ddd"
theme.selected_fg       = theme.fg
theme.selected_bg       = theme.bg_selected
theme.selected_ntheme   = "#ddd"
theme.loading_fg        = theme.fg
theme.loading_bg        = theme.bg

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#090"
theme.notrust_fg        = "#900"

return theme
-- vim: et:sw=4:ts=8:sts=4:tw=80
