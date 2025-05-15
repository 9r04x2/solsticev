Config = {}

Config.Mysql = 'oxmysql'
Config.IsBoss = false -- if u want only the boss to swap engines (true/false)
Config.DrawText = "qb-core" -- Define the export resource accordingly | qb-core, qb-drawtext, ps-ui
Config.engineLocations = {
  ["pitstop"] = {
    ["coords"] = vector3(933.8953, -1531.8904, 30.3220), -- Corrected: only three numbers
    ["size"] = 2.0,
    ["heading"] = 271.4831, 
    ["debug"] = false,
    ["authorizedJob"] = "pitstop",
    ["inVehicle"] = "Motor sesleri için E tuşuna basın!",
    ["outVehicle"] = "Aracın içinde olmalısın!",
  },
  ["afterlife"] = {
    ["coords"] = vector3(880.2850, -2505.8906, 28.8015), -- Corrected: only three numbers
    ["size"] = 2.0,
    ["heading"] = 271.4831, 
    ["debug"] = false,
    ["authorizedJob"] = "afterlife",
    ["inVehicle"] = "Motor sesleri için E tuşuna basın!",
    ["outVehicle"] = "Aracın içinde olmalısın!",
  },
  ["mechanic_illegal"] = {
    ["coords"] = vector3(124.7699, -3023.2000, 6.6168), -- Corrected: only three numbers
    ["size"] = 2.0,
    ["heading"] = 270.7297,
    ["debug"] = false,
    ["authorizedJob"] = "mechanic_illegal",
    ["inVehicle"] = "Motor sesleri için E tuşuna basın!",
    ["outVehicle"] = "Aracın içinde olmalısın!",
  },
}


Config.Swaps = {
 [`r34sound`] = { 	custom = true, 	label = 'RB26DE Twin Turbo', 	soundname = 'r34sound', },
 [`f20c`] = { 	custom = true, 	label = 'Civic f20c', 	soundname = 'f20c', },
 [`aq2jzgterace`] = { 	custom = true, 	label = 'Supra 2JZ GTE Twin Turbo', 	soundname = 'aq2jzgterace', },
 [`rotary7`] = { 	custom = true, 	label = 'RX7 13B-REW twin-rotor Twin Turbo', 	soundname = 'rotary7', },
 [`fordvoodoo`] = {   	custom = true, 	label = 'ford Mustang v8',   	soundname = 'fordvoodoo',    },
 [`f10m5`] = {   	custom = true, 	label = 'BMW M5 f10 ',   	soundname = 'f10m5',    },
 [`lfasound`] = {   	custom = true,  	label = 'LFA V10',   	soundname = 'lfasound',    },
 [`elegyx`] = {   	custom = true,   	turboinstall = true,  	label = 'GTR R35',   	soundname = 'elegyx',    },
 [`ta028viper`] = {   	custom = true, 	label = 'Viper V10',   	soundname = 'ta028viper',    },
 [`porsche57v10`] = {   	custom = true,   	label = 'porsche57 v10',   	soundname = 'porsche57v10',    },
 [`s15sound`] = {   	custom = true, 	label = 'S15 SR20',   	soundname = 's15sound',    },
 [`gt3rstun`] = {   	custom = true, 	label = 'Flat 6',   	soundname = 'gt3rstun',    },
 [`m297zonda`] = {   	custom = true,  	label = 'Zonda V12',   	soundname = 'm297zonda',    },
 [`aq06nhonc30a`] = {   	custom = true,   	turboinstall = true,   	label = 'NSX',   	soundname = 'aq06nhonc30a',    },
 [`p60b40`] = {   	custom = true, 	label = 'Bmw Engine M3',   	soundname = 'p60b40',    },
 [`aqls7raceswap`] = {   	custom = true, 	label = 'C7 v8',   	soundname = 'aqls7raceswap',    },
 [`aqtoy2jzstock`] = {   	custom = true,   	turboinstall = true,   	label = 'Supra 2JZ GTE',   	soundname = 'aqtoy2jzstock',    },
 [`bgw16`] = {   	custom = true, 	label = 'Bugatti W16',   	soundname = 'bgw16',    },
 [`cvpiv8`] = {   	custom = true, 	label = 'cvpi v8',   	soundname = 'cvpiv8',    },
 [`cw2019`] = {   	custom = true,  	label = 'Senna engine',   	soundname = 'cw2019',    },
 [`ea888`] = {   	custom = true, 	label = 'VW ea888',   	soundname = 'ea888',    },
 [`ecoboostv6`] = {   	custom = true, 	label = 'Ford explorer V6',   	soundname = 'ecoboostv6',    },
 [`ftypesound`] = {   	custom = true,  	label = 'Ftype engine',   	soundname = 'ftypesound',    },
 [`hemisound`] = {   	custom = true, 	label = 'Hemi V8 engine',   	soundname = 'dodgehemihellcat',    },
 [`lambov10`] = {   	custom = true,   	turboinstall = true,   	label = 'lambo v10',   	soundname = 'lambov10',    },
 [`lgcy04murciv12`] = {   	custom = true, 	label = 'Lambo v12',   	soundname = 'lgcy04murciv12',    },
 [`mbnzc63eng`] = {   	custom = true, 	label = 'Mercedes c63 V8',   	soundname = 'mbnzc63eng',    },
 [`n4g63t`] = {   	custom = true, 	label = 'Evo engine',   	soundname = 'n4g63t',    },
 [`npcul`] = {   	custom = true,   	turboinstall = true,   	label = 'RRoyce',   	soundname = 'npcul',    },
 [`npolchar`] = {   	custom = true, 	label = 'charger v8',   	soundname = 'npolchar',    },
 [`s85b50`] = {   	custom = true,   	turboinstall = true,   	label = 'Victor v8',   	soundname = 's85b50',    },
 [`subaruej20`] = {   	custom = true, 	label = 'subaru boxer',   	soundname = 'subaruej20',    },
 [`ta488f154`] = {   	custom = true, 	label = 'F488 V8',   	soundname = 'ta488f154',    },
 [`taaud40v8`] = {   	custom = true, 	label = 'Audi v8',   	soundname = 'taaud40v8',    },
 [`trumpetzr`] = {   	custom = true, 	label = 'VQ Straight 6',   	soundname = 'trumpetzr',    },
 [`sultanrsv8`] = {   	custom = true, 	label = 'sultanrsv8',   	soundname = 'sultanrsv8',    },
 [`lg81hcredeye`] = {   	custom = true, 	label = 'lg81hcredeye',   	soundname = 'lg81hcredeye',    },
 [`lg153gom70stang`] = {   	custom = true, 	label = 'Ford Mustang 1970',   	soundname = 'lg153gom70stang',    }, 
 [`predatorv8`] = {   	custom = true, 	label = 'Predator V8',   	soundname = 'predatorv8',    }, 
 [`ta122s58`] = {   	custom = true, 	label = 'BMW M3 Engine V4',   	soundname = 'ta122s58',    },  
 [`tamustanggt50`] = {   	custom = true, 	label = 'Ford Mustang 1970 V1',   	soundname = 'tamustanggt50',    },
 [`tascmustanggt50`] = {   	custom = true, 	label = 'Ford Mustang 1970 V2',   	soundname = 'tascmustanggt50',    },
 [`strb302`] = {   	custom = true, 	label = 'Mustang V9',   	soundname = 'strb302',    },
 [`musv8`] = {   	custom = true, 	label = 'Mustang V10',   	soundname = 'musv8',    },
 [`golfmk4`] = {   	custom = true, 	label = 'Golf MK4',   	soundname = 'golfmk4',    },
 [`bnr34ffeng`] = {   	custom = true, 	label = 'Skyline R34 V1',   	soundname = 'bnr34ffeng',    },
 [`ta013vq35`] = {   	custom = true, 	label = '350Z V1',   	soundname = 'ta013vq35',    },
 [`aq56honf20c`] = {   	custom = true, 	label = 'S2000 V1',   	soundname = 'aq56honf20c',    }, 
 [`fdvsffeng`] = {   	custom = true, 	label = 'VeilSide RX7',   	soundname = 'fdvsffeng',    }, 
 [`kc46nisr34ztune`] = {   	custom = true, 	label = 'Skyline R34 V2',   	soundname = 'kc46nisr34ztune',    }, 
 [`kc33mitsu4g63t`] = {   	custom = true, 	label = 'Evo IX V1',   	soundname = 'kc33mitsu4g63t',    }, 
 [`aq67merm177`] = {   	custom = true, 	label = 'G63 V1',   	soundname = 'aq67merm177',    },  
 -- bikes
 [`suzukigsx`] = {   	custom = true,  	label = 'Bike suzukigsx',   	soundname = 'suzukigsxr1k',    }, 
 [`s1000rr`] = {   	custom = true, 	label = 'Bike bmws1krreng',   	soundname = 'bmws1krreng',    }, 
 [`kc12r1200gsakrapovic`] = {   	custom = true, 	label = 'Bike BMW R1200GS',   	soundname = 'kc12r1200gsakrapovic',    }, 
}