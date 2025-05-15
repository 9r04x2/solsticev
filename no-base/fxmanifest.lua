shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'
fx_version "cerulean"
game "gta5"

author "sinanovicanes"
version "1.4.0"
lua54 "yes"

-- UNCOMMENT THIS TO ENABLE TRACING
-- Add resource names to enable tracing for them
-- no_enable_tracing "*" {
-- 	"no-base"
-- }

-- no_enable_debug "*" -- UNCOMMENT THIS TO ENABLE DEBUG

files {
    "lib/modules/**/*.lua",
	"locales/*.json"
}

shared_scripts {
    "configure/shared/*.lua",
    "lib/init.lua",
    "src/lua/shared/**/*.lua"
}

client_scripts {
    "configure/client/*.lua",
    "src/lua/client/**/*.lua"
}

server_scripts {
    "configure/server/*.lua",
    "src/lua/server/**/*.lua"
}

escrow_ignore {
    "configure/**/*.lua",
    "lib/modules/**/*.lua"
}

dependency '/assetpacks'