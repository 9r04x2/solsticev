fx_version 'cerulean'
game 'gta5'
this_is_a_map 'yes'

files {
	'audio/patoche_church_game.dat151.rel',
	-- 'audio/patoche_church_sandy_game.dat151.rel',
	'audio/patoche_church_lossantos_game.dat151.rel',
}

data_file 'AUDIO_GAMEDATA' 'audio/patoche_church_game.dat'
-- data_file 'AUDIO_GAMEDATA' 'audio/patoche_church_sandy_game.dat'
data_file 'AUDIO_GAMEDATA' 'audio/patoche_church_lossantos_game.dat'


escrow_ignore {
    'stream/Church_Los_Santos/basev los santos/**.*',
	-- 'stream/Church_Paleto/basev paleto/**.*',
	-- 'stream/Church_Sandyshore/basev sandyshore/**.*',
  }

  
version '1.0.0'
author 'Patoche#4702'
contact 'https://discord.gg/NvrTRdh'


dependency '/assetpacks'
lua54 'yes'