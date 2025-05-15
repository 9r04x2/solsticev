Config = {}

Config.Key = {
    -- https://docs.fivem.net/docs/game-references/controls/#controls
    playKey = 38, -- E
    leaderboardKey = 47, -- G
}

Config.Target = {
    status = true, -- [Optional] If you set this value to true, the target will works. (true or false)
    type = "qb" -- ox, qb, other // example: type = "ox"
}

Config.LaunchSpeed = 7 -- Increase this value to increase the launch power

Config.Payment = {
    status = true, -- If you set this value to false, the rodeo will be free. (true or false)
    price = 100,
}

Config.Blips = {
    status = false, -- If you set this value to false, the blips will not be displayed. (true or false)
    sprite = 409,
    color = 17,
    scale = 0.9,
}

Config.Coords = {
    -- When you add a new location make sure the id is uniq 3,4,5 etc
    -- If the prop top in your location, decrease the z value by 1 or 2

    [1] = {
        coords = vector4(-851.2469, -1260.8524, 5.0002, 213.8116),
        models = {
            baseModel ='rodeoarena',
            bullModel = 'bull',
        },
    },

    [2] = {
        coords = vector4(-602.7222, -1084.5487, 22.1796, 52.6197),
        models = {
            baseModel ='rodeoarena',
            bullModel = 'bull',
        },
    },
}

Config.Lang = {
    lang_drawtext            = '~INPUT_CONTEXT~ Rodeo Oyna ~n~~INPUT_DETONATE~ Skor Tablosu',
    lang_nomoney             = 'Yeterli nakit paran yok',
    lang_truebull            = 'Bu şu anda kullanımda, bitmesini bekle',
    lang_score               = 'Rodeo Puanı: ',
    lang_blipname            = 'Rodeo',
    lang_target_rodeo        = "Rodeo Oyna",
    lang_target_leaderboard  = "Skor Tablosu",
    
}