Config = {}

Config.Framework = "qbcore"  -- types (standalone, qbcore, esx)

Config.ESXFramework = {
	newversion = false, -- use this if you using new esx version (if you get error with old esxsharedobjectmethod in console)
	getsharedobject = "esx:getSharedObject"
}

Config.QBCoreFrameworkResourceName = "qb-core" -- qb-core resource name, change this if you have different name of main resource of qbcore

Config.OwnedVehicleTableName = {esx = "owned_vehicles", qbcore = "player_vehicles"} -- dont change this if you dont have custom tables names.

Config.OxInventory = true -- enable this if you use oxinventory on qb-core

Config.Language = "English"

Config.CarRadioControlCommand = "carradio" -- command for control radio

Config.CarRadioControlBind = true -- this will enable car radio control via bind

Config.CarRadioControlBindKey = "F5" -- radio key, only work if you enable Config.CarRadioControlBind

Config.CarRadioControlEvent = true -- this will enable car radio control via event, you will enable control via event name, for control TriggerEvent("rtx_radio:ControlRadio", true) for disable for control TriggerEvent("rtx_radio:ControlRadio", false)

Config.CarRadioControlEventName = "rtx_radio:ControlRadio" -- radio event, only work if you enable Config.CarRadioControlEvent

Config.CarRadioResetSettingsCommand = "radioreset" -- command for reset radio settings

Config.CarRadioHideCommand = "radio" -- command for hide radio

Config.CarRadioShowOnlyWhenIsPlayerInMenu = false -- enable this if you want to see only radio when you change songs, radio will show when you triggerevent or when you press bind (it will automaticly disable control bind and event)

Config.CarRadioShowOnlyWhenIsPlayerInMenuBind = true -- this will enable car radio show via bind

Config.CarRadioShowOnlyWhenIsPlayerInMenuBindKey = "F4" -- radio show key, only work if you enable Config.CarRadioShowOnlyWhenIsPlayerInMenuBind and Config.CarRadioShowOnlyWhenIsPlayerInMenu

Config.CarRadioShowOnlyWhenIsPlayerInMenuCommand = true -- this will enable car radio show via commad 

Config.CarRadioShowOnlyWhenIsPlayerInMenuCommandName = "showradio" -- radio show command, only work if you enable Config.CarRadioShowOnlyWhenIsPlayerInMenuCommand and Config.CarRadioShowOnlyWhenIsPlayerInMenu

Config.CarRadioShowOnlyWhenIsPlayerInMenuEvent = true -- this will enable car radio show via event for show radio TriggerEvent("rtx_radio:ShowRadio", true) for hide radio TriggerEvent("rtx_radio:ShowRadio", false) 

Config.CarRadioShowOnlyWhenIsPlayerInMenuEventName = "rtx_radio:ShowRadio" -- radio show event, only work if you enable Config.CarRadioShowOnlyWhenIsPlayerInMenuEvent and Config.CarRadioShowOnlyWhenIsPlayerInMenu

Config.CarRadioForEveryVehicle = true -- if you enable this, radio will work on every vehicles, if its disabled, it will work only in radio which is writed in Config.RadioVehicles. 

Config.CarRadioVehicleBlacklist = false -- if you enable this, radio will work not for vehicles which is in blacklisted config, you need put vehicles in Config.RadioBlacklistedVehicles. 

Config.CarRadioForOnlySpecifiedTypeOfVehicle = false --- if you enable this, radio will work only for specified vehicle (Vehicle Class) you need enable class in Config.RadioVehiclesClasses

Config.CarRadioItem = false -- if you enable this, radio will work only for vehicles which have installed radio via item or via event. Only works for qbcore and esx!

Config.CarRadioEvent = false --TriggerServerEvent("rtx_carradio:InstallRadioCustom", vehicleplate, vehiclenetworkid) --clientside export for check if vehicle have installed radio exports["rtx_carradio"]:HasVehicleRadio(vehicle) Only works for qbcore and esx!

Config.DefaultRadioSettings = {color = "#ff66ff", scale = 1.0, position = {top = 82, left = 70}} --scale for default settings min is 0.5, max is 1.5 

Config.RadioSoundOnlyInsideVehicle = false -- enable this if you want to hear sound of radio only when you are in vehicle, if you will enable this, you will not hear music around vehicle.

Config.DisableClassicRadioWhenCustomRadioIsNotInstalled = false -- enable this if you want disable classic gta radio in all vehicles if vehicle doesnt have installed radio

Config.RadioMaxDistance = 20.0 -- change this if you want increase distance of sound arount the vehicle

Config.CarRadioWebhook = true -- enable this if you want use webhooks (you need configure your webhook in other.lua file!)

Config.StreamerModeCommand = "streamermode" -- command for disable music for example for streamers, when player will use this command he will not hear music from vehicles

Config.HideRadioWhenPlayerIsInPauseMenu = false -- enable this if you want hide radio if you are in pause menu

Config.RadioVehicles = {
	{
		vehiclename = "bullet", -- vehicle name
	},
	{
		vehiclename = "infernus", -- vehicle name
	},	
}

Config.RadioBlacklistedVehicles = {
	{
		vehiclename = "rhino", -- vehicle name
	},
	{
		vehiclename = "thruster", -- vehicle name
	},	
}

Config.RadioVehiclesClasses = {
	[0] = true,
	[1] = true,
	[2] = true,
	[3] = true,
	[4] = true,
	[5] = true,
	[6] = true,
	[7] = true,
	[8] = true,
	[9] = true,
	[10] = true,
	[11] = true,
	[12] = true,
	[13] = false,
	[14] = false,
	[15] = false,
	[16] = false,
	[17] = true,
	[18] = true,
	[19] = true,
	[20] = true,
	[21] = true,
	[22] = true,
}

Config.RadioStations = {
	{
		radiocustom = false,
		radioname = "RADIO_01_CLASS_ROCK",
		radiolabel = "Los Santos Rock Radio",
	},
	{
		radiocustom = false,
		radioname = "RADIO_02_POP",
		radiolabel = "Non-Stop-Pop FM",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_03_HIPHOP_NEW",
		radiolabel = "Radio Los Santos",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_04_PUNK",
		radiolabel = "Channel X",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_05_TALK_01",
		radiolabel = "West Coast Talk Radio",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_06_COUNTRY",
		radiolabel = "Rebel Radio",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_07_DANCE_01",
		radiolabel = "Soulwax FM",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_08_MEXICAN",
		radiolabel = "East Los FM",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_09_HIPHOP_OLD",
		radiolabel = "West Coast Classics",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_11_TALK_02",
		radiolabel = "Blaine County Radio",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_12_REGGAE",
		radiolabel = "Blue Ark",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_13_JAZZ",
		radiolabel = "Worldwide FM",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_14_DANCE_02",
		radiolabel = "FlyLo FM",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_15_MOTOWN",
		radiolabel = "The Lowdown 91.1",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_16_SILVERLAKE",
		radiolabel = "Radio Mirror Park",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_17_FUNK",
		radiolabel = "Space 103.2",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_18_90S_ROCK",
		radiolabel = "Vinewood Boulevard Radio",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_19_USER",
		radiolabel = "Self Radio",
	},		
	{
		radiocustom = false,
		radioname = "RADIO_20_THELAB",
		radiolabel = "The Lab",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_21_DLC_XM17",
		radiolabel = "Blonded Los Santos 97.8 FM",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_22_DLC_BATTLE_MIX1_RADIO",
		radiolabel = "Los Santos Underground Radio",
	},		
	{
		radiocustom = false,
		radioname = "RADIO_23_DLC_XM19_RADIO",
		radiolabel = "iFruit Radio",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_27_DLC_PRHEI4",
		radiolabel = "Still Slipping Los Santos",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_34_DLC_HEI4_KULT",
		radiolabel = "Kult FM",
	},		
	{
		radiocustom = false,
		radioname = "RADIO_35_DLC_HEI4_MLR",
		radiolabel = "The Music Locker",
	},	
	{
		radiocustom = false,
		radioname = "RADIO_37_MOTOMAMI",
		radiolabel = "MOTOMAMI Los Santos",
	},	
	{
		radiocustom = true, -- enable this if you want to stream read radio to the fm category radio
		radiorul = "https://ice-sov.musicradio.com/ChillMP3", -- url for radio, best is mp3 format
		radiolabel = "Smooth Chill",
	},	
	{
		radiocustom = true, -- enable this if you want to stream read radio to the fm category radio
		radiorul = "https://stream-mz.planetradio.co.uk/net1southcoast.mp3?direct=true&aw_0_1st.playerid=BMUK_TuneIn&aw_0_1st.skey=7374499933", -- url for radio, best is mp3 format
		radiolabel = "Hits Radio",
	},			
}

function Notify(text)
	-- exports["rtx_notify"]:Notify("Car Radio", text, 5000, "info") -- if you get error in this line its because you dont use our notify system buy it here https://rtx.tebex.io/package/5402098 or you can use some other notify system just replace this notify line with your notify system
	--exports["mythic_notify"]:SendAlert("inform", text, 5000)
end