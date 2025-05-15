shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'
-- Using game build 2802

fx_version 'cerulean'
game 'gta5'
author 'ONX'
contributors 'CanisterDog, Momo, GTAWiseguy, Hirona, PolaFlex'
description 'Government, Police & EMS Clothing'
version '1.3.2'
lua54 'yes'

server_scripts {
  'version.lua',
}

files {
  'mp_m_freemode_01_onxgovt.meta',
  'mp_f_freemode_01_onxgovt.meta',
}

data_file 'SHOP_PED_APPAREL_META_FILE' 'mp_m_freemode_01_onxgovt.meta'
data_file 'SHOP_PED_APPAREL_META_FILE' 'mp_f_freemode_01_onxgovt.meta'
dependency '/assetpacks'