shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
author 'Project Sloth'
description 'UI Library'
version '2.0.1'
repository 'https://github.com/Project-Sloth/ps-ui'
credits 'https://github.com/sharkiller/nopixel_minigame'
lua54 'yes'

ui_page 'web/build/index.html'

client_scripts {
  'client/**'
}

files {
  'web/build/**',
}