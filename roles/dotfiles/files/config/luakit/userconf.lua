local nightmode = require "nightmode"
local settings = require "settings"
settings.webview.zoom_level = 150
settings.window.home_page = "http://127.0.0.1:54321"
local downloads = require "downloads"
downloads.default_dir = os.getenv("HOME") .. "/Downloads"
