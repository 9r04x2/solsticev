-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA




 
 
fx_version 'cerulean'
game 'gta5'
author 'Gabz'
description 'PD Props'
version '1.0.2'
lua54 'yes'
this_is_a_map 'yes'

dependencies { 
    '/server:4960',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 4960.
    '/gameBuild:2545',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2545.
}

files {
    'cfx-gabz-pdprops_cache_y.dat'
}

server_scripts {
    'version_check.lua',
}

escrow_ignore {
    'stream/**/*.ytd',
}
dependency '/assetpacks'