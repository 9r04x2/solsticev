fx_version 'cerulean'  -- https://discord.gg/flmodz --
game 'gta5'
lua54 'yes'
author 'FLMODZ - Flory'
description 'FLmodz B Class 1'


files {
    'data/**/*.meta',
    'data/*.meta',

}


data_file 'HANDLING_FILE'            'data/**/handling.meta'
data_file 'VEHICLE_LAYOUTS_FILE'    'data/**/vehiclelayouts.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts_jmbearcat.meta'
data_file 'VEHICLE_METADATA_FILE'    'data/**/vehicles.meta'
data_file 'CARCOLS_FILE'            'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE'    'data/**/carvariations.meta'


client_script 'vehicle_names.lua'

escrow_ignore {
    'vehicle_names.lua',
}
dependency '/assetpacks'