-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
fx_version 'cerulean'
game 'gta5'
author 'Gabz'
description 'Prison'
version '1.0.2'
lua54 'yes'
this_is_a_map 'yes'

dependencies { 
    '/server:4960',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 4960.
    '/gameBuild:2545',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2545.
    'cfx-gabz-mapdata', -- ⚠️PLEASE READ⚠️; Requires [cfx-gabz-mapdata] to work properly.
}

files {
    'cfx-gabz-prison_cache_y.dat'
}

server_scripts {
    'version_check.lua',
}

escrow_ignore {
    'stream/**/*.ytd',
    'stream/vanilla/*.*',
}
dependency '/assetpacks'