Config = {}
Config.FrameWork = "QBCore" -- "ESX" / "QBCore 
Config.Target = false 
Config.Library = "qb" -- qb or ox if esx make ox

Config.FrameWorkExport = function()
    if Config.FrameWork == "ESX" then
       return exports['es_extended']:getSharedObject()
   elseif Config.FrameWork == "QBCore" then 
       return exports['qb-core']:GetCoreObject()
   end
end

Config.Webhook = "https://discord.com/api/webhooks/1339077939744079882/URmrJuWnA-Qah7ZKa_1PCB8jyQUJdeLU4FJ5ivzKeEpW7yN0wTLo0gxgU2tBb_MYLSCn"

Config.Notification = function(message, typex, duration)
    local header, icon
    if typex == "error" then
        header = "Hata"
        icon = "fas fa-times-circle"
    elseif typex == "success" then
        header = "Başarılı"
        icon = "fas fa-check-circle"
    elseif typex == "info" then
        header = "Bilgi"
        icon = "fas fa-info-circle"
    else
        header = typex
        icon = "fas fa-info-circle"
    end
    duration = duration or 5000
    exports['ZSX_UIV2']:Notification(header, message, icon, duration)
end

Config.ServerNotification = function(src, message, typex)
    local header, icon
    if typex == "error" then
        header = "Hata"
        icon = "fas fa-times-circle"
    elseif typex == "success" then
        header = "Başarılı"
        icon = "fas fa-check-circle"
    elseif typex == "info" then
        header = "Bilgi"
        icon = "fas fa-info-circle"
    else
        header = typex
        icon = "fas fa-info-circle"
    end
    -- Sunucudan bildirimi tetiklemek için client event kullanıyoruz.
    TriggerClientEvent('ZSX_UIV2:Notification', src, header, message, icon, 5000)
end

Config.SkillsOpenKey = "F7"
Config.PointsCommand = "points"
Config.ProteinItem = "coffee"
Config.ProteinMultiplier = 2 -- 2x 
Config.ProteinEffectTime = 60000 -- 1 minute

Config.RemoveSkills = false -- Removes skills when not in use according to ıpdate frequency Time : UpdateFrequency . 1000 
Config.UpdateFrequency = 300 -- Seconds interval between removing values 
Config.GainedSkillAmount = {"0.01", "0.02", "0.03", "0.05", "0.08" }
Config.MiniGame = {
    ["difficulty"] = "custom", -- it is not recommended to change this feature
    ["keycharacter"] = "H",
    ["key"] = 31, 
    ["cancelkey"] = 47,

}

Config.Warm = false
Config.Exercises = {
    ["prop_muscle_bench_01"] = {
        ["exerciseAnimDict"] = "amb@prop_human_seat_muscle_bench_press@idle_a", -- Exercise Animation Dictionary
        ["exerciseAnimName"] = "idle_a", -- Exercise Animation Name
        ["exitAnimDict"] = "amb@prop_human_seat_muscle_bench_press@exit", -- Exit Animation Dictionary
        ["exitAnimName"] = "exit", -- Exit Animation Name
        ["idleAnimDict"] = "amb@lo_res_idles@", -- İdle Animation Dictionary
        ["idleAnimName"] = "prop_human_seat_muscle_bench_lo_res_base", -- İdle Animation Name
        ["exerciseProp"] = "prop_barbell_02", -- Exercise Hand Prop
        ["doubleProp"] = false, -- it is not recommended to change this feature
        ["cameraDisable"] = false, -- it is not recommended to change this feature
        ["gainedSkill"] = "Strength",
        ["exerciseUnit"] = "weight"
    },
    ["prop_muscle_bench_03"] = {
        ["exerciseAnimDict"] = "amb@prop_human_seat_muscle_bench_press@idle_a", -- Exercise Animation Dictionary
        ["exerciseAnimName"] = "idle_a", -- Exercise Animation Name
        ["exitAnimDict"] = "amb@prop_human_seat_muscle_bench_press@exit", -- Exit Animation Dictionary
        ["exitAnimName"] = "exit", -- Exit Animation Name
        ["idleAnimDict"] = "amb@lo_res_idles@", -- İdle Animation Dictionary
        ["idleAnimName"] = "prop_human_seat_muscle_bench_lo_res_base", -- İdle Animation Name
        ["exerciseProp"] = "prop_barbell_02", -- Exercise Hand Prop
        ["doubleProp"] = false, -- it is not recommended to change this feature
        ["cameraDisable"] = false, -- it is not recommended to change this feature
        ["gainedSkill"] = "Strength",
        ["exerciseUnit"] = "weight"
    },
    ["prop_muscle_bench_05"] = {
        ["exerciseAnimDict"] = "amb@prop_human_muscle_chin_ups@male@base", -- Exercise Animation Dictionary
        ["exerciseAnimName"] = "base", -- Exercise Animation Name
        ["exitAnimDict"] = "amb@prop_human_muscle_chin_ups@male@exit", -- Exit Animation Dictionary
        ["exitAnimName"] = "exit", -- Exit Animation Name
        ["idleAnimDict"] = "amb@prop_human_muscle_chin_ups@male@idle_a", -- İdle Animation Dictionary
        ["idleAnimName"] = "idle_a", -- İdle Animation Name
        ["exerciseProp"] = "prop_curl_bar_01", -- Exercise Hand Prop
        ["doubleProp"] = nil, -- it is not recommended to change this feature
        ["cameraDisable"] = true, -- it is not recommended to change this feature
        ["gainedSkill"] = "Strength",
        ["exerciseUnit"] = "weight",
        ["missionEntity"] = true,
        ["offsetHeading"] = 360.0,
        ["offsetY"] = 0.5
    },
}

Config.CustomExercises = {
    ["free"] = {
        ["exerciseAnimDict"] = "amb@world_human_sit_ups@male@enter", -- Exercise Animation Dictionary
        ["exerciseAnimName"] = "base", -- Exercise Animation Name
        ["exitAnimDict"] = "amb@world_human_sit_ups@male@exit", -- Exit Animation Dictionary
        ["exitAnimName"] = "exit", -- Exit Animation Name
        ["idleAnimDict"] = "amb@world_human_sit_ups@male@idle_a", -- İdle Animation Dictionary
        ["idleAnimName"] = "idle_a", -- İdle Animation Name
        ["exerciseCoords"] = { -- -- Exercise Spot Coords
            vector3(-1204.24, -1557.34, 4.62),
            vector3(-1200.85, -1577.23, 4.61),
            vector3(-1197.03, -1579.31, 4.61)
        },
        ["exerciseHeading"] = 160, -- Exercise Heading
        ["exerciseProp"] = "", -- Exercise Hand Prop
        ["doubleProp"] = nil, -- it is not recommended to change this feature
        ["cameraDisable"] = true, -- it is not recommended to change this feature
        ["gainedSkill"] = "Strength",
        ["exerciseUnit"] = "weight",
    },
    ["biceps_curl_spot"] = {
        ["exerciseAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@base", -- Exercise Animation Dictionary
        ["exerciseAnimName"] = "base", -- Exercise Animation Name
        ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
        ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
        ["idleAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@idle_a", -- İdle Animation Dictionary
        ["idleAnimName"] = "idle_a", -- İdle Animation Name
        ["exerciseCoords"] = { -- -- Exercise Spot Coords
            vector4(-1202.58, -1573.19, 4.51, 128.01),
            vector4(-1209.26, -1559.2, 4.61, 49.66),
            vector4(-1267.04, -356.72, 36.96, 110.25),
            vector4(-1269.5, -362.24, 36.98, 298.22),
            vector4(-1267.74, -365.93, 36.98, 298.22)
        },
        ["exerciseHeading"] = 128.01, -- Exercise Heading
        ["exerciseProp"] = "prop_curl_bar_01", -- Exercise Hand Prop
        ["doubleProp"] = false, -- it is not recommended to change this feature
        ["cameraDisable"] = true, -- it is not recommended to change this feature
        ["gainedSkill"] = "Strength",
        ["exerciseUnit"] = "weight",
    },
    ["prop_muscle_bench_01"] = {
        ["offsetHeight"] = 0.3,
        ["propCoords"] = {
            {coords = vector4(-1199.11682, -1565.1145, 3.61, -55.0)},
            {coords = vector4(-1201.25427, -1566.55542, 3.61, 35.0)},
            {coords = vector4(-1203.266, -1567.96411, 3.61, 35.0)}
        }
    },
    ["prop_muscle_bench_05"] = {
        ["propCoords"] = {
            {coords = vector4(-1199.5365, -1571.81274, 3.603294, 35.0)},
            {coords = vector4(-1205.22913, -1563.68042, 3.604103, 35.0)}
        }
    },
}

-- Config.Exercises = {
--     ["bench_spot_1"] = {
--         ["exerciseAnimDict"] = "amb@prop_human_seat_muscle_bench_press@idle_a", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "idle_a", -- Exercise Animation Name
--         ["exitAnimDict"] = "amb@prop_human_seat_muscle_bench_press@exit", -- Exit Animation Dictionary
--         ["exitAnimName"] = "exit", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@lo_res_idles@", -- İdle Animation Dictionary
--         ["idleAnimName"] = "prop_human_seat_muscle_bench_lo_res_base", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1201.2, -1575.14, 4.01), -- Exercise Spot Coords
--         ["exerciseHeading"] = 214.00, -- Exercise Heading
--         ["exerciseProp"] = "prop_barbell_02", -- Exercise Hand Prop
--         ["doubleProp"] = false, -- it is not recommended to change this feature
--         ["cameraDisable"] = false, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
        
--     },
--     ["bench_spot_2"] = {
--         ["exerciseAnimDict"] = "amb@prop_human_seat_muscle_bench_press@idle_a", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "idle_a", -- Exercise Animation Name
--         ["exitAnimDict"] = "amb@prop_human_seat_muscle_bench_press@exit", -- Exit Animation Dictionary
--         ["exitAnimName"] = "exit", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@lo_res_idles@", -- İdle Animation Dictionary
--         ["idleAnimName"] = "prop_human_seat_muscle_bench_lo_res_base", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1198.04, -1568.29, 4.02), -- Exercise Spot Coords
--         ["exerciseHeading"] = 303.40, -- Exercise Heading
--         ["exerciseProp"] = "prop_barbell_02", -- Exercise Hand Prop
--         ["doubleProp"] = false, -- it is not recommended to change this feature
--         ["cameraDisable"] = false, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
        
--     },
--     ["bench_spot_3"] = {
--         ["exerciseAnimDict"] = "amb@prop_human_seat_muscle_bench_press@idle_a", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "idle_a", -- Exercise Animation Name
--         ["exitAnimDict"] = "amb@prop_human_seat_muscle_bench_press@exit", -- Exit Animation Dictionary
--         ["exitAnimName"] = "exit", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@lo_res_idles@", -- İdle Animation Dictionary
--         ["idleAnimName"] = "prop_human_seat_muscle_bench_lo_res_base", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1203.08, -1568.19, 4.01), -- Exercise Spot Coords
--         ["exerciseHeading"] = 219.00, -- Exercise Heading
--         ["exerciseProp"] = "prop_barbell_01", -- Exercise Hand Prop
--         ["doubleProp"] = true, -- it is not recommended to change this feature
--         ["cameraDisable"] = false, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
        
--     },
--     ["bench_spot_4"] = {
--         ["exerciseAnimDict"] = "amb@prop_human_seat_muscle_bench_press@idle_a", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "idle_a", -- Exercise Animation Name
--         ["exitAnimDict"] = "amb@prop_human_seat_muscle_bench_press@exit", -- Exit Animation Dictionary
--         ["exitAnimName"] = "exit", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@lo_res_idles@", -- İdle Animation Dictionary
--         ["idleAnimName"] = "prop_human_seat_muscle_bench_lo_res_base", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1201.15, -1566.7, 4.02), -- Exercise Spot Coords
--         ["exerciseHeading"] = 219.00, -- Exercise Heading
--         ["exerciseProp"] = "prop_barbell_01", -- Exercise Hand Prop
--         ["doubleProp"] = true, -- it is not recommended to change this feature
--         ["cameraDisable"] = false, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
        
--     },
--     ["bench_spot_5"] = {
--         ["exerciseAnimDict"] = "amb@prop_human_seat_muscle_bench_press@idle_a", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "idle_a", -- Exercise Animation Name
--         ["exitAnimDict"] = "amb@prop_human_seat_muscle_bench_press@exit", -- Exit Animation Dictionary
--         ["exitAnimName"] = "exit", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@lo_res_idles@", -- İdle Animation Dictionary
--         ["idleAnimName"] = "prop_human_seat_muscle_bench_lo_res_base", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1200.72, -1562.21, 4.01), -- Exercise Spot Coords
--         ["exerciseHeading"] = 122.52, -- Exercise Heading
--         ["exerciseProp"] = "prop_barbell_02", -- Exercise Hand Prop
--         ["doubleProp"] = false, -- it is not recommended to change this feature
--         ["cameraDisable"] = false, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
        
--     },
--     ["bench_spot_6"] = {
--         ["exerciseAnimDict"] = "amb@prop_human_seat_muscle_bench_press@idle_a", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "idle_a", -- Exercise Animation Name
--         ["exitAnimDict"] = "amb@prop_human_seat_muscle_bench_press@exit", -- Exit Animation Dictionary
--         ["exitAnimName"] = "exit", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@lo_res_idles@", -- İdle Animation Dictionary
--         ["idleAnimName"] = "prop_human_seat_muscle_bench_lo_res_base", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1207.13, -1560.87, 4.02), -- Exercise Spot Coords
--         ["exerciseHeading"] = 215.79, -- Exercise Heading
--         ["exerciseProp"] = "prop_barbell_02", -- Exercise Hand Prop
--         ["doubleProp"] = false, -- it is not recommended to change this feature
--         ["cameraDisable"] = false, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
--     },
--     ------------------------------------------------------
--     ["biceps_curl_spot_1"] = {
--         ["exerciseAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@base", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "base", -- Exercise Animation Name
--         ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
--         ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@idle_a", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle_a", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1202.58, -1573.19, 4.51), -- Exercise Spot Coords
--         ["exerciseHeading"] = 128.01, -- Exercise Heading
--         ["exerciseProp"] = "prop_curl_bar_01", -- Exercise Hand Prop
--         ["doubleProp"] = false, -- it is not recommended to change this feature
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
--     },
--     ["biceps_curl_spot_2"] = {
--         ["exerciseAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@base", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "base", -- Exercise Animation Name
--         ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
--         ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@idle_a", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle_a", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1198.43, -1565.17, 4.62), -- Exercise Spot Coords
--         ["exerciseHeading"] = 303.35, -- Exercise Heading
--         ["exerciseProp"] = "prop_curl_bar_01", -- Exercise Hand Prop
--         ["doubleProp"] = false, -- it is not recommended to change this feature
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
--     },
--     ["biceps_curl_spot_3"] = {
--         ["exerciseAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@base", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "base", -- Exercise Animation Name
--         ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
--         ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@idle_a", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle_a", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1209.26, -1559.2, 4.61), -- Exercise Spot Coords
--         ["exerciseHeading"] = 49.66, -- Exercise Heading
--         ["exerciseProp"] = "prop_curl_bar_01", -- Exercise Hand Prop
--         ["doubleProp"] = false, -- it is not recommended to change this feature
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
--     },
--     ----------------------------------------------------------------
--     ["chinup_spot_1"] = {
--         ["exerciseAnimDict"] = "amb@prop_human_muscle_chin_ups@male@base", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "base", -- Exercise Animation Name
--         ["exitAnimDict"] = "amb@prop_human_muscle_chin_ups@male@exit", -- Exit Animation Dictionary
--         ["exitAnimName"] = "exit", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@prop_human_muscle_chin_ups@male@idle_a", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle_a", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1204.93, -1564.12, 4.62), -- Exercise Spot Coords
--         ["exerciseHeading"] = 212.16, -- Exercise Heading
--         ["exerciseProp"] = "prop_curl_bar_01", -- Exercise Hand Prop
--         ["doubleProp"] = nil, -- it is not recommended to change this feature
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
--     },
--     ["chinup_spot_2"] = {
--         ["exerciseAnimDict"] = "amb@prop_human_muscle_chin_ups@male@base", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "base", -- Exercise Animation Name
--         ["exitAnimDict"] = "amb@prop_human_muscle_chin_ups@male@exit", -- Exit Animation Dictionary
--         ["exitAnimName"] = "exit", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@prop_human_muscle_chin_ups@male@idle_a", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle_a", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1199.78, -1571.36, 4.61), -- Exercise Spot Coords
--         ["exerciseHeading"] = 35.0, -- Exercise Heading
--         ["exerciseProp"] = "prop_curl_bar_01", -- Exercise Hand Prop
--         ["doubleProp"] = nil, -- it is not recommended to change this feature
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
--     },
--     ----------------------------------------------------------------
--     ["free_1"] = {
--         ["exerciseAnimDict"] = "amb@world_human_sit_ups@male@enter", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "base", -- Exercise Animation Name
--         ["exitAnimDict"] = "amb@world_human_sit_ups@male@exit", -- Exit Animation Dictionary
--         ["exitAnimName"] = "exit", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@world_human_sit_ups@male@idle_a", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle_a", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1204.4556, -1557.5719, 3.6183), -- Exercise Spot Coords
--         ["exerciseHeading"] = 160, -- Exercise Heading
--         ["exerciseProp"] = "", -- Exercise Hand Prop
--         ["doubleProp"] = nil, -- it is not recommended to change this feature
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
--     },
--     -- IF U WANT ADD MORE
--     --- GYM 2
--     ["biceps_curl_spot_4"] = {
--         ["exerciseAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@base", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "base", -- Exercise Animation Name
--         ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
--         ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@idle_a", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle_a", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1267.04, -356.72, 36.96), -- Exercise Spot Coords
--         ["exerciseHeading"] = 110.25, -- Exercise Heading
--         ["exerciseProp"] = "prop_curl_bar_01", -- Exercise Hand Prop
--         ["doubleProp"] = false, -- it is not recommended to change this feature
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
--     },
--     ["biceps_curl_spot_5"] = {
--         ["exerciseAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@base", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "base", -- Exercise Animation Name
--         ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
--         ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@idle_a", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle_a", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1269.5, -362.24, 36.98), -- Exercise Spot Coords
--         ["exerciseHeading"] = 298.22, -- Exercise Heading
--         ["exerciseProp"] = "prop_curl_bar_01", -- Exercise Hand Prop
--         ["doubleProp"] = false, -- it is not recommended to change this feature
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
--     },
--     ["biceps_curl_spot_6"] = {
--         ["exerciseAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@base", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "base", -- Exercise Animation Name
--         ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
--         ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
--         ["idleAnimDict"] = "amb@world_human_muscle_free_weights@male@barbell@idle_a", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle_a", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1267.74, -365.93, 36.98), -- Exercise Spot Coords
--         ["exerciseHeading"] = 298.22, -- Exercise Heading
--         ["exerciseProp"] = "prop_curl_bar_01", -- Exercise Hand Prop
--         ["doubleProp"] = false, -- it is not recommended to change this feature
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Strength",
--         ["exerciseUnit"] = "weight",
--     },
--     ["treadmill_1"] = {
--         ["exerciseAnimDict"] = "move_m@jog@", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "run", -- Exercise Animation Name
--         ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
--         ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
--         ["idleAnimDict"] = "move_m@jogger", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1257.82, -366.34, 37.11), -- Exercise Spot Coords
--         ["exerciseHeading"] = 206.36, -- Exercise Heading
--         ["exerciseProp"] = "prop_energy_drink", -- Exercise Hand Prop
--         ["doubleProp"] = nil, -- it is not recommended to change this feature if not prop : nil
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Stamina",
--         ["exerciseUnit"] = "distance",
--     },
--     ["treadmill_2"] = {
--         ["exerciseAnimDict"] = "move_m@jog@", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "run", -- Exercise Animation Name
--         ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
--         ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
--         ["idleAnimDict"] = "move_m@jogger", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1259.28, -367.11, 37.11), -- Exercise Spot Coords
--         ["exerciseHeading"] = 206.36, -- Exercise Heading
--         ["exerciseProp"] = "prop_energy_drink", -- Exercise Hand Prop
--         ["doubleProp"] = nil, -- it is not recommended to change this feature if not prop : nil
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Stamina",
--         ["exerciseUnit"] = "distance",
--     },
--     ["treadmill_3"] = {
--         ["exerciseAnimDict"] = "move_m@jog@", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "run", -- Exercise Animation Name
--         ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
--         ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
--         ["idleAnimDict"] = "move_m@jogger", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1260.71, -367.96, 37.11), -- Exercise Spot Coords
--         ["exerciseHeading"] = 206.36, -- Exercise Heading
--         ["exerciseProp"] = "prop_energy_drink", -- Exercise Hand Prop
--         ["doubleProp"] = nil, -- it is not recommended to change this feature if not prop : nil
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Stamina",
--         ["exerciseUnit"] = "distance",
--     },
--     ["treadmill_4"] = {
--         ["exerciseAnimDict"] = "move_m@jog@", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "run", -- Exercise Animation Name
--         ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
--         ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
--         ["idleAnimDict"] = "move_m@jogger", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1262.16, -368.82, 37.11), -- Exercise Spot Coords
--         ["exerciseHeading"] = 206.36, -- Exercise Heading
--         ["exerciseProp"] = "prop_energy_drink", -- Exercise Hand Prop
--         ["doubleProp"] = nil, -- it is not recommended to change this feature if not prop : nil
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Stamina",
--         ["exerciseUnit"] = "distance",
--     },
--     ["treadmill_5"] = {
--         ["exerciseAnimDict"] = "move_m@jog@", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "run", -- Exercise Animation Name
--         ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
--         ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
--         ["idleAnimDict"] = "move_m@jogger", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1263.46, -369.67, 37.11), -- Exercise Spot Coords
--         ["exerciseHeading"] = 206.36, -- Exercise Heading
--         ["exerciseProp"] = "prop_energy_drink", -- Exercise Hand Prop
--         ["doubleProp"] = nil, -- it is not recommended to change this feature if not prop : nil
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Stamina",
--         ["exerciseUnit"] = "distance",
--     },
--     ["treadmill_6"] = {
--         ["exerciseAnimDict"] = "move_m@jog@", -- Exercise Animation Dictionary
--         ["exerciseAnimName"] = "run", -- Exercise Animation Name
--         ["exitAnimDict"] = "mini@triathlon", -- Exit Animation Dictionary
--         ["exitAnimName"] = "ig_2_gen_warmup_02", -- Exit Animation Name
--         ["idleAnimDict"] = "move_m@jogger", -- İdle Animation Dictionary
--         ["idleAnimName"] = "idle", -- İdle Animation Name
--         ["exerciseCoords"] = vector3(-1264.99, -370.22, 37.11), -- Exercise Spot Coords
--         ["exerciseHeading"] = 206.36, -- Exercise Heading
--         ["exerciseProp"] = "prop_energy_drink", -- Exercise Hand Prop
--         ["doubleProp"] = nil, -- it is not recommended to change this feature if not prop : nil
--         ["cameraDisable"] = true, -- it is not recommended to change this feature
--         ["gainedSkill"] = "Stamina",
--         ["exerciseUnit"] = "distance",
--     },
-- }

Config.Skills = {
    ["Stamina"] = {
        ["Current"] = 20, -- Default value 
        ["RemoveAmount"] = -0.3, -- % to remove when updating,
        ["Stat"] = "MP0_STAMINA", -- GTA stat hashname
        ["skillName"] = "Dayanıklılık",
        ["skillDescription"] = "Nefesiniz daha yavaş tükenir ve daha fazla mesafe kat edebilirsiniz",
        ["requiredPoints"] = 500,
        ["sellAmount"] = 5,
    },

    ["Strength"] = {
        ["Current"] = 10,
        ["RemoveAmount"] = -0.3,
        ["Stat"] = "MP0_STRENGTH",
        ["skillName"] = "Güç",
        ["skillDescription"] = "",
        ["requiredPoints"] = 500,
        ["sellAmount"] = 5,
    },

    ["Lung Capacity"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "MP0_LUNG_CAPACITY",
        ["skillName"] = "Akciğer Kapasitesi",
        ["skillDescription"] = "",
        ["requiredPoints"] = 500,
        ["sellAmount"] = 5,
    },

    ["Shooting"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "MP0_SHOOTING_ABILITY",
        ["skillName"] = "Atış",
        ["skillDescription"] = "",
        ["requiredPoints"] = 500,
        ["sellAmount"] = 5,
    },

    ["Driving"] = {
        ["Current"] = 0,
        ["RemoveAmount"] = -0.5,
        ["Stat"] = "MP0_DRIVING_ABILITY",
        ["skillName"] = "Sürüş",
        ["skillDescription"] = "",
        ["requiredPoints"] = 500,
        ["sellAmount"] = 5,
    }, 
}

Config.FreeExercisesKey = "J"
Config.FreeExercises = {
    ["pushups"] = {
        ["animName"] = "base",
        ["animDict"] = "amb@world_human_push_ups@male@base",
        ["animDuration"] =  15000,
        ["rewardSkill"] = "Stamina", -- make it nil if you don't want it to give skill points
        ["rewardPoint"] = 0.01, 
        ["progressDescription"] = "Şınav Çekiliyor...",
    },
    ["situps"] = {
        ["animName"] = "base",
        ["animDict"] = "amb@world_human_sit_ups@male@base",
        ["animDuration"] =  15000,
        ["rewardSkill"] = "Stamina", -- make it nil if you don't want it to give skill points
        ["rewardPoint"] = 0.01, 
        ["progressDescription"] = "Mekik Çekiliyor...",
    },
    ["yoga"] = {
        ["animName"] = "c2_pose",
        ["animDict"] = "missfam5_yoga",
        ["animDuration"] =  15000,
        ["rewardSkill"] = "Stamina", -- make it nil if you don't want it to give skill points
        ["rewardPoint"] = 0.01, 
        ["progressDescription"] = "Yoga Yapıyorsun...",
    },
    ["jump"] = {
        ["animName"] = "jimmy_getknocked",
        ["animDict"] = "timetable@reunited@ig_2",
        ["animDuration"] =  15000,
        ["rewardSkill"] = "Stamina", -- make it nil if you don't want it to give skill points
        ["rewardPoint"] = 0.01, 
        ["progressDescription"] = "Zıplıyorsun...",
    },
}

Config.TebexIntegration = false
Config.TebexPackages = {
    [1] = {
        ["packageName"] = "200",
        ["point"] = 500
    },
    [2] = {
        ["packageName"] = "test",
        ["point"] = 300
    }
}

Config.Task = false
Config.Tasks = {
    [0] = {
        ["taskDescription"] = "Run to Designated Coordinate",
        ["taskReward"] = 500,
        Task = function()
        local waypointCoord = vector3(-1167.1110, -1512.8164, 4.4188) 
        local isWaypointSet = false
        local playerPed = PlayerPedId()
        local startTime = GetGameTimer()
        SetNewWaypoint(waypointCoord.x, waypointCoord.y)
        isWaypointSet = true
            while isWaypointSet do
                Citizen.Wait(1000) 
                local currentTime = GetGameTimer()
                local elapsedTime = (currentTime - startTime) / 1000 
        
                if elapsedTime >= 60 then 
                    Config.Notification(Locales.Default["timeexpried"], "error", 5000) 
                    isWaypointSet = false 
                    break
                end
                if IsPedInAnyVehicle(playerPed) then 
                    Config.Notification(Locales.Default["carmissioncancelled"], "error", 5000) 
                    isWaypointSet = false 
                    break
                end
                local playerCoord = GetEntityCoords(playerPed)
                local distance = #(playerCoord - waypointCoord)
        
                if distance < 5.0 then 
                    Config.Notification(Locales.Default["reachgoal"], "success", 5000) 
                    addPoint(500)
                    isWaypointSet = false 
                    break
                end
            end
        end
    },
    [1] = {
        ["taskDescription"] = "Stay in the Water for a Specified Time",
        ["taskReward"] = 700,
        Task = function()
            local targetDuration = 30 -- Water residence time in seconds
            local maxWaitTime = 60 -- Maximum waiting time in seconds to initiate a water survival mission
            local playerPed = PlayerPedId()
            local isPlayerInWater = false
            local taskStartTime = GetGameTimer()
            local inWaterStartTime = 0

            while true do
                Citizen.Wait(1000)

                local currentTime = GetGameTimer()
                local totalElapsedTime = (currentTime - taskStartTime) / 1000

                if totalElapsedTime >= maxWaitTime then
                    Config.Notification(Locales.Default["timeexpried"], "error", 5000) 
                    break
                end

                if IsEntityInWater(playerPed) then
                    if not isPlayerInWater then
                        isPlayerInWater = true
                        inWaterStartTime = currentTime
                    end

                    local inWaterElapsedTime = (currentTime - inWaterStartTime) / 1000

                    if inWaterElapsedTime >= targetDuration then
                        Config.Notification(Locales.Default["successwater"], "success", 5000) 
                        addPoint(700)
                        break
                    end
                else
                    if isPlayerInWater then
                        Config.Notification(Locales.Default["outwater"], "success", 5000) 
                        break
                    end
                end
            end
        end
    },
    [2] = {
        ["taskDescription"] = "Drive to the Designated Coordinate",
        ["taskReward"] = 500,
        Task = function()
            local waypointCoord = vector3(-1167.1110, -1512.8164, 4.4188)
            local isWaypointSet = false
            local playerPed = PlayerPedId()
            local startTime = GetGameTimer()
            SetNewWaypoint(waypointCoord.x, waypointCoord.y)
            isWaypointSet = true

            while isWaypointSet do
                Citizen.Wait(1000)
                local currentTime = GetGameTimer()
                local elapsedTime = (currentTime - startTime) / 1000

                if elapsedTime >= 60 then
                    Config.Notification(Locales.Default["timeexpried"], "error", 5000) 
                    isWaypointSet = false
                    break
                end

                if not IsPedInAnyVehicle(playerPed, false) then
                    Config.Notification(Locales.Default["dontinsidecar"], "error", 5000) 
                    isWaypointSet = false
                    break
                end

                local playerCoord = GetEntityCoords(playerPed)
                local distance = #(playerCoord - waypointCoord)

                if distance < 5.0 then
                    Config.Notification(Locales.Default["reachgoal"], "success", 5000) 
                    addPoint(500)
                    isWaypointSet = false
                    break
                end
            end
        end
    },
    [3] = {
        ["taskDescription"] = "Shoot 3 Shots with a Gun",
        ["taskReward"] = 300,
        Task = function()
            local shotsFired = 0
            local maxShots = 3
            local taskStartTime = GetGameTimer()

            while shotsFired < maxShots do
                Citizen.Wait(0)

                if IsControlPressed(0, 25) then
                    shotsFired = shotsFired + 1
                    Citizen.Wait(1000) 
                end

                local currentTime = GetGameTimer()
                local totalElapsedTime = (currentTime - taskStartTime) / 1000

                if totalElapsedTime >= 60 then
                    Config.Notification(Locales.Default["timeexpried"], "error", 5000) 
                    break
                end
            end

            if shotsFired >= maxShots then
                Config.Notification(Locales.Default["success3shot"], "success", 5000) 
                addPoint(300)
            end
        end
    }
}

Config.ClothingMenu = function()
    TriggerEvent('qb-clothing:client:openMenu')
end


Config.Lockers = {
    -- vector3(-1195.55, -1577.49, 4.01),
    -- vector3(-1250.31, -361.59, 36.02),
    -- vector3(-1249.14, -364.0, 36.02)
}
