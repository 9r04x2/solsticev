Config = {}

Config.Framework = "qbcore" -- esx or qbcore
-- todo add remove object

Config.CornerHolding = {

}

Config.Meth = {
    labs = {
        [1] = {
            enterance = {
                showMarker = true,
                bucketId = 0, 
                requiredItems = {
                    -- ["lab_card"] = 1,
                }, 
                removeItem = false,
                enterCoords = vector4(281.6336, 6789.3965, 15.8648, 78.7238), 
                exitCoords = vector4(996.89, -3200.64, -36.39, 0.0),
            },
            cookScene = {
                showMarker = true,
                requiredItems = {
                    ["ammonia"] = 1,
                    ["sacid"] = 1,
                },
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(3818.22, 4475.5, 3.2),
                        offset = vector3(5.0, 2.0, -0.40),
                        rotation = vector3(0.0, 0.0, 180.0),
                    },
                    { 
                        coords = vector3(3817.07, 4471.77, 3.17), 
                        offset = vector3(0.09, 0.57, -0.65), 
                        rotation = vector3(0.0, 0.0, -180.0) 
                    },
                    { 
                        coords = vector3(3820.95, 4475.99, 3.2), 
                        offset = vector3(0.09, 0.57, -0.65), 
                        rotation = vector3(0.0, 0.0, -180.0) 
                    },
                },
                itemName = "cooked_meth",
                itemCount = 1
            },
            hammerScene = {
                showMarker = true,
                requiredItems = {
                    ["cooked_meth"] = 1
                },
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(3818.2107, 4452.5703, 3.4434),
                        offset = vector3(-3.16, -1.75, -1.0),
                        rotation = vector3(0.0, 0.0, 180.0),
                    },
                    { 
                        coords = vector3(3823.8997, 4453.2778, 2.9455), 
                        offset = vector3(0.09, 0.57, -0.65), 
                        rotation = vector3(0.0, 0.0, -180.0) 
                    },
                    { 
                        coords = vector3(3828.4749, 4452.4810, 2.8197), 
                        offset = vector3(0.09, 0.57, -0.65), 
                        rotation = vector3(0.0, 0.0, -180.0) 
                    },
                 
                },
                itemName = "breaked_meth",
                itemCount = 6
            },
            packingScene = {
                showMarker = true,
                requiredItems = {
                    ["breaked_meth"] = 6
                },
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(3805.0332, 4439.2671, 4.0309),
                        offset = vector3(-4.71, -1.52, -1.0),
                        rotation = vector3(0.0, 0.0, 180.0),
                    },
                    { 
                        coords = vector3(3801.7019, 4439.6958, 4.2024), 
                        offset = vector3(0.09, 0.57, -0.65), 
                        rotation = vector3(0.0, 0.0, -180.0) 
                    },
                    { 
                        coords = vector3(3798.4385, 4440.1138, 4.5459), 
                        offset = vector3(0.09, 0.57, -0.65), 
                        rotation = vector3(0.0, 0.0, -180.0) 
                    },
                },
                itemName = "packed_meth",
                itemCount = 12
            },
        },
    },
}

Config.Coke = {
    labs = {
        [1] = {
            enterance = {
                showMarker = true,
                bucketId = 0, 
                requiredItems = {
                    -- ["lab_card"] = 1,
                }, 
                removeItem = false,
                enterCoords = vector4(1269.9246, -1906.9629, 39.4289, 193.5184),     
                exitCoords = vector4(1088.56, -3188.12, -39.0, 0.0), 
            },
            unpackScene = {
                showMarker = true,
                requiredItems = {
                    ["powdered_milk"] = 1
                },
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(1091.1392822266,-3194.8686523438,-38.9935), 
                        offset = vector3(0.09, 0.57, -0.65), 
                        rotation = vector3(0.0, 0.0, -180.0) 
                    },
                    { 
                        coords = vector3(1095.9555664062,-3195.0068359375,-38.9935), 
                        offset = vector3(0.09, 0.57, -0.65), 
                        rotation = vector3(0.0, 0.0, -180.0) 
                    },
                },
                itemName = "unpacked_coke",
                itemCount = 1
            },
            cutterScene = {
                showMarker = true,
                requiredItems = {
                    ["unpacked_coke"] = 1
                },
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(1086.6585693359,-3198.1162109375,-38.9935), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -180.0) 
                    },
                    { 
                        coords = vector3(1086.8002929688,-3195.4140625,-38.9935), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -180.0) 
                    },
                    { 
                        coords = vector3(1086.8305664062,-3193.3427734375,-38.9935), 
                        offset = vector3(-1.91, -0.32, -0.64), 
                        rotation = vector3(0.0, 0.0, -180.0) 
                    },
                },
                itemName = "cutted_coke",
                itemCount = 6
            },
            packingScene = {
                showMarker = true,
                requiredItems = {
                    ["cutted_coke"] = 6
                },
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(1100.8255615234,-3199.0869140625,-38.9935),
                        offset = vector3(-7.66, 2.17, -1.0),
                        rotation = vector3(0.0, 0.0, -180.0),
                    },
                    { 
                        coords = vector3(1099.4694824219,-3199.8122558594,-38.9935),
                        offset = vector3(-7.66, 2.17, -1.0),
                        rotation = vector3(0.0, 0.0, -180.0),
                    },
                   
                },
                itemName = "packed_coke",
                itemCount = 3
            },
        },
    },
}

Config.Weed = {
    labs = {
        [1] = {
            enterance = {
                showMarker = true,
                bucketId = 0, 
                requiredItems = {
                    -- ["lab_card"] = 1,
                }, 
                removeItem = false,
                enterCoords = vector4(1334.5642, 4306.7573, 38.2339, 72.8312),
                exitCoords = vector4(1066.0, -3183.48, -39.16, 0.0), 
            },
            gatheringScene = {
                showMarker = true,
                requiredItems = {
                    ["plant_spray"] = 1,
                },
                removeItem = false,
                coords = {
                    { 
                        coords = vector3(1063.5682, -3191.5979, -39.1040), 
                        offset = vector3(-0.9, 0.1, -1.18), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                    { 
                        coords = vector3(1057.7286, -3196.8333, -39.1613), 
                        offset = vector3(-0.9, 0.1, -1.18), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                    { 
                        coords = vector3(1053.1163, -3198.1431, -39.1613), 
                        offset = vector3(-0.9, 0.1, -1.18), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                
                },
                itemName = "unpacking_weed",
                itemCount = 1
            },
            packingScene = {
                showMarker = true,
                requiredItems = {
                    ["unpacking_weed"] = 1
                },
                removeItem = true,
                coords = {
                    { 
                        coords = vector3(1039.2408, -3205.3811, -38.1666), 
                        offset = vector3(-0.76, 0.87, -0.98), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                    { 
                        coords = vector3(1034.6462, -3205.5725, -38.1767), 
                        offset = vector3(0.76, 0.70, -0.98), 
                        rotation = vector3(0.0, 0.0, 180.0) 
                    },
                    { 
                        coords = vector3(1034.3839, -3203.8147, -38.1778), 
                        offset = vector3(-0.76, 0.87, -0.98), 
                        rotation = vector3(0.0, 0.0, 90.0) 
                    },
                },
                itemName = "packed_weed",
                itemCount = 1
            },
        },
    },
}

Config.Laundry = {
  
}

iplList = {
    ["Meth"] = { 
        coords = vector3(1009.5, -3196.6, -38.99682),
        ipl = { 
            "meth_lab_upgrade",
            "meth_lab_setup",
            "meth_lab_production",
            "meth_lab_security_high", 
        }
    },
    ["Coke"] = {
        coords = vector3(1093.6, -3196.6, -38.99841),
        ipl = { 
            "equipment_upgrade",
            "production_upgrade",
            "table_equipment_upgrade",
            "coke_press_upgrade",
            "coke_cut_01",
            "coke_cut_02",
            "coke_cut_03",
            "coke_cut_04",
            "coke_cut_05",
            "security_high", 
        } 
    },
    ["Weed"] = {
        coords = vector3(1051.491, -3196.536, -39.14842),
        ipl = { 
            'weed_drying',
            'weed_production',
            'weed_upgrade_equip',
            'weed_chairs',
            "weed_growtha_stage3",
            "weed_growthb_stage3",
            "weed_growthc_stage3",
            "weed_growthd_stage3",
            "weed_growthe_stage3",
            "weed_growthf_stage3",
            "weed_growthg_stage3",
            "weed_growthh_stage3",
            "weed_growthi_stage3",
            "weed_hosea",
            "weed_hoseb",
            "weed_hosec",
            "weed_hosed",
            "weed_hosee",
            "weed_hosef",
            "weed_hoseg",
            "weed_hoseh",
            "weed_hosei",
            'light_growtha_stage23_upgrade',
            'light_growthb_stage23_upgrade',
            'light_growthc_stage23_upgrade',
            'light_growthc_stage23_upgrade',
            'light_growthd_stage23_upgrade',
            'light_growthe_stage23_upgrade',
            'light_growthf_stage23_upgrade',
            'light_growthg_stage23_upgrade',
            'light_growthh_stage23_upgrade',
            'light_growthi_stage23_upgrade',
        } 
    },
    ["Laundry"] = { 
   
    },
}

Strings = {
    -- General --
    ["dont_have_item"] = "Yeterli %s e sahip değilsiniz",
    ["gave_item"] = "%s adlı eşyayı kullandınız",
    ["sold_item"] = "%sx %s adlı eşyayı sattınız",

    -- Meth --
    ["enter_meth_lab"] = "Meth laboratuvarına girmek için ~INPUT_CONTEXT~ tuşuna basın",
    ["exit_meth_lab"] = "Meth laboratuvarından çıkmak için ~INPUT_CONTEXT~ tuşuna basın",

    ["start_meth_cooking"] = "Meth pişirmeye başlamak için ~INPUT_CONTEXT~ tuşuna basın",
    ["cooking_meth"] = "Meth pişirmeye başladınız",
    ["cooking_meth_text"] = "Meth Pişiriliyor...",

    ["start_breaking_meth"] = "Pişirilmiş Meth ayırmaya başlamak için ~INPUT_CONTEXT~ tuşuna basın",
    ["breaking_meth"] = "Pişirilmiş Meth ayırmaya başladınız",
    ["breaking_meth_text"] = "Meth Ayırılıyor...",

    ["start_packing_meth"] = "Meth paketlemeye başlamak için ~INPUT_CONTEXT~ tuşuna basın",
    ["packing_meth"] = "Meth paketlemeye başladınız",
    ["packing_meth_text"] = "Meth Paketleniyor...",

    -- Coke --
    ["enter_coke_lab"] = "Kokain laboratuvarına girmek için ~INPUT_CONTEXT~ tuşuna basın",
    ["exit_coke_lab"] = "Kokain laboratuvarından çıkmak için ~INPUT_CONTEXT~ tuşuna basın",

    ["start_unpacking_coke"] = "Kokain açmaya başlamak için ~INPUT_CONTEXT~ tuşuna basın",
    ["unpacking_coke"] = "Kokain açmaya başladınız",
    ["unpacking_coke_text"] = "Kokain Açılıyor...",

    ["start_cutting_coke"] = "Kokain kesmeye başlamak için ~INPUT_CONTEXT~ tuşuna basın",
    ["cutting_coke"] = "Kokain kesmeye başladınız",
    ["cutting_coke_text"] = "Kokain Kesiliyor...",

    ["start_packing_coke"] = "Kokain paketlemeye başlamak için ~INPUT_CONTEXT~ tuşuna basın",
    ["packing_coke"] = "Kokain paketlemeye başladınız",
    ["packing_coke_text"] = "Kokain Paketleniyor...",

    -- Weed --
    ["enter_weed_lab"] = "Esrar laboratuvarına girmek için ~INPUT_CONTEXT~ tuşuna basın",
    ["exit_weed_lab"] = "Esrar laboratuvarından çıkmak için ~INPUT_CONTEXT~ tuşuna basın",

    ["start_gather_weed"] = "Esrar toplamaya başlamak için ~INPUT_CONTEXT~ tuşuna basın",
    ["gathering_weed"] = "Esrar toplamaya başladınız",
    ["gathering_weed_text"] = "Esrar Toplanıyor...",

    ["start_packing_weed"] = "Esrar paketlemeye başlamak için ~INPUT_CONTEXT~ tuşuna basın",
    ["packing_weed"] = "Esrar paketlemeye başladınız",
    ["packing_weed_text"] = "Esrar Paketleniyor...",

    -- Laundry --
    ["enter_laundry_lab"] = "Çamaşırhane laboratuvarına girmek için ~INPUT_CONTEXT~ tuşuna basın",
    ["exit_laundry_lab"] = "Çamaşırhane laboratuvarından çıkmak için ~INPUT_CONTEXT~ tuşuna basın",

    ["start_place_paper"] = "Para kağıdını yerleştirmeye başlamak için ~INPUT_CONTEXT~ tuşuna basın",
    ["place_money"] = "Para kağıdı yerleştirmeye başladınız",
    ["place_money_text"] = "Para Kağıdı Yerleştiriliyor...",

    ["start_cutting_money"] = "Para kesmeye başlamak için ~INPUT_CONTEXT~ tuşuna basın",
    ["cutting_money"] = "Para kesmeye başladınız",
    ["cutting_money_text"] = "Para Kesiliyor...",

    ["start_wash_money"] = "Para yıkamaya başlamak için ~INPUT_CONTEXT~ tuşuna basın",
    ["wash_money"] = "Para yıkamaya başladınız",
    ["wash_money_text"] = "Para Yıkanıyor...",

    ["start_count_money"] = "Para saymaya başlamak için ~INPUT_CONTEXT~ tuşuna basın",
    ["count_money"] = "Para saymaya başladınız",
    ["count_money_text"] = "Para Sayılıyor...",

    -- Corner Holding --
    ["cant_corner_in_vehicle"] = "Aracın içinde köşe tutamazsınız",
    ["cant_corner_while_dead"] = "Ölü olduğunuzdan köşe tutamazsınız",
    ["cant_corner_this_area"] = "Bu bölgede köşe tutamazsınız",
    ["cant_corner_not_enough_cops"] = "Köşe tutmak için yeterli polis yok",
    ["cancel_cornerholding"] = "Köşe tutmayı iptal ettiniz",

    ["started_corner_holding"] = "Köşe tutmaya başladınız, bölgeden ayrılma!",
    ["corner_holding_moved_away"] = "Bölgeden uzaklaştığınız için köşe tutma iptal edildi",
    ["buyer_has_damaged"] = "Alıcı, yaralı olduğu için hiçbir şey satın almak istemiyor",
    ["looking_new_buyer"] = "Yeni alıcı arıyorsunuz",
    ["buyer_not_like"] = "Alıcı, yeterli malzeme olmadığı için beğenmedi",

}