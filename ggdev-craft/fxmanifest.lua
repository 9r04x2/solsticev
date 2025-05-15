shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'


lua54 'yes'

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}