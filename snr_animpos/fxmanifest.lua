shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
 
 
fx_version 'cerulean'
games { 'gta5' }

description 'SNR Store - Anim Pos V1.2'

client_script {
	"script/client.lua"
}

server_script {
	"script/server.lua"
}

shared_scripts {
	'config.lua'
}

lua54 'yes'

escrow_ignore {
	'config.lua'
}


-- ui settings --
ui_page {
    "html/index.html"
}

files {
    "html/index.html",
    "html/style.css",
    "html/script.js",
    "html/assets/*.png"
}

dependency '/assetpacks'