Config = {}

-- General Config
Config.Framework = "qb" -- Determines which framework to use: auto, esx, or qb
Config.Mysql = "oxmysql" -- Determines which mysql to use: oxmysql, ghmattimysql, or mysql-async
Config.Marker = true -- true or false
Config.BallPrice = 15 -- Price of the ball
Config.BallSpeed = 50 -- Speed of the ball minigame
Config.CacheDuration = 0.2 -- Top 3 Update Time (1 = 1minutes) (Protects server performance and database load)

-- Machine Coords (no limited)
Config.Machines = {
    [1] = vector4(-604.4, -1071.56, 22.33, 180.39),
    [2] = vector4(-821.8538, -1348.8630, 5.1503, 322.8817),
}

-- Language
Config.Langs = {
    ["Open"] = "[E] - Basket Makinesi",
    ["no_money"] = "Oynamak için yeterli paran yok",
    ["success"] = "Basket attın",
    ["miss"] = "Basketi kaçırdın",
    ["machine_busy"] = "Bu makine zaten kullanımda",
}