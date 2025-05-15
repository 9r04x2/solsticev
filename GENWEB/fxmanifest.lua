shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.js'
fx_version 'cerulean'
lua54 'yes'
game 'gta5'
description 'GENSTORE API ACCES'
author 'tansu'
server_scripts {
    "lua/server.lua",
    "lua/editable.lua",
    "index.js",
    "lua/wl.lua",
    "lua/config.lua"

}
client_scripts {
    "lua/config.lua",
    "lua/stash.lua"


}

files {
    'blips.json',
    'config.json',
    'handling.json',
    'exports.json',
    'utils.js',
    'stash.json', 
    'bans.json',

}
exports {
    'export1'
}
escrow_ignore {
	"lua/config.lua",
	"lua/editable.lua",
    'blips.json',
    'config.json',
    'bans.json',
    'handling.json',
    'exports.json'
}

dependencies {
    "/onesync"
}
dependency '/assetpacks'