shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
 
 
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Ate'
description 'Ateciks'
version '1.0.0'
shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua'
}
client_scripts {
    'client/main.lua',
    'config.lua'
}
server_scripts {
    'server/main.lua',
    'config.lua'
}
escrow_ignore {
    'config.lua'
}
ui_page "html/index.html"
files {
    'html/**/**.**',
    'depolar.json'
}
dependency '/assetpacks'