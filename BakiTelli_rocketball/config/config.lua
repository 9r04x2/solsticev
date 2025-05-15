Config = {}

-- Framework Settings
Config.Framework = "auto"  -- Which framework to use: auto, esx, or qb

-- Language Settings
Config.Languages = "tr"-- "en", "es", "ru", "de", "fr", "pt", "pl", "hu", "gr", "nl", "ro", "tr", "ar", "zh", "he"

-- Lobby Settings
Config.DefaultLobbyName = "SOLSICE"  -- Default name for new lobbies
Config.NameNumber = 4  -- Number of characters required for lobby names
Config.LobbyCoolDown = 10000  -- Cooldown between creating lobbies (ms)

-- UI Assets
Config.Logo = "./imgs/logo.png"  -- Path to logo image
Config.DefaultProfile = "./imgs/default_profile.png"  -- Default player profile image
Config.Sound = true  -- true/false sound

-- Game Models
Config.Models = {
    Car = "rcsultanrs",  -- Vehicle model for players
    Ball = "rl_top_new",  -- Ball model
    BoostMini = "rl_boostmini",  -- Small boost pickup model
    BoostBig = "rl_boostbig",  -- Large boost pickup model
}

-- Boost Pickup Settings
Config.BoostRespawnTime = {
    BigBoost = 10000,    -- Large boost respawn time (ms)
    NormalBoost = 5000   -- Small boost respawn time (ms)
}

Config.BoostPower = {
    BigBoost = 15,      -- Large boost power (15%)
    NormalBoost = 5     -- Small boost power (5%)
}

-- Goal Effects 
Config.GoalEffects = {
	EffectUse = true,
    name = 'proj_indep_firework_v2', 
	child = 'scr_firework_indep_repeat_burst_rwb'
}

-- Game Areas
Config.StartArea = {
    {
        AreaCoord = vector3(-283.19, -1923.55, 29.95),  -- Starting area 1
    },
}

-- Map Configuration
Config.Map = {
    {
        MapName = "Rocket Arena",  -- Display name of the map
        MapImg = "./imgs/map_image.png",  -- Map preview image
        Area = vector3(-3867.33472, -1271.55664, 317.244757),  -- Map center
        Distance = 45,  -- Map radius/boundary
        
        -- Team Spawn Points
        TeamArea = {
            Orange = {  -- Orange team spawns
                [1] = vector4(-3875.31, -1296.85, 316.65, 0.57),
                [2] = vector4(-3872.15, -1296.85, 316.65, 0.57),
                [3] = vector4(-3867.26, -1296.85, 316.65, 0.57),
                [4] = vector4(-3862.14, -1296.85, 316.65, 0.57),
                [5] = vector4(-3858.66, -1296.85, 316.65, 0.57),
            },
            Blue = {  -- Blue team spawns
                [1] = vector4(-3857.69, -1246.0, 316.65, 186.86),
                [2] = vector4(-3862.28, -1246.0, 316.65, 186.86),
                [3] = vector4(-3867.13, -1246.0, 316.65, 186.86),
                [4] = vector4(-3872.0, -1246.0, 316.65, 186.86),
                [5] = vector4(-3876.08, -1246.0, 316.65, 186.86),
            },
        }
    }
}

-- Goal Areas (Polyzone)
Config.GoalArea = {
    Blue = {  -- Blue team goal area
        vector2(-3872.7424316406, -1241.6300048828),
        vector2(-3860.802734375, -1241.5113525391),
        vector2(-3863.2634277344, -1235.2847167969),
        vector2(-3873.6787109375, -1236.6865234375)
    },
    Orange = {  -- Orange team goal area
        vector2(-3872.724609375, -1301.5133056641),
        vector2(-3862.39875, -1301.4616699219),
        vector2(-3861.812109375, -1306.1696044922),
        vector2(-3872.5253417969, -1306.1696044922)
    }
}

-- Boost Pickup Locations
Config.SkillDetail = {
    BigSkill = {  -- Large boost locations
        [1] = vector3(-3883.85, -1248.07, 317.73),
        [2] = vector3(-3850.81, -1248.07, 317.73),
        [3] = vector3(-3847.98, -1271.62, 317.73),
        [4] = vector3(-3886.52, -1271.62, 317.73),
        [5] = vector3(-3850.79, -1295.12, 317.73),
        [6] = vector3(-3883.87, -1295.12, 317.73),
    },
	NormalSkill = { -- Normal Boost Skill Detail
		[1] = vector3(-3876.83, -1295.75, 317.71),
		[2] = vector3(-3867.28, -1296.14, 317.71),
		[3] = vector3(-3857.68, -1295.74, 317.71),
		[4] = vector3(-3862.21, -1290.67, 317.71),
		[5] = vector3(-3872.27, -1290.74, 317.71),
		[6] = vector3(-3886.51, -1285.96, 317.71),
		[7] = vector3(-3876.83, -1284.98, 317.71),
		[8] = vector3(-3867.26, -1287.92, 317.71),
		[9] = vector3(-3857.64, -1284.91, 317.71),
		[10] = vector3(-3847.98, -1286.04, 317.71),
		[11] = vector3(-3856.29, -1277.46, 317.71),
		[12] = vector3(-3867.29, -1277.41, 317.71),
		[13] = vector3(-3878.24, -1277.53, 317.71),
		[14] = vector3(-3872.72, -1271.59, 317.71),
		[15] = vector3(-3861.72, -1271.56, 317.71),
		[16] = vector3(-3856.28, -1265.68, 317.71),
		[17] = vector3(-3867.37, -1265.68, 317.71),
		[18] = vector3(-3878.24, -1265.62, 317.71),
		[19] = vector3(-3886.5, -1257.1, 317.71),
		[20] = vector3(-3876.86, -1258.2, 317.71),
		[21] = vector3(-3867.22, -1255.26, 317.71),
		[22] = vector3(-3857.66, -1258.21, 317.71),
		[23] = vector3(-3848.04, -1257.14, 317.71),
		[24] = vector3(-3862.22, -1252.46, 317.71),
		[25] = vector3(-3872.36, -1252.36, 317.71),
		[26] = vector3(-3876.94, -1247.31, 317.71),
		[27] = vector3(-3867.23, -1247.02, 317.71),
		[28] = vector3(-3857.58, -1247.36, 317.71),
	}
}

-- Control Settings
Config.Key = {
    JumpCar = "E",      -- Key for jumping
    BarrelRoll = "B",   -- Key for barrel roll (shoot!)
    TurnOver = "G",     -- Key to flip car
    Nitro = "LEFTSHIFT" -- Key for boost/nitro
}

-- Ball Physics Settings
Config.BallSettings = {
    ShootForce = { -- Barrel Roll Force
        min = 35.0,
        max = 50.0
    },
    ShootUpwardForce = 0.4, -- Barrel Roll Upward Force
    RideForce = { -- Ride Force
        min = 2.0,
        max = 15.0
    },
    RideUpwardForce = 0.3 -- Ride Upward Force
}

-- Game Mechanics Settings
Config.GameSettings = {
    -- nitro settings
    maxNitroAmount = 100.0,      -- Maximum nitro storage
    nitroRegenRate = 5.0,        -- Nitro regeneration rate
    DefaultNitroAmount = 25.0,   -- Starting nitro amount
    nitroDepletionRate = 15.0,   -- Nitro usage rate
    nitroPower = 0.9,           -- Ground boost power
    airNitroPower = 0.5,        -- Air boost power
    nitroUpdateCooldown = 300,  -- UI update frequency (ms)
    boostRespawnTime = 10000,   -- Boost pickup respawn time (ms)

    -- jump settings
    maxJumps = 2,               -- Max jumps before landing
    jumpForce = 9.5,           -- Initial jump force
    doubleJumpForce = 11.0,     -- Second jump force
    doubleJumpDuration = 500,   -- Landing stabilization time (ms)

    -- flip settings
    flipCooldown = 3000,        -- Time between flips (ms)
    flipDuration = 1000,        -- Flip animation time (ms)

    -- air control settings
    airControlForce = 0.15,     -- Air control strength

    -- barrel roll settings
    barrelRollDuration = 1000,  -- Roll animation time (ms)
    barrelRollCooldown = 2000,  -- Time between rolls (ms)

    -- other settings
    fixTime = 2500,  -- Time between fixes (car fixed and area cleared) (ms)
    fuelUpdateInterval = 15000,  -- Fuel update interval (ms)
}

-- Visual Markers
Config.Markers = {
    CarBall = {
        Type = 21,
        Size = {x = 1.0, y = 1.0, z = 0.5},
        Color = {r = 255, g = 255, b = 255},
    },
}

-- Map Blips
Config.Blips = {
    Blips = true,  -- Enable/disable blips
    CarBall = {
        Sprite = 380,
        Scale = 0.7,
        Colour = 4,
    }
}
