Config = {}

Config.Objects = {
    ['cone'] = {model = `prop_roadcone02a`, freeze = false},
    ['barrier'] = {model = `prop_barrier_work06a`, freeze = true},
    ['roadsign'] = {model = `prop_snow_sign_road_06g`, freeze = true},
    ['tent'] = {model = `prop_gazebo_03`, freeze = true},
    ['light'] = {model = `prop_worklight_03b`, freeze = true},
}

Config.HandCuffItem = 'handcuffs'

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.Locations = {
    ['duty'] = {
        [1] = vector3(441.91, -982.01, 30.35),
        [2] = vector3(-447.51, 6013.5, 32.4),
    },
    ['stash'] = {
        [1] = vector3(485.5, -994.93, 30.62),
        [2] = vector3(-446.09, 6018.89, 36.99),
        [3] = vector3(836.12, -1287.18, 28.25),
        [4] = vector3(380.56, 799.78, 190.46),
        [5] = vector3(1839.94, 3684.86, 33.94),
        [6] = vector3(364.94, -1599.07, 25.47),
        [7] = vector3(-560.86, -185.67, 38.31),
        [8] = vector3(306.49, -601.83, 43.28),

        
    },
    ['trash'] = {
        [1] = vector3(474.36, -995.4, 26.27),
        [2] = vector3(-449.24, 6012.92, 36.86),
        [3] = vector3(848.53, -1313.42, 28.21),
        [4] = vector3(387.24, 799.89, 187.36),
        [5] = vector3(1836.95, 3685.15, 33.68),
        [6] = vector3(360.89, -1600.06, 25.45),
        [7] = vector3(-553.24, -181.3, 37.94),
    },
}

Config.PoliceHelicopter = '2vd_supervolito'