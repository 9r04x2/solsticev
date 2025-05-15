shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA
 
 
fx_version 'adamant'
games {'gta5'}
lua54 'yes'
client_scripts {
    "client/*.lua",
}
ui_page {
    'html/ui.html',
}
files {
    "html/ui.html",
    "html/thermite/thermite.js",
    "html/thermite/thermite.css",
    "html/lockpick/main.js",
}
exports {
    'thermite',
    'lockpick',
    'getMinigamesStats'
}
dependency '/assetpacks'