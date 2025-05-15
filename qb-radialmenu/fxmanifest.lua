shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'KanliAy'
description 'Radial Menu for FiveM'
version '1.2.0'
ui_page 'html/index.html'
shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}
client_scripts {
    'client/main.lua',
    'client/clothing.lua',
    'client/trunk.lua',
    'client/blips.lua',
    'client/stretcher.lua'
}
server_scripts {
    'server/trunk.lua',
    'server/stretcher.lua'
}
files {
    'html/index.html',
    'html/css/main.css',
    'html/js/main.js',
    'html/js/RadialMenu.js',
}