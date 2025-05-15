Savana = {}

Savana.Framework = "auto" -- Determines which framework to use: auto, esx, or qb
Savana.Debug = false -- Enables debug mode for additional output

Savana.Language = "en"
Savana.ReleaseCoord = vec4(104.3253, -195.4782, 54.7517, 170.1024)

Savana.Keys = false
Savana.MenuKey = "F6"
Savana.DashboardKey = "F7"

Savana.menuCommand = 'kamu'
Savana.menuDashboard = 'kamumenu'

Savana.accessLicenses = {
    "license:web2c46a26f4f44786c2b5bdefa0977012136468"
}



Savana.Locales = {
    ["en"] = {
        clear = "[E]  Temizlemek için"
    }
}

Savana.Jobs = {
    "police",
    "bcsd",
    "pbsd",
    "lspr",
    "dsd",
    "doj",
    "vespuccipd",
    "lssp"
}

Savana.Levels = {
    ["Easy"] = {
        marker = { -- https://docs.fivem.net/docs/game-references/markers/
            icon = 21,
            size = 0.7,
            color = {r = 255, g = 255, b = 100}
        }
    },
    ["Medium"] = {
        marker = { -- https://docs.fivem.net/docs/game-references/markers/
            icon = 21,
            size = 0.7,
            color = {r = 255, g = 255, b = 100}
        },
    },
    ["Hard"] = {
        marker = { -- https://docs.fivem.net/docs/game-references/markers/
            icon = 21,
            size = 0.7,
            color = {r = 255, g = 255, b = 100}
        }
    }
}

Savana.Locations = {
    central = {
        label = "Central Park",
        coord = vec4(167.14, -991.59, 30.09, 256.44),
        radius = 70.0, -- if it moves out of this zone radius, it throws it back to the starting point
        releaseCoord = vec4(167.14, -991.59, 30.09, 256.44),

        animations = {
            ["Easy"] = {
                dict = "anim@amb@drug_field_workers@rake@male_b@base",
                name = "base",
                time = 5000,
                AnimationOptions = {
                    Prop = "prop_tool_broom",
                    PropBone = 28422,
                    PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
                    EmoteLoop = true,
                    EmoteMoving = false
                },
                locations = {
                    vector3(159.19, -994.94, 29.36),
                    vector3(151.66, -995.34, 29.36),
                    vector3(155.0, -1002.06, 29.36),
                    vector3(163.44, -1004.73, 29.36),
                    vector3(172.5, -1005.72, 29.34),
                    vector3(181.61, -1008.27, 29.33),
                    vector3(160.41, -990.47, 30.12)
                },
            },
            ["Medium"] = {
                dict = "amb@world_human_gardener_leaf_blower@base",
                name = "base",
                time = 10000,
                AnimationOptions = {
                    Prop = "prop_leaf_blower_01",
                    PropBone = 28422,
                    PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
                    EmoteLoop = true,
                    EmoteMoving = false
                },
                locations = {
                    vector3(185.41, -1002.96, 29.29),
                    vector3(191.44, -1005.89, 29.29),
                    vector3(196.79, -1007.31, 29.29),
                    vector3(201.93, -1006.02, 29.29),
                    vector3(208.63, -1005.16, 29.29)
                },
            },
            ["Hard"] = {
                dict = "anim@amb@drug_field_workers@rake@male_a@base",
                name = "base",
                time = 20000,
                AnimationOptions = {
                    Prop = "prop_tool_rake",
                    PropBone = 28422,
                    PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
                    EmoteLoop = true,
                    EmoteMoving = false
                },
                locations = {
                    vector3(178.85, -997.58, 29.29),
                    vector3(187.0, -1000.47, 29.29),
                    vector3(191.94, -1002.67, 29.29),
                    vector3(197.74, -1006.58, 29.29),
                    vector3(201.35, -1003.44, 29.29),
                    vector3(210.3, -1001.93, 29.29),
                    vector3(212.47, -998.3, 29.29)
                },
            }

        }
    },
    mirror = {
        label = "Mirror Park",
        coord = vector4(1064.6, -579.24, 57.32, 52.37),
        radius = 70.0, -- if it moves out of this zone radius, it throws it back to the starting point
        releaseCoord = vec4(1048.68, -619.25, 57.24, 218.98),

        animations = {
            ["Easy"] = {
                dict = "anim@amb@drug_field_workers@rake@male_b@base",
                name = "base",
                time = 5000,
                AnimationOptions = {
                    Prop = "prop_tool_broom",
                    PropBone = 28422,
                    PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
                    EmoteLoop = true,
                    EmoteMoving = false
                },
                locations = {
                    vector3(1064.68, -582.36, 57.23),
                    vector3(1065.23, -591.09, 56.83),
                    vector3(1064.93, -601.27, 56.83),
                    vector3(1069.59, -607.82, 56.76),
                    vector3(1061.9, -612.53, 56.77),
                    vector3(1074.37, -585.54, 56.76),
                    vector3(1061.55, -566.31, 58.38)
                },
            },
            ["Medium"] = {
                dict = "amb@world_human_gardener_leaf_blower@base",
                name = "base",
                time = 10000,
                AnimationOptions = {
                    Prop = "prop_leaf_blower_01",
                    PropBone = 28422,
                    PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
                    EmoteLoop = true,
                    EmoteMoving = false
                },
                locations = {
                    vector3(1070.29, -593.86, 56.86),
                    vector3(1070.3, -570.19, 57.44),
                    vector3(1070.37, -573.35, 57.43),
                    vector3(1053.65, -594.0, 57.38),
                    vector3(1056.88, -597.12, 57.26),
                    vector3(1053.64, -601.2, 57.53),
                    vector3(1055.86, -606.05, 57.24),
                    vector3(1051.69, -610.97, 57.32)
                },
            },
            ["Hard"] = {
                dict = "anim@amb@drug_field_workers@rake@male_a@base",
                name = "base",
                time = 20000,
                AnimationOptions = {
                    Prop = "prop_tool_rake",
                    PropBone = 28422,
                    PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},
                    EmoteLoop = true,
                    EmoteMoving = false
                },
                locations = {
                    vector3(1058.9, -579.22, 57.93),
                    vector3(1054.69, -574.05, 58.51),
                    vector3(1046.65, -582.23, 58.56),
                    vector3(1044.13, -594.91, 58.26),
                    vector3(1042.29, -607.05, 58.06),
                    vector3(1058.34, -604.44, 57.16),
                    vector3(1067.15, -588.45, 56.88),
                    vector3(1066.71, -574.19, 57.72)
                },
            }

        }
        
    },
    mine = {
        label = "Mine Shaft",
        coord = vector4(2968.66, 2758.04, 43.1, 138.49),
        radius = 70.0, -- if it moves out of this zone radius, it throws it back to the starting point
        releaseCoord = vec4(2968.66, 2758.04, 43.1, 138.49),

        animations = {
            ["Easy"] = {
                dict = "anim@heists@fleeca_bank@drilling",
                name = "drill_straight_fail",
                time = 5000,
                AnimationOptions = {
                    Prop = "hei_prop_heist_drill",
                    PropBone = 57005,
                    PropPlacement = {0.14, 0, -0.01, 90.0, -90.0, 180.0, 0.0},
                    EmoteLoop = true,
                    EmoteMoving = false
                },
                locations = {
                    vector3(2986.23, 2751.71, 43.23),
                    vector3(2991.51, 2750.68, 43.66),
                    vector3(2997.89, 2750.48, 44.46),
                    vector3(3000.93, 2755.17, 44.04),
                    vector3(2982.21, 2750.22, 43.11),
                    vector3(2977.65, 2743.81, 44.41)
                },
            },
            ["Medium"] = {
                dict = "random@burial",
                name = "a_burial",
                time = 10000,
                AnimationOptions = {
                    Prop = "prop_tool_shovel",
                    PropBone = 28422,
                    PropPlacement = {0.0, 0.0, 0.24, 0, 0, 0.0, 0.0},
                    EmoteLoop = true,
                    EmoteMoving = false
                },
                locations = {
                    vector3(2989.61, 2770.14, 42.88),
                    vector3(2977.31, 2762.83, 43.13),
                    vector3(2967.69, 2758.43, 43.08),
                    vector3(2973.15, 2743.9, 43.32),
                    vector3(2970.22, 2738.88, 43.85),
                    vector3(2995.33, 2756.21, 42.93),
                    vector3(2987.36, 2770.14, 43.08)
                },
            },
            ["Hard"] = {
                dict = "melee@large_wpn@streamed_core",
                name = "ground_attack_on_spot",
                time = 20000,
                AnimationOptions = {
                    Prop = "prop_tool_pickaxe",
                    PropBone = 57005,
                    PropPlacement = {0.08,-0.4,-0.10,80.0,-20.0,175.0,},
                    EmoteLoop = true,
                    EmoteMoving = false
                },
                locations = {
                    vector3(2985.13, 2763.18, 42.76),
                    vector3(2987.76, 2755.52, 42.68),
                    vector3(2993.71, 2754.64, 43.0),
                    vector3(2991.29, 2774.25, 43.0),
                    vector3(3001.5, 2773.75, 42.97),
                    vector3(3000.27, 2760.26, 42.94)
                },
            }

        }
    }
}

function getFramework()
    if Savana.Framework == "esx" then
        return exports['es_extended']:getSharedObject(), "esx"
    elseif Savana.Framework == "qb" then
        return exports["qb-core"]:GetCoreObject(), "qb"
    elseif Savana.Framework == "auto" then
        if GetResourceState('qb-core') == 'started' then
            return exports["qb-core"]:GetCoreObject(), "qb"
        elseif GetResourceState('es_extended') == 'started' then
            return exports['es_extended']:getSharedObject(), "esx"
        end
    end
end

exports {
    'MyCustomFunction'
}