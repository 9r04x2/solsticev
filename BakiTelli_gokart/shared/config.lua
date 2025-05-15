Config = {}

------------------------------------------------------------------------------------
Config.Mysql = "oxmysql" -- mysql-async , ghmattimysql , oxmysql
Config.Money = "bank" -- cash, bank
Config.Plate = "SOL_GOKAR" -- Default Rent Plate
Config.Gokart = {
    [1] = {
        npc = vector3(-163.22, -2129.94, 16.71), --x,y,z
        spawn = vector4(-138.9, -2152.35, 16.71, 289.91), --x,y,z,h
        area = vector4(-70.63, -2060.38, 23.63, 150) --x,y,z,distance
    }
}

Config.Marker = {
		Type = 21,
        Distance = 5,
		Size = {
			x = 1.0,
			y = 1.0,
			z = 0.5,
		},
		Color = {
			r = 50,
			g = 200,
			b = 50,
		},
}

Config.Blips = {
	Blip = true,
	sprite = 545,
	color = 4,
	scale = 0.5,
}

Config.Cars = { -- gokart cars

    [1] = {
        label = "VAMBO KART", -- car label
        img = "lambokart.png", -- car image
        code = "lambokart", -- car code
        price = 200, -- 1m price
        type = "COOL",
    },
    [2] = {
        label = "RACE KART", -- car label
        code = "Shifter_kart", -- car code
        img = "shifter_kart.png", -- car image
        price = 100, -- 1m price
        type = "FUN",
    },
    [3] = {
        label = "KART", -- car label
        code = "kart", -- car code
        img = "kart.png", -- car image
        price = 50, -- 1m price
        type = "CHEAP"
    },
}

Config.Langs = {
    BlipName        = "Gokart",
    Rent            = "[E] - Gokart aracı kirala",
    NoRent          = "[E] - Aracı iade et",
    NoCarNoRent     = "Aracı iade etmen gerekiyor",
    NoMoney         = "Yeterli nakdin yok",
    Thanks          = "Aracı teslim ettin",
    Distance        = "Bölgeden ayrılmamalısın!",
    
}