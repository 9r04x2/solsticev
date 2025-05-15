shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
 
 
 
 
fx_version 'cerulean'
lua54 'yes'
use_experimental_fxv2_oal 'yes'
game 'gta5'
name 'dusa_fishing'
version '1.1.8'
description 'Dusa Fishing (Realistic Hook, New World Minigame)'
dependencies {
    '/server:5104',
    '/onesync',
    'ox_lib'
}
shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'core/import.lua',
    'functions.lua',
}
ox_libs {
    'locale',
    'table',
    'math',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'init.lua',
    'server.lua',
    'modules/mysql/server.lua',
    'core/server.lua',
    'core/qb/server.lua',
    'core/esx/server.lua',
    'modules/rod/server.lua',
    'modules/level/server.lua',
    'modules/shop/server.lua',
    'modules/tackle/server.lua',
}
client_scripts {
    'init.lua',
    'client.lua',
    'core/client.lua',
    'core/target.lua',
    'core/qb/client.lua',
    'core/esx/client.lua',
    'locales/*.lua',
    'modules/editor/client.lua',
    'modules/fishing/client.lua',
    'modules/level/client.lua',
    'modules/minigame/client.lua',
    'modules/hook/client.lua',
    'modules/rod/client.lua',
    'modules/rod/physics.lua',
    'modules/shop/client.lua',
    'modules/shop/peds.lua',
    'modules/tackle/client.lua',
    'modules/task/client.lua',
    'modules/task/customize.lua',
}
files {
    'client.lua',
    'server.lua',
    'functions.lua',
    'locales/*.json',
    "locales/*.lua",
	'web/dist/index.html',
	'web/dist/*.png',
	'web/dist/*.svg',
	'web/dist/assets/*.*',
	'web/dist/item/*.png',
	'web/dist/fish/*.png',
	'web/dist/hook/*.png',
	'web/dist/background/*.png',
    'core/client.lua',
    'core/import.lua',
    'core/target.lua',
    'core/**/client.lua',
    'modules/**/*.lua',
}
ui_page 'web/dist/index.html'
escrow_ignore {
    "config.lua",
    "init.lua",
    "client.lua",
    "server.lua",
    "updater.lua",
    "functions.lua",
    "modules/task/customize.lua",
    "modules/shop/peds.lua",
    "modules/editor/client.lua",
    "modules/mysql/server.lua",
    "core/*.lua",
    "core/qb/*.lua",
    "core/esx/*.lua",
    "locales/*.json",
    "locales/*.lua",
}
dependency '/assetpacks'