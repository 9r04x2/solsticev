shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

fx_version "cerulean"
game "gta5"

author "sinanovicanes"
version "1.3.0"
lua54 "yes"

-- debug_enable "*"

ui_page "src/html/index.html"

files {
	"locales/*.json",
	"src/html/index.html",
	"src/html/assets/*.js",
	"src/html/assets/*.css",
	"src/html/assets/*.png",
	"src/html/assets/*.svg",
	"src/html/assets/*.mp3"
}

shared_scripts {
	"@no-base/lib/init.lua",
	"config/shared.lua"
}

server_scripts {
	"@no-base/src/lua/server/version.lua",
	"src/server/**/*.lua"
}

client_scripts {
	"src/client/**/*.lua"
}

dependency "no-base"

escrow_ignore {
    "config/**/*.lua"
}
dependency '/assetpacks'