Config = {}

Config.Framework = "qb" -- qb, qbold, esx, esxold, custom, auto

-- Config.ItemImageDict = "nui://ox_inventory/web/images/" -- for qb inventory (you can access item images from inventory)
Config.ItemImageDict = "nui://ox_inventory/web/images/" -- for ox inventory (you can access item images from inventory)
-- Config.ItemImageDict = "./img/items/" -- for savana-shopsv2 (you can access item images from img/items folder)

Config.Interact = "qb-target" -- qb-target - ox_target or drawtext
Config.InteractKey = "E"

Config.CategoryNames = { --category labels
    ["food"] = "Foods",
    ["drink"] = "Drinks",
    ["other"] = "Others",
    -- Police
    ["weapon"] = "Weapon",
    ["ammunation"] = "Ammunation",
    ["equipment"] = "Equipment",
        -- ambulance
    ["ambulance"] = "Genel",
     -- uwucafe
    ["uwucafe"] = "Oyuncak",
    ["uwucafe2"] = "Yiyecek",
        -- awm
    ["awm"] = "Teknoloji",
    ["awm2"] = "Toptancı",
        -- pitstop
    ["pitstop"] = "pitstop",
      -- eczane
   ["eczane"] = "eczane",

   ["blgenel"] = "BlackMarket1",
   ["blgenell"] = "BlackMarket2",

}

Config.reqLicense = true
Config.licenseItem = 'burger'
Config.requiredLicenseforItem = {
    'weapon_pistol',
    'weapon_combatpistol'
}

Config.Products = {
    ["food"] = {
        ["tosti"] = { label = "Kızarmış Peynirli Sandviç", price = 50},
    },
    ["drink"] = {
        ["water_bottle"] = {label = "Su", price = 25},
    },
    ["blgenel"] = {
        ["plant_spray"] = {label = "Bitki Spreyi", price = 25},
        ["powdered_milk"] = {label = "Süt Tozu", price = 25},
        ["ammonia"] = {label = "Acid ammonia", price = 25},
        ["sacid"] = {label = "Acid sacid", price = 25},
    },
    ["blgenell"] = {
        ["cuff"] = {label = "Kelepce", price = 400},
        ["cuff_keys"] = {label = "Kelepce Anahtarı", price = 200},
        ["advancedlockpick"] = {label = "Gelişmiş Maymuncuk", price = 100},
        ["lockpick"] = {label = "Maymuncuk", price = 100},
        ["weapon_bat"] = {label = "Sopa", price = 15000},
        ["weapon_bottle"] = {label = "Kırık Cam", price = 20000},
        ["weapon_knife"] = {label = "Bicak", price = 30000},
        ["contracts_tablet"] = {label = "Soygun Görev Tableti", price = 25000},
        ["fakeplate"] = {label = "Sahte Plaka", price = 10000},
    },
    ["other"] = {
        ["lighter"] = {label = "Lighter", price = 70},
        ["cubancigar"] = {label = "Küba Puro", price = 70},
        ["davidoffcigar"] = {label = "Davidoff Puro", price = 10},
        ["marlboro"] = {label = "Marlboro Paketi", price = 10},
        ["redw"] = {label = "Redwood Paket", price = 10},
        ["mop"] = {label = "Vileda", price = 10},
        -- ["conedeck"] = {label = "cOne Deck", price = 10},
        -- ["aboutme"] = {label = "Benim Hakkımda Kutusu", price = 10},
        ["polaroid_photo"] = {label = "Fotograf Kagıdı", price = 10},
        ["polaroid_camera"] = {label = "Fotograf Makinası", price = 10},
        ["clothing_bag"] = {label = "Kıyafet Çantası", price = 10},
        -- ["truthordare"] = {label = "Doğrulu Cesaretlik Kutusu", price = 10},
        -- ["couplesquiz"] = {label = "Çiftler Bilgi Yarışması Kutusu +18", price = 10},
        
    },
    -- Police
    ["weapon"] = {
        ["weapon_stungun"] = {label = "Taser", price = 0},
        ["weapon_nightstick"] = {label = "Nightstick", price = 0},
        ["weapon_flashlight"] = {label = "Flashlight", price = 0},
        ["weapon_glock19gen4"] = {label = "Polis Silahı", price = 0},
        ["weapon_beanbagshotgun"] = {label = "Shotgun", price = 0},
    },
    ["ammunation"] = {
        ["pistol_ammo"] = {label = "Pistol Ammo", price = 0},
        ["shotgun_ammo"] = {label = "Smg Ammo", price = 0},
    },
    ["equipment"] = {
        ["cuff"] = {label = "Kelepce", price = 0},
        ["cuff_keys"] = {label = "Kelepce Anahtarı", price = 0},
        ["gps"] = {label = "GPS", price = 0},
        ["radio"] = {label = "Radio", price = 0},
        ["bodycam"] = {label = "Vücut kamerası", price = 0},
        ["heavyarmor"] = {label = "Heavy Armor", price = 0},
        ["phone"] = {label = "Telefon", price = 0},
        ["drone_lspd"] = {label = "Polis Dronu", price = 0},
        ["lawyerpass"] = {label = "Meslek Kartı", price = 0},
        ["fingerprint"] = {label = "GSR Cihazı", price = 0},
        ["medikit"] = {label = "Medkit", price = 0},
        ["bandage"] = {label = "Bandaj", price = 0},

    },
    -- Ambulance
    ["ambulance"] = {
        ["radio"] = {label = "Telsiz", price = 0},
        ["bandage"] = {label = "bandage", price = 0},
        ["medikit"] = {label = "medikit", price = 0},
        ["weapon_flashlight"] = {label = "Fener", price = 0},
        ["weapon_stungun"] = {label = "Şok Tabancası", price = 0},
        ["gps"] = {label = "GPS", price = 0},
        ["universal_cure"] = {label = "Bağımlılık İlacı", price = 0},
        
    },
        -- uwucafe
    ["uwucafe"] = {
        ["shark_boi"] = {label = "Köpekbalığı Çocuğu", price = 500},
        ["monkey_punk"] = {label = "Punk Maymun", price = 500},
        ["monky"] = {label = "Maymun", price = 500},
        ["fox"] = {label = "Tilki", price = 500},
        ["questing_mouse"] = {label = "Görev Faresi", price = 500},
        ["armored_cat"] = {label = "Zırhlı Kedi", price = 500},
        ["hollow_knight"] = {label = "Boş Şövalye", price = 500},
        ["knight_cat"] = {label = "Şövalye Kedi", price = 500},
        ["dino"] = {label = "Dinozor", price = 500},
        ["dino_student"] = {label = "Öğrenci Dino", price = 500},
        ["pig_angel"] = {label = "Melek Domuz", price = 500},
        ["mickey_mouse"] = {label = "Mickey Fare", price = 500},
        ["blossom"] = {label = "Çiçek", price = 500},
        ["buttercup"] = {label = "Tereyağ Çiçeği", price = 500},
        ["bubbles"] = {label = "Baloncuk", price = 500},
        
    },

    ["uwucafe2"] = {
        ["seker"] = {label = "Seker", price = 2},
        ["water"] = {label = "Su", price = 4},

    },

        -- AWM
     ["awm"] = {
        ["radio"] = {label = "Telsiz", price = 150},
        ["phone"] = {label = "Telefon", price = 250},
        ["large_drill"] = {label = "Büyük Matkap", price = 500},
        ["drill"] = {label = "Matkap", price = 350},
        ["boombox"] = {label = "Boombox", price = 1000},
        ["advancedrepairkit"] = {label = "Gelişmiş Tamir Kiti", price = 2000},
        ["parachute"] = {label = "Paraşüt", price = 500},
            
    },
    ["awm2"] = {
        ["seker"] = {label = "Seker", price = 5},
        ["water"] = {label = "Su", price = 5},
            
    },
    ["eczane"] = {
        ["Medikit"] = {label = "Medikit", price = 100},
        ["bandage"] = {label = "Bandaj", price = 50},
            
    },

            -- pitstop
    ["pitstop"] = {
        ["racingtablet"] = {label = "Yarış Tableti", price = 4},
        ["carpaintspray1"] = {label = "Kırmızı Spray", price = 1000},
        ["carpaintspray2"] = {label = "Şarap Kırmızı Spray", price = 1000},
        ["carpaintspray3"] = {label = "Mor Spray", price = 1000},
        ["carpaintspray4"] = {label = "Mavi Spray", price = 1000},
        ["carpaintspray5"] = {label = "Yeşil Spray", price = 1000},
        ["carpaintspray6"] = {label = "Lime Spray", price = 1000},
        ["carpaintspray7"] = {label = "Bakır Spray", price = 1000},
        ["carpaintspray8"] = {label = "Bronz Spray", price = 1000},
        ["carpaintspray9"] = {label = "Şampanya Spray", price = 1000},
        ["carpaintspray10"] = {label = "Altın Spray", price = 1000},
        ["carpaintspray11"] = {label = "Yeşil & Mavi Spray", price = 1000},
        ["carpaintspray12"] = {label = "Yeşil & Kırmızı Spray", price = 1000},
        ["carpaintspray13"] = {label = "Yeşil & Kahve Spray", price = 1000},
        ["carpaintspray14"] = {label = "Yeşil & Turkuaz Spray", price = 1000},
        ["carpaintspray15"] = {label = "Yeşil & Mor Spray", price = 1000},
        ["carpaintspray16"] = {label = "Turkuaz & Mor Spray", price = 1000},
        ["carpaintspray17"] = {label = "Turkuaz & Kırmızı Spray", price = 1000},
        ["carpaintspray18"] = {label = "Turkuaz & Mor Spray", price = 1000},
        ["carpaintspray19"] = {label = "Cyan & Mor Spray", price = 1000},
        ["carpaintspray20"] = {label = "Mavi & Pembe Spray", price = 1000},
        ["carpaintspray21"] = {label = "Mavi & Yeşil Spray", price = 1000},
        ["carpaintspray22"] = {label = "Mor & Kırmızı Spray", price = 1000},
        ["carpaintspray23"] = {label = "Mor & Yeşil Spray", price = 1000},
        ["carpaintspray24"] = {label = "Magenta & Yeşil Spray", price = 1000},
        ["carpaintspray25"] = {label = "Magenta & Sarı Spray", price = 1000},
        ["carpaintspray26"] = {label = "Burgonya & Yeşil Spray", price = 1000},
        ["carpaintspray27"] = {label = "Magenta & Cyan Spray", price = 1000},
        ["carpaintspray28"] = {label = "Bakır & Mor Spray", price = 1000},
        ["carpaintspray29"] = {label = "Magenta & Turuncu Spray", price = 1000},
        ["carpaintspray30"] = {label = "Kırmızı & Turuncu Spray", price = 1000},
        ["carpaintspray31"] = {label = "Turuncu & Mor Spray", price = 1000},
        ["carpaintspray32"] = {label = "Turuncu & Mavi Spray", price = 1000},
        ["carpaintspray33"] = {label = "Beyaz & Mor Spray", price = 1000},
        ["carpaintspray34"] = {label = "Kırmızı Rainbow Spray", price = 1000},
        ["carpaintspray35"] = {label = "Mavi Rainbow Spray", price = 1000},
        ["carpaintspray36"] = {label = "Koyu İnci Yeşil Spray", price = 1000},
        ["carpaintspray37"] = {label = "Koyu İnci Turkuaz Spray", price = 1000},
        ["carpaintspray38"] = {label = "Koyu İnci Mavi Spray", price = 1000},
        ["carpaintspray39"] = {label = "Koyu İnci Mor Spray", price = 1000},
        ["carpaintspray40"] = {label = "İnci Petrol Spray", price = 1000},
        ["carpaintspray41"] = {label = "Açık İnci Yeşil Spray", price = 1000},
        ["carpaintspray42"] = {label = "Açık İnci Mavi Spray", price = 1000},
        ["carpaintspray43"] = {label = "Açık İnci Mor Spray", price = 1000},
        ["carpaintspray44"] = {label = "Açık İnci Pembe Spray", price = 1000},
        ["carpaintspray45"] = {label = "Krem Prizma Spray", price = 1000},
        ["carpaintspray46"] = {label = "İnci Pembe Spray", price = 1000},
        ["carpaintspray47"] = {label = "İnci Sarı Spray", price = 1000},
        ["carpaintspray48"] = {label = "İnci Yeşil Spray", price = 1000},
        ["carpaintspray49"] = {label = "İnci Mavi Spray", price = 1000},
        ["carpaintspray50"] = {label = "İnci Krem Spray", price = 1000},
        ["carpaintspray51"] = {label = "Beyaz Prizma Spray", price = 1000},
        ["carpaintspray52"] = {label = "Grafit Prizma Spray", price = 1000},
        ["carpaintspray53"] = {label = "Koyu Mavi Prizma Spray", price = 1000},
        ["carpaintspray54"] = {label = "Koyu Mor Prizma Spray", price = 1000},
        ["carpaintspray55"] = {label = "Pembe Prizma Spray", price = 1000},
        ["carpaintspray56"] = {label = "Kırmızı Prizma Spray", price = 1000},
        ["carpaintspray57"] = {label = "Yeşil Prizma Spray", price = 1000},
        ["carpaintspray58"] = {label = "Siyah Prizma Spray", price = 1000},
        ["carpaintspray59"] = {label = "Petrol Prizma Spray", price = 1000},
        ["carpaintspray60"] = {label = "Rainbow Prizma Spray", price = 1000},
        ["carpaintspray61"] = {label = "Siyah Hologram Spray", price = 1000},
        ["carpaintspray62"] = {label = "Beyaz Hologram Spray", price = 1000},
        ["carpaintspray63"] = {label = "Chrome Spray", price = 1000},
        ["carpaintspray64"] = {label = "Nice Spray", price = 1000},
        ["carpaintspray65"] = {label = "MMKP Spray", price = 1000},
        ["carpaintspray66"] = {label = "Lime Spray", price = 1000},
        ["carpaintspray67"] = {label = "Vice City Spray", price = 1000},
        ["carpaintspray68"] = {label = "Wave Spray", price = 1000},
        ["carpaintspray69"] = {label = "4S Spray", price = 1000},
        ["carpaintspray70"] = {label = "9M Spray", price = 1000},
        ["carpaintspray71"] = {label = "Bubblegum Spray", price = 1000},
        ["carpaintspray72"] = {label = "Rainbow Spray", price = 1000},
        ["carpaintspray73"] = {label = "Sunset Spray", price = 1000},
        ["carpaintspray74"] = {label = "The Seven Spray", price = 1000},
        ["carpaintspray75"] = {label = "Kamenrider Spray", price = 1000},
        ["carpaintspray76"] = {label = "Chromebera Spray", price = 1000},
        ["carpaintspray77"] = {label = "Christmas Spray", price = 1000},
        ["carpaintspray78"] = {label = "Temperatur Spray", price = 1000},
        ["carpaintspray79"] = {label = "HSW Spray", price = 1000},
        ["carpaintspray80"] = {label = "Electro Spray", price = 1000},
        ["carpaintspray81"] = {label = "Monica Spray", price = 1000},
        ["carpaintspray82"] = {label = "Fubuki Spray", price = 1000},


                    
    },

}

Config.Shops = {
    [1] = {
        MarketName = "Market",
        coords = {
            vec4(-47.3410, -1758.6305, 29.4209, 44.6814),
            vec4(1164.8302, -323.6847, 69.2051, 103.26),
            vec4(-706.1641, -914.6527, 19.2156, 96.8859),
            vec4(-1819.5089, 793.4769, 138.0853, 124.4139),
            vec4(1697.2455, 4923.5239, 42.0636, 322.5120),
            vec4(1134.3419, -983.2134, 46.4158, 278.4345),
            vec4(-1221.4663, -907.9819, 12.3263, 25.9839),
            vec4(-1486.7921, -377.4817, 40.1633, 133.6345),
            vec4(-2966.4106, 391.5884, 15.0433, 78.7653),
            vec4(1165.2509, 2710.7932, 38.1576, 179.1092),
            vec4(1391.4180, 3605.8813, 34.9810, 202.6816),
            vec4(372.3590, 325.7128, 103.5666, 255.5847),
            vec4(-3038.3962, 584.7189, 7.9092, 5.7191),
            vec4(-3241.5808, 999.9484, 12.8307, 352.4509),
            vec4(548.9595, 2671.8809, 42.1565, 94.7311),
            vec4(1960.4518, 3739.4290, 32.3437, 288.3607),
            vec4(2678.6602, 3279.0977, 55.2411, 333.5169),
            vec4(1727.6074, 6414.7148, 35.0373, 232.9743),
            vec4(24.4783, -1347.9063, 29.4971, 262.9994),
            vec4(-1654.8580, -995.6705, 13.0233, 322.6143),
        },
        job = false,
        -- job = { -- if job = false then everyone
        --     ["police"] = true,
        -- },
        blip = false,
        ped = "mp_m_shopkeep_01",
        items = {
            ["food"] = "food",
            ["drink"] = "drink",
            ["other"] = "other",
        }
    },
    [2] = {
        MarketName = "Police Shop",
        coords = {
            vec4(482.53, -995.33, 30.69, 174.90),
            vec4(1836.98, 3688.04, 34.19, 205.40),
            vec4(362.37, -1603.16, 25.45, 322.38),
            vec4(1550.5524902344, 841.97698974609, 77.655784606934, 156.29493713379),
            vec4(-541.6106, -195.9361, 38.2270, 115.9810),
            vec4(606.2299, 5.6339, 87.8174, 160.6936),
            vec4(-449.54, 6015.14, 37.00, 227.90),
            vec4(377.2483, 799.6609, 190.4904, 245.0136),
        },
        job = { -- if job = false then everyone
            ["police"] = true,
            ["vespuccipd"] = true,
            ["doj"] = true,
            ["bcsd"] = true,
            ["pbsd"] = true,
            ["lssp"] = true,
            ["lspr"] = true,
            ["dsd"] = true,
        },
        blip = false,
        ped = "s_m_y_cop_01",
        items = {
            ["weapon"] = "weapon",
            ["ammunation"] = "ammunation",
            ["equipment"] = "equipment",
        }
    },
    [3] = {
        MarketName = "Ambulance Shop",
        coords = {
            vec4(1136.0374, -1542.8486, 35.0330, 181.4290)
        },
        job = { -- if job = false then everyone
            ["ambulance"] = true,

        },
        blip = false,
        ped = "csb_anita",
        items = {
            ["ambulance"] = "ambulance",
      
        }
    },
    [4] = {
        MarketName = "Uwu Cafe",
        coords = {
            vec4(-599.53, -1067.03, 22.34, 267.23)
        },
        job = { -- if job = false then everyone
            ["uwucafe"] = true,

        },
        blip = false,
        ped = "csb_anita",
        items = {
            ["uwucafe"] = "uwucafe",
            ["uwucafe2"] = "uwucafe2",
      
        }
    },
    [5] = {
        MarketName = "AWM",
        coords = {
            vec4(396.9422, -345.497, 46.848, 149.0)
        },
        job = false,
        blip = false,
        ped = "s_m_m_autoshop_02",
        items = {
            ["awm"] = "awm",
            ["awm2"] = "awm2",
      
        }
    },
    [6] = {
        MarketName = "pitstop", 
        coords = {
            vec4(945.26940917969, -1542.7049560547, 30.737735748291, 86.282775878906),
            vec4(124.6614, -3011.5930, 7.0409, 273.8194)
        },
        job = { -- if job = false then everyone
             ["pitstop"] = true,
             ["mechanic_illegal"] = true,

        },
        blip = false,
        ped = "mp_m_shopkeep_01",
        items = {
            ["pitstop"] = "pitstop",
      
        }
    },
    [7] = {
        MarketName = "Eczane",
        coords = {
            vec4(304.8773, -595.5217, 43.2840, 337.3055)
        },
        job = false,
        blip = false,
        ped = "s_m_m_autoshop_02",
        items = {
            ["eczane"] = "eczane",
      
        }
    },
    [8] = {
        MarketName = "Blackmarket",
        coords = {
            vec4(-15.5, 216.52395629883, 106.81231384277,  84.118759155273)
        },
        job = false,
        blip = false,
        ped = "a_f_m_beach_01",
        items = {
            ["blgenel"] = "blgenel",
      
        }
    },
    [9] = {
        MarketName = "Blackmarket 2",
        coords = {
            vec4(-475.03, 6285.53, 13.60,  360.118759155273)
        },
        job = false,
        blip = false,
        ped = "a_f_m_beach_01",
        items = {
            ["blgenell"] = "blgenell",
      
        }
    },
}

Config.Strings = {
    ["Interact_Text"] = "Dükkanı Aç",
    ["Shopping_Cart"] = "Alışveriş Sepeti",
    ["pay_cash"] = "Nakit öde",
    ["pay_bank"] = "Bankadan öde",
    ["piece"] = "Adet",
    ["total_product_type"] = "Toplam Ürün Türü:",
    ["total_type"] = "Toplam Tür:",
    ["total_price"] = "Toplam Fiyat:",
    ["false_job"] = "Bu dükkanı açamazsın",
    ["no_money"] = "Yeterli paran yok.",
    ["no_license"] = "Silah ruhsatın yok!"

}

-- Do not touch this. If you don't know what you're doing, you can break the script.

-- Auto Framework Detection
if Config.Framework == "auto" then
    if GetResourceState("qb-core") == "started" then
        Config.Framework = "qb"
    elseif GetResourceState("es_extended") == "started" then
        Config.Framework = "esx"
    else
        print("Couldn't find a framework. Using custom framework.")
        Config.Framework = "custom"
    end
end

-- Framework Object
if Config.Framework == "qb" or Config.Framework == "QB" or Config.Framework == "qb-core" then
    Config.Framework = "qb"
    FrameworkObject = exports['qb-core']:GetCoreObject()
elseif Config.Framework == "qbold" then
    FrameworkObject = nil
    Config.Framework = "qb"
    
    Citizen.CreateThread(function()
        while FrameworkObject == nil do
            TriggerEvent('QBCore:GetObject', function(obj) FrameworkObject = obj end)
            Citizen.Wait(50)
        end
    end)
elseif Config.Framework == "esx" or Config.Framework == "ESX" or Config.Framework == "es_extended" then
    Config.Framework = "esx"
    FrameworkObject = exports['es_extended']:getSharedObject()
elseif Config.Framework == "esxold" then
    FrameworkObject = nil
    Config.Framework = "esx"

    Citizen.CreateThread(function()
        while FrameworkObject == nil do
            TriggerEvent('esx:getSharedObject', function(obj) FrameworkObject = obj end)
            Citizen.Wait(50)
        end
    end)
else
    Config.Framework = "custom"
    -- Write your own code shared object code.
    FrameworkObject = nil
end