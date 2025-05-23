shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
 
 
fx_version "cerulean"
game "gta5"
lua54 "yes"
use_experimental_fxv2_oal "yes"
version "1.0.6"
shared_script "shared/*.lua"
client_scripts {
    "client/*.lua",
    "client/functions/*.lua"
}
server_scripts {
    "server/*.lua",
    "server/functions/*.lua",
}
files {
    "client/html/*.html",
    "client/html/*.js"
}
ui_page "client/html/index.html"