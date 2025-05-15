shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
description 'SkeletonNetworks'
version '2.0.1'
lua54 'yes'

shared_script 'config.lua'

client_scripts {'client.lua', 'client_open.lua'}

files {
    'build/**',
}

ui_page 'build/index.html'

escrow_ignore {
    'client_open.lua',
    'config.lua',
}
dependency '/assetpacks'