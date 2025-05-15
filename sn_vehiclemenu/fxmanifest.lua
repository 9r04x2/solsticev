shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
description 'SkeletonNetworks'
version '2.0.0'
lua54 'yes'

ui_page 'build/index.html'

shared_script 'config.lua'

client_script 'client.lua'

files {'build/**'}

escrow_ignore {'config.lua'}
dependency '/assetpacks'