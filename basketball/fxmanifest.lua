shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA





fx_version 'cerulean'

game 'gta5'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/css/*.css',
	'html/fonts/*.css',
	'html/js/*.js',
	'html/imgs/*.png',
	'html/imgs/*.svg',
	'html/fonts/*.ttf',
}

client_scripts {
	'functions/client_functions.lua',
	'client.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config/server_config.lua',
	'functions/server_functions.lua',
	'server.lua',
}
shared_script {
	'@ox_lib/init.lua',
	'config/config.lua',
	'functions/shared_functions.lua',
}

lua54 'yes'

escrow_ignore {
	'config/*.lua',
	'functions/*.lua',
}

dependencies {
    'ox_lib'
}
dependency '/assetpacks'