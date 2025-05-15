Config = {}

-- QBCore Framework
Config.Framework = "qbcore" -- Set you framework "qbcore" or "esx" or "" if you use standalone framework and use /drone 1 or 2 command to use the Drone
Config.QBCoreName = "qb-core" -- You QBCore script name must be correct to work (only if you use QBCore Framework)

-- ESX Framework
Config.IsESXLegacy = false -- Set it true is you're using esx legacy (only if you use ESX Framework)
Config.ESXLegacyName = "es_extended" -- You ESX Legacy script name must be correct to work (only if you use ESX Legacy Framework)
Config.SQL = "oxmysql" -- Set the SQL to "oxmysql" or "mysql-async" depends on what you use on you ESX framework

-- Drone Controls
Config.Controls = { -- FiveM Controls: https://docs.fivem.net/docs/game-references/controls/
	Forward			= 32,	-- W for Qwerty / Z for Azerty
	Backward		= 33,	-- S
	Left			= 34,	-- A for Qwerty / Q for Azerty
	Right			= 35,	-- D
	Up				= 51,	-- E
	Down			= 52,	-- Q for Qwerty / A for Azerty
	Stop			= 22,	-- Space
	ZoomOut			= 16,	-- Mouse Scroll Whell Down
	ZoomIn			= 17,	-- Mouse Scroll Whell Up
	Nightvision		= 140,	-- R
	Heatvision		= 75,	-- F
	Spotlight		= 47,	-- G
	ReleaseDrone	= 168,	-- F7
	Scanner			= 24,	-- Left Mouse Button
	SoundBoard		= 29,	-- B
	Cancel			= 200,	-- ESC
}

Config.SyncDroneSound = false -- if you set it to "true" you may experience a little performance issue, test it
Config.DroneInitAnimations = true -- drone initiation animations (requested by customer)

-- Drone Scanner
Config.ScannerRange = 50.0
Config.ScannerIgnoreMask = false
Config.NoMaskComponentId = 0

-- Drone Text Font
Config.TextFont = 4 -- Text font type
Config.TextCustomFont = { -- This option for servers that use custom fonts or other languages - Used Natives: RegisterFontFile(FontName) / RegisterFontId(FontName)
	UseCustomFont = false, -- Set to "true" to enable using custom font
	FontName = '', -- Custom font file name
}

-- Drone Transition
Config.Transition = {
	['direction']       	= 'Yön',
	['height']          	= 'Yükseklik',
	['camera']          	= 'Kamera',
	['zoom']            	= 'Zoom',
	['nightvision']     	= 'Gece Görüşü',
	['heatvision']      	= 'Isı Görüşü',
	['spotlight']       	= 'Spot Işık',
	['scan_player']     	= 'Oyuncuyu Tara',
	['soundboard']    	 	= 'Ses Panosu',
	['cancel']          	= 'Iptal',
	['cant_use_drone']  	= 'Dronu kullanamazsınız',
	
	['release_drone']  		= 'Dronu Bırak',
	['reconnect_drone']  	= 'Drona Yeniden Bağlan',
	
	['scan_searching']  	= 'Aranıyor...',
	['scan_searching_db']	= 'Veritabanında aranıyor...',
	['scan_unknown']		= 'Bilinmeyen',
	['scan_not_recognized']	= 'Hedef tanınamıyor',
}
Config.UseDroneInVehicle = true

-- This two commands are made for servers that want to toggle ON/OFF the Instructional Buttons or Cam Scaleforms - Default is ON
Config.DroneCamScaleforms = "dronecamscaleforms"
Config.DroneInstructionalButtons = "droneinstructionalbuttons"


-- Drone play sound option settings

Config.SoundsRange = 50.0

Config.SoundsList = {
	{
		Text = "Aracı kenara çek",
		File = "car_over.ogg",
	},
	{
		Text = "LSPD! Aracınızı hemen kenara çekin",
		File = "pull_imm.ogg",
	},
	{
		Text = "San Andreas Highway Patrol, aracı durdurun",
		File = "sahp_stop.ogg",
	},
	{
		Text = "Son Şans! Aracı durdurun",
		File = "last_chance.ogg",
	},
	{
		Text = "Los Santos Polis Departmanı, aracı durdurun",
		File = "los_santos.ogg",
	},
	{
		Text = "Araçtaki motoru kapatın",
		File = "engine_off.ogg",
	},
	{
		Text = "Aracı durdurun ve dışarı çıkın",
		File = "get_out.ogg",
	},
	{
		Text = "Don! LSPD",
		File = "freeze_lspd.ogg",
	},
	{
		Text = "Bu kadar kolay kaçamazsınız",
		File = "away_easy.ogg",
	},
	{
		Text = "Uyarı bir kurşun olacak, durun a******",
		File = "bullet_ass.ogg",
	},
	{
		Text = "Saklanamazsın çocuk, seni bulacağız",
		File = "cant_hide_boi.ogg",
	},
	{
		Text = "Dur! Seni vurmak zorunda kalmayın, teslim olun",
		File = "dont_make_me.ogg",
	},
	{
		Text = "LSPD! Teslim olun",
		File = "give_up.ogg",
	},
	{
		Text = "Bu LSPD, şimdi dağılın",
		File = "disperse_now.ogg",
	},
	{
		Text = "Buradan çıkın, bu LSPD",
		File = "get_out_of_here_now.ogg",
	},
	{
		Text = "LSPD, alanı şimdi boşaltın",
		File = "clear_the_area.ogg",
	},
	{
		Text = "Ilerleyin insanlar! Sorun istemiyoruz",
		File = "move_along_people.ogg",
	},
	{
		Text = "LSPD, şimdi uzaklaşın yoksa sorun olacak",
		File = "this_is_the_lspd.ogg",
	},
}




Config.DevDebug = false -- Just prints few lines for test purposes