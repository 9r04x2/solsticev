shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kakarot'
description 'Menu of options for players to interact with to do certain tasks'
version '1.2.0'
shared_scripts {
    '@ox_lib/init.lua'
}
client_script 'client/main.lua'
ui_page 'html/index.html'
files {
    'html/index.html',
    'html/script.js',
    'html/style.css'
}