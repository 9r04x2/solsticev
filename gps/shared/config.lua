Config = {}

Config.Mysql = "oxmysql" -- mysql-async , ghmattimysql, oxmysql
Config.OpenMenu = {
    Open = "item", -- item or command 
    item = "gps",-- Menu Open Item
    command = "gps"-- Menu Open command
}
Config.Inventory = "ox_inventory" -- ox_inventory, quasar, default, other
Config.DefaultProfile = "./imgs/defult.jpg" -- If there is no discord profile, which profile should be displayed? (link or file path) 
Config.Fahrenheit = false -- if it is true it will use Fahrenheit, if false it will use degrees.
Config.SOS = {
    typ = "command", -- command or trigger_server or trigger_client
    command = "kod 99" -- enter trigger or command 
}


Config.GPSJobs = { -- Enter the professions that can access the menu here.
    ["police"] = {
        GpsThemeColor = "blue", -- Enter what the default menu color will be. (blue, yellow, red, green)
        BlipColor = 29, -- Enter Blip Color (https://docs.fivem.net/docs/game-references/blips/)
    },  
    ["ambulance"] = {
        GpsThemeColor = "red", -- Enter what the default menu color will be. (blue, yellow, red, green)
        BlipColor = 1, -- Enter Blip Color (https://docs.fivem.net/docs/game-references/blips/)
    },
    ["vespuccipd"] = {
        GpsThemeColor = "blue", -- Enter what the default menu color will be. (blue, yellow, red, green)
        BlipColor = 3, -- Enter Blip Color (https://docs.fivem.net/docs/game-references/blips/)
    },
    ["dsd"] = {
        GpsThemeColor = "yellow", -- Enter what the default menu color will be. (blue, yellow, red, green)
        BlipColor = 31, -- Enter Blip Color (https://docs.fivem.net/docs/game-references/blips/)
    },
    ["pbsd"] = {
        GpsThemeColor = "green", -- Enter what the default menu color will be. (blue, yellow, red, green)
        BlipColor = 55, -- Enter Blip Color (https://docs.fivem.net/docs/game-references/blips/)
    },
    ["bcsd"] = {
        GpsThemeColor = "yellow", -- Enter what the default menu color will be. (blue, yellow, red, green)
        BlipColor = 47, -- Enter Blip Color (https://docs.fivem.net/docs/game-references/blips/)
    },
    ["lspr"] = {
        GpsThemeColor = "yellow", -- Enter what the default menu color will be. (blue, yellow, red, green)
        BlipColor = 52, -- Enter Blip Color (https://docs.fivem.net/docs/game-references/blips/)
    },
    ["lssp"] = {
        GpsThemeColor = "green", -- Enter what the default menu color will be. (blue, yellow, red, green)
        BlipColor = 39, -- Enter Blip Color (https://docs.fivem.net/docs/game-references/blips/)
    },
}

Config.Blips = {
    Heli = 43,
    Boats = 427,
    Plane = 307,
    MotorBikes = 226,
    PoliceVehicles = 56,
    Walking = 126,
    OtherVehicles = 225,
    Siren = 42,
}

Config.Langs = {
    ExitGPS = "GPS'iniz kapatıldı",
    AlreadyExitGps = "GPS'iniz zaten kapalı!",
    OpenGPS = "GPS'iniz açıldı.",
    GpsAlreadyOpen = "GPS'iniz zaten açık!",
    NoJob = "Bunu kullanmaya yetkiniz yok!",
    Save = "Ayarlarınızı kaydedin.",
    Reset = "Ayarlarınızı sıfırlayın.",
    SOS = "Yardım çağrısında bulundunuz.",
}