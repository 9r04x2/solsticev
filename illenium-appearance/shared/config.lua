Config = {}

Config.Debug = false

Config.ClothingCost = 25
Config.BarberCost = 25
Config.TattooCost = 50
Config.SurgeonCost = 500

Config.ChargePerTattoo = true -- Charge players per tattoo. Config.TattooCost will become the cost of 1 tattoo. The cost can be overridden by adding `cost` key in shared/tattoos.lua for specific tattoos

-- Only set this to true if you're using rcore_tattoos
Config.RCoreTattoosCompatibility = false

Config.AsynchronousLoading = false -- Change this to false if you want the NUI data to load before displaying the appearance UI

Config.UseTarget = false

Config.TextUIOptions = {
    key = "F3"
}

Config.NotifyOptions = {
    position = "top-right"
}

Config.OutfitCodeLength = 10

Config.UseRadialMenu = true
Config.UseOxRadial = false -- Set to true to use ox_lib radial menu, both this and UseRadialMenu must be true 

Config.EnablePedsForShops = true
Config.EnablePedsForClothingRooms = true
Config.EnablePedsForPlayerOutfitRooms = true

Config.EnablePedMenu = true
Config.PedMenuGroup = "qbcore.mod"

Config.EnableJobOutfitsCommand = false -- Enables /joboutfits and /gangoutfits commands

Config.ShowNearestShopOnly = false
Config.HideRadar = false -- Hides the minimap while the appearance menu is open
Config.NearestShopBlipUpdateDelay = 10000

Config.InvincibleDuringCustomization = true

Config.PreventTrackerRemoval = true -- Disables "Scarf and Chains" section if the player has tracker
Config.TrackerClothingOptions = {
    drawable = 13,
    texture = 0
}

Config.NewCharacterSections = {
    Ped = false,
    HeadBlend = true,
    FaceFeatures = true,
    HeadOverlays = true,
    Components = true,
    Props = true,
    Tattoos = true
}

Config.GenderBasedOnPed = true

Config.AlwaysKeepProps = false

Config.PersistUniforms = false -- Keeps Job / Gang Outfits on player reconnects / logout
Config.OnDutyOnlyClothingRooms = false -- Set to `true` to make the clothing rooms accessible only to players who are On Duty

Config.BossManagedOutfits = false -- Allows Job / Gang bosses to manage their own job / gang outfits

Config.ReloadSkinCooldown = 5000

Config.AutomaticFade = false -- Enables automatic fading and hides the Fade section from Hair

-- ACE Permissions Config
Config.EnableACEPermissions = false
Config.ACEResetCooldown = 5000
Config.ACEListCooldown = 60 * 60 * 1000 -- 1 Hour

Config.DisableComponents = {
    Masks = false,
    UpperBody = false,
    LowerBody = false,
    Bags = false,
    Shoes = false,
    ScarfAndChains = false,
    BodyArmor = false,
    Shirts = false,
    Decals = false,
    Jackets = false
}

Config.DisableProps = {
    Hats = false,
    Glasses = false,
    Ear = false,
    Watches = false,
    Bracelets = false
}

Config.Blips = {
    ["clothing"] = {
        Show = true,
        Sprite = 366,
        Color = 47,
        Scale = 0.7,
        Name = "Kıyafetci",
    },
    ["barber"] = {
        Show = true,
        Sprite = 71,
        Color = 0,
        Scale = 0.7,
        Name = "Barber",
    },
    ["tattoo"] = {
        Show = false,
        Sprite = 75,
        Color = 4,
        Scale = 0.7,
        Name = "Tattoo Shop",
    },
    ["surgeon"] = {
        Show = false,
        Sprite = 102,
        Color = 4,
        Scale = 0.7,
        Name = "Plastic Surgeon",
    }
}

Config.TargetConfig = {
    ["clothing"] = {
        model = "s_f_m_shop_high",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-tshirt",
        label = "Open Clothing Store",
        distance = 3
    },
    ["barber"] = {
        model = "s_m_m_hairdress_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-scissors",
        label = "Open Barber Shop",
        distance = 3
    },
    ["tattoo"] = {
        model = "u_m_y_tattoo_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-pen",
        label = "Open Tattoo Shop",
        distance = 3
    },
    ["surgeon"] = {
        model = "s_m_m_doctor_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-scalpel",
        label = "Doktor İle Konus",
        distance = 3
    },
    ["clothingroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Open Job / Gang Clothes Menu",
        distance = 3
    },
    ["playeroutfitroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Open Outfits Menu",
        distance = 3
    },
}

Config.Stores = {
    {
        type = "clothing",
        coords = vector4(1693.2, 4828.11, 42.07, 188.66),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false, -- false => uses the size + rotation to create the zone | true => uses points to create the zone
        showBlip = false, -- overrides the blip visibilty configured above for the group
        --targetModel = "s_m_m_doctor_01", -- overrides the target ped configured for the group
        --targetScenario = "" -- overrides the target scenario configure for the group
        points = {
            vector3(1686.9018554688, 4829.8330078125, 42.07),
            vector3(1698.8566894531, 4831.4604492188, 42.07),
            vector3(1700.2448730469, 4817.7734375, 42.07),
            vector3(1688.3682861328, 4816.2954101562, 42.07)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1063.43, -249.11, 44.02, 29.99),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1062.01, -249.86, 44.02),
            vector3(-1063.96, -250.7, 44.27),
            vector3(-1065.15, -248.38, 44.02),
            vector3(-1063.3, -247.54, 44.02)
        }
    },
    {
        type = "clothing",
        coords = vector4(-705.5, -149.22, 37.42, 122),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-719.86212158203, -147.83151245117, 37.42),
            vector3(-709.10491943359, -141.53076171875, 37.42),
            vector3(-699.94342041016, -157.44494628906, 37.42),
            vector3(-710.68774414062, -163.64665222168, 37.42)
        }
    },
    {
        type = "barber",
        coords = vector4(-31.77, 268.34, 94.95, 258.89),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-32.77, 266.47, 94.95),
            vector3(-31.86, 271.41, 94.95),
            vector3(-29.22, 271.29, 94.95),
            vector3(-30.15, 265.96, 94.95)
        }
    },
    {
        type = "clothing",
        coords = vector4(-26.1, 275.82, 94.95, 87.35),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-24.76, 276.93, 94.95),
            vector3(-25.38, 274.0, 94.95),
            vector3(-27.89, 274.5, 94.95),
            vector3(-27.71, 277.55, 94.95)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1192.61, -768.4, 17.32, 216.6),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1206.9552001953, -775.06304931641, 17.32),
            vector3(-1190.6080322266, -764.03198242188, 17.32),
            vector3(-1184.5672607422, -772.16949462891, 17.32),
            vector3(-1199.24609375, -783.07928466797, 17.32)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1797.37, 426.7315, 128.50, 357.2),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1797.28, 424.8950, 128.50),
            vector3(-1798.12, 425.0150, 128.50),
            vector3(-1797.92, 427.5491, 128.50),
            vector3(-1796.78, 427.6994, 128.50)
        }
    },
    {
        type = "clothing",
        coords = vector4(-823.9276, -1236.3263, 7.3374, 221.1015),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-822.9107, -1236.1552, 7.3374),
            vector3(-823.8920, -1238.0897, 7.3374),
            vector3(-825.9906, -1237.9534, 7.7639),
            vector3(-825.2718, -1235.7317, 7.3374)
        }
    },
    {
        type = "clothing",
        coords = vector4(427.3211, -1505.15, 29.316, 25.96),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(427.6312, -1504.79, 29.316),
            vector3(426.5865, -1505.50, 29.316),
            vector3(426.2930, -1503.60, 29.316)
        }
    },
    {
        type = "clothing",
        coords = vector4(629.1227, 1.7844, 76.6281, 160.4497),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(628.8805, 1.0350, 76.6281),
            vector3(628.5409, 2.2352, 76.6281),
            vector3(629.1646, 3.9836, 76.6281)
        }
    },
    {
        type = "clothing",
        coords = vector4(857.2564, -174.1698, 78.4668, 151.5098),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(858.9838, -174.5682, 78.4668),
            vector3(857.6474, -175.2760, 78.4668),
            vector3(856.5785, -174.3044, 78.4668)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1797.37, 426.7315, 128.50, 357.2),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1797.28, 424.8950, 128.50),
            vector3(-1798.12, 425.0150, 128.50),
            vector3(-1797.92, 427.5491, 128.50),
            vector3(-1796.78, 427.6994, 128.50)
        }
    },
    {
        type = "clothing",
        coords = vector4(1539.0420, 810.7346, 77.6559, 235.7715),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(1537.6999511719,809.19940185547,77.377464294434),
            vector3(1537.6600341797,812.00897216797,76.655807495117),
            vector3(1539.91015625,811.69555664062,77.470458984375),
            vector3(1540.7075195312,809.56280517578,76.655807495117)
        }
    },
    {
        type = "clothing",
        coords = vector4(-600.76, -708.91, 121.6, 178.22),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-599.57, -707.51, 121.6),
            vector3(-602.3, -707.39, 121.6),
            vector3(-599.82, -711.84, 121.6),
            vector3(-601.71, -711.75, 121.6)
        }
    },
    {
        type = "clothing",
        coords = vector4(425.91, -801.03, 29.49, 177.79),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(419.55020141602, -798.36547851562, 29.49),
            vector3(431.61773681641, -798.31909179688, 29.49),
            vector3(431.19784545898, -812.07122802734, 29.49),
            vector3(419.140625, -812.03594970703, 29.49)
        }
    },
    {
        type = "clothing",
        coords = vector4(1393.78, 1147.80, 117.52, 359.95),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(1395.30, 1149.97, 117.49),
            vector3(1395.50, 1144.13, 117.49),
            vector3(1391.07, 1144.17, 117.49),
            vector3(1391.29, 1150.19, 117.49)
        }
    }, -- Kara
    {
        type = "clothing",
        coords = vector4(-168.73, -301.41, 39.73, 238.67),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-160.82145690918, -313.85919189453, 39.73),
            vector3(-172.56513977051, -309.82858276367, 39.73),
            vector3(-166.5775604248, -292.48077392578, 39.73),
            vector3(-154.84906005859, -296.51647949219, 39.73)
        }
    },
    {
        type = "clothing",
        coords = vector4(-3009.64, 2178.82, 45.10, 31.92),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-3009.63, 2178.80, 45.10),
            vector3(-3010.64, 2180.03, 45.10),
            vector3(-3008.39, 2179.15, 45.10),
            vector3(-3008.50, 2178.18, 45.10)
        }
    },
    {
        type = "clothing",
        coords = vector4(75.39, -1398.28, 29.38, 6.73),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(81.406135559082, -1400.7791748047, 29.38),
            vector3(69.335029602051, -1400.8251953125, 29.38),
            vector3(69.754981994629, -1387.078125, 29.38),
            vector3(81.500122070312, -1387.3002929688, 29.38)
        }
    },
    {
        type = "clothing",
        coords = vector4(1138.78, -1538.73, 35.03, 282.15),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(1137.61, -1540.87, 35.03),
            vector3(1140.4, -1540.97, 35.03),
            vector3(1140.42, -1538.19, 35.03),
            vector3(1137.66, -1538.19, 35.03)
        }
    },
    {   -- Yoto
        type = "clothing",
        coords = vector4(-24.84, -1394.23, 33.39, 90.2),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-26.67, -1395.26, 33.39),
            vector3(-26.47, -1393.65, 33.39),
            vector3(-24.71, -1393.59, 33.39),
            vector3(-24.61, -1395.3, 33.39)
        }
    },
    {   -- burger
    type = "clothing",
    coords = vector4(-1204.57, -891.99, 14.0, 209.8),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(-1206.34, -890.8, 14.0),
        vector3(-1205.24, -890.13, 14.0),
        vector3(-1203.05, -892.39, 14.0),
        vector3(-1204.53, -893.66, 14.0)
    }
    },
    {   -- ev
    type = "clothing",
    coords = vector4(-2674.32, 1306.15, 152.01, 359.13),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(-2675.73, 1308.69, 152.01),
        vector3(-2675.56, 1303.48, 152.01),
        vector3(-2672.95, 1303.62, 152.01),
        vector3(-2672.97, 1308.58, 152.01)
    }
    },
    {   -- tiki
    type = "clothing",
    coords = vector4(-1151.35, -1693.21, 4.36, 39.33),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(-1151.49, -1687.84, 4.37),
        vector3(-1148.23, -1694.02, 4.36),
        vector3(-1151.92, -1696.25, 4.34),
        vector3(-1155.71, -1691.24, 4.37)
    }
    },
    {
        type = "clothing",
        coords = vector4(-827.39, -1075.93, 11.33, 294.31),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-826.26251220703, -1082.6293945312, 11.33),
            vector3(-832.27856445312, -1072.2819824219, 11.33),
            vector3(-820.16442871094, -1065.7727050781, 11.33),
            vector3(-814.08953857422, -1076.1878662109, 11.33)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1445.86, -240.78, 49.82, 36.17),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1448.4829101562, -226.39401245117, 49.82),
            vector3(-1439.2475585938, -234.70428466797, 49.82),
            vector3(-1451.5389404297, -248.33193969727, 49.82),
            vector3(-1460.7554931641, -240.02815246582, 49.82)
        }
    },
    {
        type = "clothing",
        coords = vector4(9.22, 6515.74, 31.88, 131.27),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(6.4955291748047, 6522.205078125, 31.88),
            vector3(14.737417221069, 6513.3872070312, 31.88),
            vector3(4.3691010475159, 6504.3452148438, 31.88),
            vector3(-3.5187695026398, 6513.1538085938, 31.88)
        }
    },
    {
        type = "clothing",
        coords = vector4(615.35, 2762.72, 42.09, 170.51),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(612.58312988281, 2747.2814941406, 42.09),
            vector3(612.26214599609, 2767.0520019531, 42.09),
            vector3(622.37548828125, 2767.7614746094, 42.09),
            vector3(623.66833496094, 2749.5180664062, 42.09)
        }
    },
    {--redroses
        type = "clothing",
        coords = vector4(2514.78, 4099.2, 35.59, 155.81),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(2514.95, 4103.1, 35.59),
            vector3(2520.48, 4100.18, 35.59),
            vector3(2517.06, 4093.96, 35.59),
            vector3(2511.27, 4095.71, 35.59)
        }
    },
    {
        type = "clothing",
        coords = vector4(931.78, -1463.57, 33.94, 180.34),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(932.81, -1464.89, 33.61),
            vector3(930.52, -1465.2, 33.61),
            vector3(930.7, -1460.3, 33.61),
            vector3(932.84, -1461.5, 33.61)
        }
    },
    {
        type = "clothing",
        coords = vector4(1191.61, 2710.91, 38.22, 269.96),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(1188.7923583984, 2704.2021484375, 38.22),
            vector3(1188.7498779297, 2716.2661132812, 38.22),
            vector3(1202.4979248047, 2715.8479003906, 38.22),
            vector3(1202.3558349609, 2703.9294433594, 38.22)
        }
    },
    {
        type = "clothing",
        coords = vector4(-3171.32, 1043.56, 20.86, 334.3),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-3162.0075683594, 1056.7303466797, 20.86),
            vector3(-3170.8247070312, 1039.0412597656, 20.86),
            vector3(-3180.0979003906, 1043.1201171875, 20.86),
            vector3(-3172.7292480469, 1059.8623046875, 20.86)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1105.52, 2707.79, 19.11, 317.19),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1103.3004150391, 2700.8195800781, 19.11),
            vector3(-1111.3771972656, 2709.884765625, 19.11),
            vector3(-1100.8548583984, 2718.638671875, 19.11),
            vector3(-1093.1976318359, 2709.7365722656, 19.11)
        }
    },
    {
        type = "clothing",
        coords = vector4(461.7, -998.96, 30.69, 269.87),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(457.67, -999.77, 30.69),
            vector3(459.44, -995.74, 30.69),
            vector3(463.9, -995.94, 30.69),
            vector3(464.0, -999.75, 30.93)
        }
    },
    {
        type = "clothing",
        coords = vector4(301.36, -599.31, 43.28, 343.72),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(299.47, -594.72, 43.72),
            vector3(303.68, -596.19, 43.28),
            vector3(301.26, -600.55, 43.28),
            vector3(298.18, -599.44, 43.28)
        }
    },
    {
        type = "surgeon",
        coords = vector4(321.5943, -569.1595, 43.2841, 38.5236),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(323.7829, -565.8429, 43.2841),
            vector3(321.0915, -564.7163, 43.2841),
            vector3(317.3104, -572.7863, 43.2841),
            vector3(321.7248, -574.1146, 43.2841)
        }
    },
    {
        type = "clothing",
        coords = vector4(385.96, 793.88, 190.49, 351.51),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(388.06, 796.87, 190.49),
            vector3(384.78, 797.24, 190.49),
            vector3(385.19, 793.2, 190.49),
            vector3(387.33, 793.28, 190.61)
        }
    },
    {
        type = "clothing",
        coords = vector4(607.3153, -8.8776, 87.8173, 342.6254),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false, 
        showBlip = false,
        points = {
            vector3(606.4023, -7.7592, 87.8174),
            vector3(606.6218, -10.1984, 87.8173),
            vector3(607.9090, -8.9997, 87.8173),
            vector3(605.5071, -9.3944, 87.8173)
        }
    },
    {--soneklenen
        type = "clothing",
        coords = vector4(-1380.16, -470.16, 72.04, 97.49),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1381.8, -469.23, 72.04),
            vector3(-1381.58, -471.39, 72.04),
            vector3(-1378.45, -470.96, 72.04),
            vector3(-1378.84, -468.34, 72.04)
        }
    },
    {
        type = "clothing",
        coords = vector4(1839.92, 3679.83, 34.2, 329.08),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(1836.86, 3681.2, 34.19),
            vector3(1838.54, 3677.07, 34.19),
            vector3(1842.83, 3679.2, 34.19),
            vector3(1840.93, 3683.44, 34.19)
        }
    },
    {
        type = "clothing",
        coords = vector4(-439.3, 6011.18, 37.0, 133.2),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-439.01, 6007.51, 37.0),
            vector3(-441.52, 6010.03, 37.0),
            vector3(-438.14, 6012.65, 37.0),
            vector3(-436.01, 6010.51, 37.0)
        }
    },
    {
        type = "clothing",
        coords = vector4(-1119.24, -1440.6, 5.23, 300.5),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1124.5535888672, -1444.5367431641, 5.23),
            vector3(-1118.7023925781, -1441.0450439453, 5.23),
            vector3(-1121.2891845703, -1434.8474121094, 5.23),
            vector3(-1128.4727783203, -1439.8254394531, 5.23)
        }
    },
    {
        type = "clothing",
        coords = vector4(124.82, -224.36, 54.56, 335.41),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(133.60948181152, -210.31390380859, 54.56),
            vector3(125.8349609375, -228.48097229004, 54.56),
            vector3(116.3140335083, -225.02020263672, 54.56),
            vector3(122.56930541992, -207.83396911621, 54.56)
        }
    },
    {
        type = "clothing",
        coords = vector4(-2306.02, 351.51, 174.59, 22.64),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-2308.35, 352.91, 174.59),
            vector3(-2304.51, 354.58, 174.59),
            vector3(-2303.47, 351.06, 174.59),
            vector3(-2306.05, 349.95, 174.59)
        }
    },
    {
        type = "clothing",
        coords = vector4(-587.17, -1050.29, 22.34, 90.25),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-589.15, -1051.67, 22.34),
            vector3(-588.63, -1048.98, 22.34),
            vector3(-586.63, -1049.02, 22.34),
            vector3(-587.03, -1050.51, 22.34)
        }
    },
    {
        type = "clothing",
        coords = vector4(19.98, -1602.13, 29.38, 120.71),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(19.72, -1600.6, 29.38),
            vector3(18.04, -1602.58, 29.38),
            vector3(20.01, -1603.43, 29.39),
            vector3(20.76, -1602.56, 29.87)
        }
    },
    { --lostmc
        type = "clothing",
        coords = vector4(1979.71, 3046.16, 47.21, 336.41),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(1979.13, 3049.28, 47.21),
            vector3(1983.45, 3046.66, 47.21),
            vector3(1980.19, 3043.11, 47.21),
            vector3(1975.92, 3045.2, 47.21)
        }
    },    
    {
        type = "clothing",
        coords = vector4(940.0, 0.83, 111.28, 144.1),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(941.74, 1.41, 111.28),
            vector3(940.71, -0.52, 111.28),
            vector3(938.37, 1.06, 111.28),
            vector3(939.61, 2.85, 111.28)
        }
    },
    {
        type = "clothing",
        coords = vector4(-67.23, 827.67, 231.33, 0.83),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-67.23, 827.67, 231.33),
            vector3(-68.06, 828.94, 231.33),
            vector3(-65.63, 827.56, 231.33),
            vector3(-66.71, 826.93, 231.33)
        }
    },
    {
        type = "clothing",
        coords = vector4(-567.18, 280.11, 82.98, 263.88),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-565.72, 279.32, 82.98),
            vector3(-565.63, 280.42, 82.97),
            vector3(-568.94, 279.61, 82.98),
            vector3(-568.85, 280.64, 82.98)
        }
    },
    {
        type = "clothing",
        coords = vector4(362.37, -1593.48, 25.45, 229.63),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(362.2, -1590.84, 25.45),
            vector3(364.79, -1592.94, 25.45),
            vector3(362.23, -1595.98, 25.55),
            vector3(359.87, -1593.76, 25.45)
        }
    },
    { -- state
    type = "clothing",
    coords = vector4(845.22, -1283.5, 24.32, 359.94),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(844.24, -1281.7, 24.32),
        vector3(847.34, -1281.55, 24.32),
        vector3(847.32, -1287.0, 24.32),
        vector3(844.6, -1286.88, 24.32)
        }
    },
    { -- sinnotes isimsiz
    type = "clothing",
    coords = vector4(985.53, -91.98, 74.85, 173.97),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(985.53, -91.99, 74.84),
        vector3(983.78, -92.13, 74.85)
        }
    },
    { -- Sugar Mek
    type = "clothing",
    coords = vector4(-601.7536, -915.4221, 23.8866, 219.3455),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(-602.8837, -916.1937, 23.8866),
        vector3(-602.3320, -914.8600, 23.8866)
        }
    },
    { -- sinnotes isimsiz
    type = "clothing",
    coords = vector4(960.33, -1568.64, 30.74, 244.73),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(960.33, -1568.64, 30.74),
        vector3(959.48, -1569.92, 30.74)
        }
    },
    { -- soneklenen
    type = "clothing",
    coords = vector4(-162.31, -1612.58, 33.65, 329.53),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(-163.33, -1611.29, 33.65),
        vector3(-160.94, -1611.79, 33.65),
        vector3(-161.59, -1613.48, 33.65),
        vector3(-163.63, -1612.74, 33.65)
        }
    },
    { -- soneklenen2
    type = "clothing",
    coords = vector4(-820.45, -683.48, 123.42, 84.58),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(-819.91, -682.21, 123.42),
        vector3(-819.87, -684.58, 123.42),
        vector3(-821.82, -684.67, 123.42),
        vector3(-821.73, -682.25, 123.42)
        }
    },
    { -- casinoiç
    type = "clothing",
    coords = vector4(966.12, 19.48, 71.46, 336.21),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(962.31, 23.51, 71.46),
        vector3(968.98, 25.07, 71.46),
        vector3(970.5, 17.88, 71.46),
        vector3(964.11, 15.78, 71.46)
        }
    },
    { -- Tiyatro
    type = "clothing",
    coords = vector4(211.31, 1168.51, 227.0, 276.16),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(210.54, 1165.19, 227.01),
        vector3(215.54, 1166.45, 227.2),
        vector3(214.3, 1172.12, 227.2),
        vector3(209.15, 1170.86, 227.0)
        }
    },
    { -- DOJ
        type = "clothing",
        coords = vector4(-535.69, -182.66, 43.37, 24.57),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-534.89, -182.44, 43.37),
            vector3(-535.36, -181.76, 43.37),
            vector3(-536.72, -182.32, 43.37),
            vector3(-536.21, -183.08, 43.37)
        }
    },
    { --vespucci
        type = "clothing",
        coords = vector4(593.91, 3.87, 82.74, 338.76),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(593.38, -0.49, 82.74),
            vector3(591.52, 0.08, 82.74),
            vector3(594.06, 6.55, 82.74),
            vector3(595.78, 6.26, 82.74)
        }
    },
    { --harmony
        type = "clothing",
        coords = vector4(-1195.48, 2642.53, 16.82, 291.55),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1194.12, 2645.4, 16.82),
            vector3(-1193.21, 2643.19, 16.82),
            vector3(-1197.13, 2639.64, 16.82),
            vector3(-1198.55, 2641.59, 16.82)
        }
    },    
    { --mechanic25
    type = "clothing",
    coords = vector4(-2080.02, -318.84, 4.85, 357.38),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(-2078.05, -314.44, 4.85),
        vector3(-2081.78, -314.05, 4.85),
        vector3(-2082.31, -318.77, 4.85),
        vector3(-2078.83, -319.16, 4.85)
    }
},
    { --bahama
    type = "clothing",
    coords = vector4(-1381.57, -635.22, 30.32, 305.39),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
            vector3(-1378.43, -635.18, 30.32),
            vector3(-1382.56, -637.87, 30.32),
            vector3(-1384.54, -635.47, 30.32),
            vector3(-1380.01, -632.92, 30.32)
        }
    },
    { -- pondcafe
    type = "clothing",
    coords = vector4(1115.82, -636.02, 56.82, 143.34),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
            vector3(1114.26, -635.4, 56.82),
            vector3(1116.72, -634.61, 56.82),
            vector3(1114.87, -637.76, 56.82),
            vector3(1117.25, -636.88, 56.82)
        }
    },
    { -- mekanik pincage
    type = "clothing",
    coords = vector4(564.23, -187.16, 59.07, 91.11),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
            vector3(564.23, -187.16, 59.07),
            vector3(561.43, -187.21, 59.07)
   
        }
    },
    { -- malikanee
    type = "clothing",
    coords = vector4(181.43, 1717.32, 231.07, 173.98),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
            vector3(181.93, 1719.88, 231.07),
            vector3(179.23, 1719.65, 231.07),
            vector3(179.23, 1715.38, 231.07),
            vector3(181.91, 1715.2, 231.07)
        }
    },
    { -- hastane2
    type = "clothing",
    coords = vector4(-1019.62, -421.67, 39.62, 19.13),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
            vector3(-1019.62, -421.67, 39.62),
            vector3(-1020.24, -419.90, 39.62),
            vector3(-1018.83, -420.70, 39.62),
            vector3(-1020.45, -421.89, 39.62)

        }
    },
    { --UNICORN
        type = "clothing",
        coords = vector4(135.47, -1291.95, 22.65, 198.26),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(133.31, -1290.43, 22.65),
            vector3(134.95, -1289.48, 22.65),
            vector3(137.37, -1293.47, 22.65),
            vector3(135.7, -1294.45, 22.65)
        }
    },
    { --box
    type = "clothing",
    coords = vector4(1022.1, -2186.66, 31.62, 87.26),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(1023.3, -2187.61, 31.62),
        vector3(1020.23, -2187.4, 31.62),
        vector3(1020.31, -2185.84, 31.62),
        vector3(1023.34, -2186.11, 31.62)
        }
    },
    { --okul
    type = "clothing",
    coords = vector4(-1729.17, 239.97, 61.74, 200.64),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(-1730.53, 240.2, 61.74),
        vector3(-1727.26, 234.73, 61.74),
        vector3(-1724.73, 236.22, 62.17),
        vector3(-1727.37, 241.63, 61.74)
        }
    },
    { --ranger
    type = "clothing",
    coords = vector4(384.82, 794.3, 187.68, 358.54),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(384.32, 793.78, 187.68),
        vector3(384.29, 795.91, 187.68),
        vector3(385.73, 795.68, 187.68),
        vector3(385.56, 793.79, 187.68)
        }
    },
    { --uwumotel
    type = "clothing",
    coords = vector4(-2940.2, 18.07, 7.96, 149.51),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(-2941.04, 19.59, 7.96),
        vector3(-2938.73, 18.47, 7.96),
        vector3(-2940.61, 14.7, 7.96),
        vector3(-2943.13, 15.31, 7.96)
        }
    },
    { --casinoüstiç
    type = "clothing",
    coords = vector4(975.25, 65.0, 116.16, 323.44),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(974.94, 62.64, 116.16),
        vector3(973.33, 63.78, 116.16),
        vector3(975.33, 66.99, 116.16),
        vector3(977.07, 66.02, 116.16)
        }
    },
    { --77club
    type = "clothing",
    coords = vector4(251.94, -3150.99, -0.19, 257.56),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(254.48, -3149.7, -0.15),
        vector3(254.54, -3153.38, -0.19),
        vector3(250.82, -3153.47, -0.19),
        vector3(250.46, -3150.18, -0.19)
        }
    },
    { --77club
    type = "clothing",
    coords = vector4(-602.0267, -915.1919, 23.8866, 254.3381),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(-602.0267, -915.1919, 23.8866),
        vector3(-602.3092, -916.3741, 23.8866),
        vector3(-601.0663, -915.1804, 23.8866),
        vector3(-602.6171, -914.0024, 23.8866)
        }
    },
    { --mazebankinorasi
    type = "clothing",
    coords = vector4(-78.84, -811.09, 243.39, 341.35),
    size = vector3(4, 4, 4),
    rotation = 161.64,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(-80.07, -807.96, 243.39),
        vector3(-76.77, -808.57, 243.39),
        vector3(-78.91, -812.87, 243.39),
        vector3(-81.21, -812.3, 243.39)
        }
    },
    { --yenishertiff
    type = "clothing",
    coords = vector4(1839.44, 3678.62, 38.94, 301.3),
    size = vector3(4, 4, 4),
    rotation = 160.64,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(1838.24, 3676.68, 38.93),
        vector3(1837.08, 3678.3, 38.95),
        vector3(1839.95, 3679.92, 38.94),
        vector3(1841.36, 3678.54, 38.93)
        }
    },
    { --outlaw
    type = "clothing",
    coords = vector4(1418.02, 3553.03, 36.71, 23.3),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(1416.96, 3552.77, 36.71),
        vector3(1418.97, 3553.48, 36.71),
        vector3(1417.88, 3555.49, 36.71),
        vector3(1415.97, 3554.65, 36.71)
    }
    },
    { --cast
    type = "clothing",
    coords = vector4(365.44, -1830.65, 28.47, 143.78),
    size = vector3(4, 4, 4),
    rotation = 143.78,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(368.67, -1829.99, 28.47),
        vector3(364.09, -1835.51, 28.47),
        vector3(360.06, -1831.73, 28.47),
        vector3(364.45, -1825.51, 28.47)
        }
    },
    { --cast2
    type = "clothing",
    coords = vector4(76.59, -1972.49, 20.75, 153.71),
    size = vector3(4, 4, 4),
    rotation = 143.78,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(76.59, -1970.86, 20.75),
        vector3(73.82, -1974.72, 20.75),
        vector3(76.93, -1977.46, 20.75),
        vector3(80.0, -1973.97, 20.75)
        }
    },
    { --flex
    type = "clothing",
    coords = vector4(-859.42, -239.23, 61.02, 112.99),
    size = vector3(4, 4, 4),
    rotation = 143.78,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(-859.2, -243.06, 61.02),
        vector3(-862.12, -237.46, 61.02),
        vector3(-858.43, -235.96, 61.02),
        vector3(-856.14, -239.63, 61.02)
        }
    },
    { --casinoüstiç
    type = "barber",
    coords = vector4(953.68, 16.37, 117.36, 202.27),
    size = vector3(4, 4, 4),
    rotation = 45,
    usePoly = false,
    showBlip = false,
    points = {
        vector3(950.26, 16.13, 117.36),
        vector3(952.76, 17.99, 117.36),
        vector3(956.3, 16.83, 117.36),
        vector3(954.6, 13.87, 117.36)
    }
    },
    { --UNICORN
        type = "barber",
        coords = vector4(139.57, -1289.64, 22.65, 205.24),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(137.3, -1289.01, 22.65),
            vector3(139.6, -1287.7, 22.65),
            vector3(141.15, -1290.54, 22.65),
            vector3(139.11, -1292.0, 22.65)
        }
    },
    { --bahama
        type = "barber",
        coords = vector4(-1378.03, -632.52, 30.32, 265.87),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1378.17, -634.96, 30.32),
            vector3(-1379.63, -632.33, 30.32),
            vector3(-1377.36, -630.74, 30.32),
            vector3(-1375.67, -633.18, 30.32)
        }
    },
    {
        type = "barber",
        coords = vector4(-814.22, -183.7, 37.57, 116.91),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-825.06127929688, -182.67497253418, 37.57),
            vector3(-808.82415771484, -179.19134521484, 37.57),
            vector3(-808.55261230469, -184.9720916748, 37.57),
            vector3(-819.77899169922, -191.81831359863, 37.57)
        }
    },
    {
        type = "barber",
        coords = vector4(136.78, -1708.4, 29.29, 144.19),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(132.57008361816, -1710.5053710938, 29.29),
            vector3(138.77899169922, -1702.6778564453, 29.29),
            vector3(142.73052978516, -1705.6853027344, 29.29),
            vector3(135.49719238281, -1712.9750976562, 29.29)
        }
    },
    {
        type = "barber",
        coords = vector4(-1282.57, -1116.84, 6.99, 89.25),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-1287.4735107422, -1115.4364013672, 6.99),
            vector3(-1277.5638427734, -1115.1229248047, 6.99),
            vector3(-1277.2469482422, -1120.1147460938, 6.99),
            vector3(-1287.4561767578, -1119.2506103516, 6.99)
        }
    },
    {
        type = "barber",
        coords = vector4(1931.41, 3729.73, 32.84, 212.08),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(1932.4931640625, 3725.3374023438, 32.84),
            vector3(1927.2720947266, 3733.7663574219, 32.84),
            vector3(1931.4379882812, 3736.5327148438, 32.84),
            vector3(1936.0697021484, 3727.2839355469, 32.84)
        }
    },
    {
        type = "barber",
        coords = vector4(1212.8, -472.9, 65.2, 60.94),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(1208.3327636719, -469.84338378906, 65.2),
            vector3(1217.9066162109, -472.40216064453, 65.2),
            vector3(1216.9870605469, -477.00939941406, 65.2),
            vector3(1206.1077880859, -473.83499145508, 65.2)
        }
    },
    {
        type = "barber",
        coords = vector4(-32.9, -152.3, 56.1, 335.22),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-29.730783462524, -148.67495727539, 56.1),
            vector3(-32.919719696045, -158.04254150391, 56.1),
            vector3(-37.612594604492, -156.62759399414, 56.1),
            vector3(-33.30192565918, -147.31649780273, 56.1)
        }
    },
    {
        type = "barber",
        coords = vector4(-278.1, 6228.5, 30.7, 49.32),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        showBlip = false,
        points = {
            vector3(-280.29818725586, 6232.7265625, 30.7),
            vector3(-273.06427001953, 6225.9692382812, 30.7),
            vector3(-276.25280761719, 6222.4013671875, 30.7),
            vector3(-282.98211669922, 6230.015625, 30.7)
        }
    },
    {
        type = "tattoo",
        coords = vector4(1322.6, -1651.9, 51.2, 42.47),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1323.9360351562, -1649.2370605469, 51.2),
            vector3(1328.0186767578, -1654.3087158203, 51.2),
            vector3(1322.5780029297, -1657.7045898438, 51.2),
            vector3(1319.2043457031, -1653.0885009766, 51.2)
        }
    },
    {
        type = "tattoo",
        coords = vector4(-1154.01, -1425.31, 4.95, 23.21),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-1152.7110595703, -1422.8382568359, 4.95),
            vector3(-1149.0043945312, -1428.1975097656, 4.95),
            vector3(-1154.6730957031, -1431.1898193359, 4.95),
            vector3(-1157.7064208984, -1426.3433837891, 4.95)
        }
    },
    {
        type = "tattoo",
        coords = vector4(322.62, 180.34, 103.59, 156.2),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(319.28741455078, 179.9383392334, 103.59),
            vector3(321.537109375, 186.04516601562, 103.59),
            vector3(327.24526977539, 183.12303161621, 103.59),
            vector3(325.01351928711, 177.8542175293, 103.59)
        }
    },
    {
        type = "tattoo",
        coords = vector4(-3169.52, 1074.86, 20.83, 253.29),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-3169.5861816406, 1072.3740234375, 20.83),
            vector3(-3175.4802246094, 1075.0703125, 20.83),
            vector3(-3172.2041015625, 1080.5860595703, 20.83),
            vector3(-3167.076171875, 1078.0391845703, 20.83)
        }
    },
    {
        type = "tattoo",
        coords = vector4(1864.1, 3747.91, 33.03, 17.23),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(1860.2752685547, 3750.1608886719, 33.03),
            vector3(1866.390625, 3752.8081054688, 33.03),
            vector3(1868.6164550781, 3747.3562011719, 33.03),
            vector3(1863.65234375, 3744.5034179688, 33.03)
        }
    },
    {
        type = "tattoo",
        coords = vector4(-294.24, 6200.12, 31.49, 195.72),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(-289.42239379883, 6198.68359375, 31.49),
            vector3(-294.69515991211, 6194.5366210938, 31.49),
            vector3(-298.23013305664, 6199.2451171875, 31.49),
            vector3(-294.1501159668, 6203.2700195312, 31.49)
        }
    },
    { -- ortaksmacaurcarut
        type = "tattoo",
        coords = vector4(2510.13, 4090.94, 35.62, 334.52),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(2508.09, 4095.68, 35.59),
            vector3(2514.5, 4092.55, 35.59),
            vector3(2512.5, 4088.13, 35.59),
            vector3(2505.95, 4090.71, 35.63)
        }
    },
}


Config.ClothingRooms = {
--[[     {
        job = "police",
        coords = vector4(454.91, -990.89, 30.69, 193.4),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(460.41918945312, -993.11444091797, 30.69),
            vector3(449.39508056641, -993.60614013672, 30.69),
            vector3(449.88696289062, -990.23779296875, 30.69),
            vector3(450.97882080078, -989.71411132812, 30.69),
            vector3(451.0325012207, -987.89904785156, 30.69),
            vector3(453.47863769531, -987.76928710938, 30.69),
            vector3(454.35513305664, -988.46459960938, 30.69),
            vector3(460.4231262207, -987.94573974609, 30.69)
        }
    } ]]
}


Config.PlayerOutfitRooms = {
    -- Sample outfit room config
--[[    {
        job = "police",
        coords = vector4(287.28, -573.41, 43.16, 79.61),
        size = vector3(4, 4, 4),
        rotation = 45,
        usePoly = false,
        points = {
            vector3(284.83, -574.01, 43.16),
            vector3(286.33, -570.03, 43.16),
            vector3(290.33, -571.74, 43.16),
            vector3(289.0, -574.75, 43.16)
        },
        citizenIDs = {
            "BHH65156"
        }
    }]]--
}

Config.Outfits = {
    ["police"] = {
        ["Male"] = {
            {
                name = "Short Sleeve",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 19, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 55, texture = 0}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = -1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Trooper Tan",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 20, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 317, texture = 3}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 58, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Long Sleeve",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 20, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 317, texture = 0}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = -1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1, 2, 3, 4},
            },
            {
                name = "Trooper Black",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 20, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 317, texture = 8}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 58, texture = 3}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2, 3, 4},
            },
            {
                name = "SWAT",
                outfitData = {
                    ["pants"] = {item = 130, texture = 1}, -- Pants
                    ["arms"] = {item = 172, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 15, texture = 0}, -- T Shirt
                    ["vest"] = {item = 15, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 336, texture = 3}, -- Jacket
                    ["shoes"] = {item = 24, texture = 0}, -- Shoes
                    ["accessory"] = {item = 133, texture = 0}, -- Neck Accessory
                    ["hat"] = {item = 150, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 52, texture = 0} -- Mask
                },
                grades = {3, 4},
            }
        },
        ["Female"] = {
            {
                name = "Short Sleeve",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 48, texture = 0}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Trooper Tan",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 3}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Long Sleeve",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 0}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1, 2, 3, 4},
            },
            {
                name = "Trooper Black",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 8}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2, 3, 4},
            },
            {
                name = "SWAT",
                outfitData = {
                    ["pants"] = {item = 135, texture = 1}, -- Pants
                    ["arms"] = {item = 213, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 0, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 8}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 102, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 149, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 35, texture = 0} -- Mask
                },
                grades = {3, 4},
            }
        }
    },
    ["realestate"] = {
        ["Male"] = {
            {
                -- Outfits
                name = "Worker",
                outfitData = {
                    ["pants"]       = { item = 28, texture = 0},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 31, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 294, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 10, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 12, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            }
        },
        ["Female"] = {
            {
                name = "Worker",
                outfitData = {
                    ["pants"]       = { item = 57, texture = 2},  -- Pants
                    ["arms"]        = { item = 0, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 34, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 105, texture = 7},  -- Jacket
                    ["shoes"]       = { item = 8, texture = 5},  -- Shoes
                    ["accessory"]   = { item = 11, texture = 3},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = -1, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            }
        }
    },
    ["ambulance"] = {
        ["Male"] = {
            {
                name = "T-Shirt",
                outfitData = {
                    ["arms"] = {item = 85, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 129, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 250, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 58, texture = 0}, -- Decals
                    ["accessory"] = {item = 127, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 96, texture = 0}, -- Pants
                    ["shoes"] = {item = 54, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 122, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Polo",
                outfitData = {
                    ["arms"] = {item = 90, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 249, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 57, texture = 0}, -- Decals
                    ["accessory"] = {item = 126, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 96, texture = 0}, -- Pants
                    ["shoes"] = {item = 54, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 122, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {2, 3, 4},
            },
            {
                name = "Doctor",
                outfitData = {
                    ["arms"] = {item = 93, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 32, texture = 3}, -- T-Shirt
                    ["torso2"] = {item = 31, texture = 7}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 0, texture = 0}, -- Decals
                    ["accessory"] = {item = 126, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 28, texture = 0}, -- Pants
                    ["shoes"] = {item = 10, texture = 0}, -- Shoes
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {3, 4},
            }
        },
        ["Female"] = {
            {
                name = "T-Shirt",
                outfitData = {
                    ["arms"] = {item = 109, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 159, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 258, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 66, texture = 0}, -- Decals
                    ["accessory"] = {item = 97, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 99, texture = 0}, -- Pants
                    ["shoes"] = {item = 55, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 121, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Polo",
                outfitData = {
                    ["arms"] = {item = 105, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 13, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 257, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 65, texture = 0}, -- Decals
                    ["accessory"] = {item = 96, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 99, texture = 0}, -- Pants
                    ["shoes"] = {item = 55, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 121, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {2, 3, 4},
            },
            {
                name = "Doctor",
                outfitData = {
                    ["arms"] = {item = 105, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 39, texture = 3}, -- T-Shirt
                    ["torso2"] = {item = 7, texture = 1}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 0, texture = 0}, -- Decals
                    ["accessory"] = {item = 96, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 34, texture = 0}, -- Pants
                    ["shoes"] = {item = 29, texture = 0}, -- Shoes
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {3, 4},
            }
        }
    }
}

Config.InitialPlayerClothes = {
    Male = {
        Model = "mp_m_freemode_01",
        Components = {
            {
                component_id = 0, -- Face
                drawable = 0,
                texture = 0
            },
            {
                component_id = 1, -- Mask
                drawable = 0,
                texture = 0
            },
            {
                component_id = 2, -- Hair
                drawable = 0,
                texture = 0
            },
            {
                component_id = 3, -- Upper Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 4, -- Lower Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 5, -- Bag
                drawable = 0,
                texture = 0
            },
            {
                component_id = 6, -- Shoes
                drawable = 0,
                texture = 0
            },
            {
                component_id = 7, -- Scarf & Chains
                drawable = 0,
                texture = 0
            },
            {
                component_id = 8, -- Shirt
                drawable = 0,
                texture = 0
            },
            {
                component_id = 9, -- Body Armor
                drawable = 0,
                texture = 0
            },
            {
                component_id = 10, -- Decals
                drawable = 0,
                texture = 0
            },
            {
                component_id = 11, -- Jacket
                drawable = 0,
                texture = 0
            }
        },
        Props = {
            {
                prop_id = 0, -- Hat
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 1, -- Glasses
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 2, -- Ear
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 6, -- Watch
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 7, -- Bracelet
                drawable = -1,
                texture = -1
            }
        },
        Hair = {
            color = 0,
            highlight = 0,
            style = 0,
            texture = 0
        }
    },
    Female = {
        Model = "mp_f_freemode_01",
        Components = {
            {
                component_id = 0, -- Face
                drawable = 0,
                texture = 0
            },
            {
                component_id = 1, -- Mask
                drawable = 0,
                texture = 0
            },
            {
                component_id = 2, -- Hair
                drawable = 0,
                texture = 0
            },
            {
                component_id = 3, -- Upper Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 4, -- Lower Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 5, -- Bag
                drawable = 0,
                texture = 0
            },
            {
                component_id = 6, -- Shoes
                drawable = 0,
                texture = 0
            },
            {
                component_id = 7, -- Scarf & Chains
                drawable = 0,
                texture = 0
            },
            {
                component_id = 8, -- Shirt
                drawable = 0,
                texture = 0
            },
            {
                component_id = 9, -- Body Armor
                drawable = 0,
                texture = 0
            },
            {
                component_id = 10, -- Decals
                drawable = 0,
                texture = 0
            },
            {
                component_id = 11, -- Jacket
                drawable = 0,
                texture = 0
            }
        },
        Props = {
            {
                prop_id = 0, -- Hat
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 1, -- Glasses
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 2, -- Ear
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 6, -- Watch
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 7, -- Bracelet
                drawable = -1,
                texture = -1
            }
        },
        Hair = {
            color = 0,
            highlight = 0,
            style = 0,
            texture = 0
        }
    }
}
