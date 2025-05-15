fx_version 'adamant'

game 'gta5'

author "Savana Scripts"

lua54 'yes'

description 'savana.tebex.io'


files {
    'html/**/**.**'
}

client_script { 
    "main/client.lua"
}


server_script { 
    "config.lua",
    "main/server.lua",
}

escrow_ignore {
    'config.lua',
}

loadscreen_cursor 'yes'

loadscreen 'html/index.html'

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
dependency '/assetpacks'