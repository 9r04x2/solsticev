shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
 
 

fx_version 'cerulean'
game 'gta5'
lua54 'yes'


shared_scripts {
	'config.lua',
	'@qb-core/shared/locale.lua',
	'locales/en.lua',
	'locales/*.lua'
}

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
	'client/main.lua',
	'client/interactions.lua',
	'client/job.lua',
	'client/heli.lua',
	'client/objects.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/vue.min.js',
	'html/script.js'
}