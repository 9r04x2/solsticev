shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
 
 
fx_version 'cerulean'
game 'gta5'

name "MugShotBase64"
description 'A script can convert peds mugshot image to Base64 encoding to save that as save and manage that'
author "BaziForYou#9907"

ui_page 'html/index.html'

files {
  "html/js/*",
  "html/js/models/*",
  "html/img/*",
  "html/index.html",
}
client_script {
  "client.lua",
}
lua54 'yes'