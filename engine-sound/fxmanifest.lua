fx_version 'cerulean'
games {'gta5'}

author 'KanliAy'
description 'Engine Sound Pack'
version '1.0'

files {
  'audioconfig/*.dat151.rel',
  'audioconfig/*.dat54.rel',
  'sfx/**/*.awc'
}

data_file 'AUDIO_GAMEDATA' 'audioconfig/aq29viperv10_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/aq29viperv10_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_aq29viperv10' -- Dodge Viper

data_file 'AUDIO_GAMEDATA' 'audioconfig/ta488f154_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audioconfig/ta488f154_sounds.dat'
data_file 'AUDIO_WAVEPACK' 'sfx/dlc_ta488f154' -- 488lb
lua54 'yes'