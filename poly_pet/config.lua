----------------------------------------------------------------
----                   DUSADEV.TEBEX.IO                     ----
----------------------------------------------------------------
Config = {}

--- @param -- Check https://lesimov.gitbook.io/dusa-docs for documentation

------------------------GENERAL OPTIONS------------------------
---------------------------------------------------------------
Config.DefaultPetName = 'Pet'
Config.Target = 'ox_target' -- false / ox_target / qb-target / qtarget
Config.Progressbar = 'qb-core' -- ox_lib / qb-core
-- WAIT
Config.DataInterval = 1 -- Interval between taking data (minutes) -- Default 5 minutes
Config.InventoryCheckInterval = 1 -- Interval between taking data (minutes) -- Default 5 minutes
Config.UpdateInterval = 5 -- Update pet data interval (minutes) -- Default 5 minutes

-- ILLNESSES
Config.HealthLimit = 100 -- If health lower than this value, sicknesses will occur
Config.IllnessChance = 5 -- Define a chance for pet sickness, 5 means %5
Config.IllnessInterval = 180 -- Interval between illness checks (seconds) - Default 180 seconds
Config.Illnesses = { -- Add new sickness species or remove them (You can translate here tho)
    [1] = {
        illness = 'kennelcough',
        damage = 1
    },
    [2] = {
        illness = 'fatigue',
        damage = 1
    }
}

Config.TreatItems = {
	'treatmentkit', -- Healing pet
	'revivekit', -- Reviving pet
	'treatmentpills' -- Cure pet's illness
}

-- COORDS
Config.PreviewCoords = {
    -- Pet Coordinates
    petCoords = vector3(2516.703369, 3786.501221, 52.448364),
    heading = 147.4,
    -- Camera Coords
    FocusCoords = vector3(2515.397705, 3784.615479, 53.131519), -- SetFocusPosAndVel
    CamCoords = vector3(2515.397705, 3784.615479, 53.131519), -- SetFocusPosAndVel
}

Config.Peds = { -- Default coords (You can find petshop from https://forum.cfx.re/t/release-sandy-pet-shop-mlo/2172530)
    ['petshop'] = {
        ped = 'a_m_y_gay_02',
        icon = 'fas fa-paw',
        label = 'Pet Shop',
        func = function()
            OpenPetShop()
        end,
        coords = vector3(387.95, -342.08, 46.81),
        heading = 183.00
    },
    ['petstore'] = {
        ped = 'a_f_y_golfer_01',
        icon = 'fas fa-paw',
        label = 'Pet Marketi',
        func = function()
            OpenShop()
        end,
        coords = vector3(385.71, -342.32, 46.81),
        heading = 192.19
    },
}

Config.Blip = { -- https://docs.fivem.net/docs/game-references/blips/
  coords = vec3(391.32, -345.42, 46.82),
  sprite = 489,
  color = 48,
  scale = 0.7,
  name = "Pet Shop"
}

-- HUNGER
Config.ReduceHunger = 0.03 -- Reduce pet hunger in every 2 seconds

-- LEASH
Config.LeashLength = 7 -- Max leash length as meter
Config.SyncLeashDuration = 15 -- Sync leash rope in every 15 seconds (higher value better optimization)

-- OTHER
Config.MaxDistanceToPet = 100 -- If distance more than this value, pet will go to sleep
Config.MaxDistanceToSend = 50 -- Maximize distance to send pet

-- COMMANDS / KEYBINDS
Config.Keybinds = {
    ["emotemenu"] = {
        command = "petemote",
        key = "",
        description = "Pet Eylem Menu",
        func = function()
            PetEmote()
        end -- dont change
    },
    ["wardrobe"] = {
        command = "petwardrobe",
        key = "",
        description = "Pet Eşya Dolabı",
        func = function()
            OpenWardrobe()
        end -- dont change
    },
    ["petmenu"] = {
        command = "petmenu",
        key = "",
        description = "Pet Menu",
        func = function()
            OpenPetMenu()
        end -- dont change
    },
    ["movehud"] = {
        command = "movehud",
        key = "END",
        description = "Move Pet HUD",
        func = false -- dont change
    }
    -- Shortcuts for police k9 actions
    -- ["k9attack"] = {
    --     command = "k9attack",
    --     key = "G",
    --     description = "K9 Attack Key",
    --     func = function()
    --         -- k9Attack()
    --         TriggerEvent('dusa_pet:cl:k9attack')
    --     end -- dont change
    -- },
    -- ["k9search"] = {
    --     command = "k9search",
    --     key = "H",
    --     description = "K9 Search Key",
    --     func = function()
    --         -- k9Search()
    --         TriggerEvent('dusa_pet:cl:k9search')
    --     end -- dont change
    -- }
}

-- OTHER GENERAL OPTIONS WILL BE LISTED HERE

---------------------------PET SHOP----------------------------
---------------------------------------------------------------

--[[	
	You can add additional items to specified shop from here.

	name = Item Label will be displayed
	item = Item spawn code
	detail = Description of item that we are selling
	price = Cost of item

	--- @param WARNING!!! name value cant be same with another item
]]

Config.Shop = {
    ["dog"] = {
		[1] = {
            name = 'Tenis Topu',
            item = 'tennisball',
            detail = 'Yakala bakalım!',
            image = 'tennisball.png',
            price = 75
        },
        [2] = {
            name = 'Siyah Tasma',
            item = 'leash',
            detail = 'Evcil hayvanını kontrol et!',
            image = 'leash.png',
            price = 250
        },
		[3] = {
            name = 'Sarı Tasma',
            item = 'leash2',
            detail = 'Evcil hayvanını kontrol et!',
            image = 'leash2.png',
            price = 250
        },
		[4] = {
            name = 'Yeşil Tasma',
            item = 'leash3',
            detail = 'Evcil hayvanını kontrol et!',
            image = 'leash3.png',
            price = 250
        },
	},
    ["cat"] = {
		[1] = {
            name = 'Tenis Topu',
            item = 'tennisball',
            detail = 'Yakala bakalım!',
            image = 'tennisball.png',
            price = 75
        },
        [2] = {
            name = 'Siyah Tasma',
            item = 'leash',
            detail = 'Evcil hayvanını kontrol et!',
            image = 'leash.png',
            price = 250
        },
		[3] = {
            name = 'Sarı Tasma',
            item = 'leash2',
            detail = 'Evcil hayvanını kontrol et!',
            image = 'leash2.png',
            price = 250
        },
		[4] = {
            name = 'Yeşil Tasma',
            item = 'leash3',
            detail = 'Evcil hayvanını kontrol et!',
            image = 'leash3.png',
            price = 250
        },
	},
    ["dress"] = {
        [1] = {
            name = 'Kahverengi Küçük Şapka',
            item = 'tinyhat',
            detail = 'Sevimli bir küçük şapka',
            image = 'tinyhat.png',
            price = 300
        },
        [2] = {
            name = 'Sarı Küçük Şapka',
            item = 'tinyhat2',
            detail = 'Sevimli bir küçük şapka',
            image = 'tinyhat2.png',
            price = 300
        },
        [3] = {
            name = 'Yeşil Küçük Şapka',
            item = 'tinyhat3',
            detail = 'Sevimli bir küçük şapka',
            image = 'tinyhat3.png',
            price = 300
        },
        [4] = {
            name = 'Cam Göbeği Küçük Şapka',
            item = 'tinyhat4',
            detail = 'Sevimli bir küçük şapka',
            image = 'tinyhat4.png',
            price = 300
        },
        [5] = {
            name = 'Mavi Küçük Şapka',
            item = 'tinyhat5',
            detail = 'Sevimli bir küçük şapka',
            image = 'tinyhat5.png',
            price = 300
        },
        [6] = {
            name = 'Mor Küçük Şapka',
            item = 'tinyhat6',
            detail = 'Sevimli bir küçük şapka',
            image = 'tinyhat6.png',
            price = 300
        },
        [7] = {
            name = 'Pembe Küçük Şapka',
            item = 'tinyhat7',
            detail = 'Sevimli bir küçük şapka',
            image = 'tinyhat7.png',
            price = 300
        },
        [8] = {
            name = 'Kırmızı Küçük Şapka',
            item = 'tinyhat8',
            detail = 'Sevimli bir küçük şapka',
            image = 'tinyhat8.png',
            price = 300
        },
        [9] = {
            name = 'Turuncu Küçük Şapka',
            item = 'tinyhat9',
            detail = 'Sevimli bir küçük şapka',
            image = 'tinyhat9.png',
            price = 300
        },
        [10] = {
            name = 'Bej Küçük Şapka',
            item = 'tinyhat10',
            detail = 'Sevimli bir küçük şapka',
            image = 'tinyhat10.png',
            price = 300
        },
        [11] = {
            name = 'Mavi Bandana',
            item = 'bluebandana',
            detail = 'Çete hayatı, pug!',
            image = 'bluebandana.png',
            price = 200
        },
        [12] = {
            name = 'Siyah Bandana',
            item = 'blackbandana',
            detail = 'Çete hayatı, pug!',
            image = 'blackbandana.png',
            price = 200
        },
        [13] = {
            name = 'Sarı Boynuz',
            item = 'unihorn',
            detail = 'Evcil hayvanım harikalar diyarında',
            image = 'unihorn.png',
            price = 200
        },
        [14] = {
            name = 'Yeşil Boynuz',
            item = 'unihorn2',
            detail = 'Evcil hayvanım harikalar diyarında',
            image = 'unihorn2.png',
            price = 75
        },
        [15] = {
            name = 'Mavi Boynuz',
            item = 'unihorn3',
            detail = 'Evcil hayvanım harikalar diyarında',
            image = 'unihorn3.png',
            price = 175
        },
        [16] = {
            name = 'Turuncu Boynuz',
            item = 'unihorn4',
            detail = 'Evcil hayvanım harikalar diyarında',
            image = 'unihorn4.png',
            price = 175
        },
        [17] = {
            name = 'Lacivert Boynuz',
            item = 'unihorn5',
            detail = 'Evcil hayvanım harikalar diyarında',
            image = 'unihorn5.png',
            price = 175
        },
        [18] = {
            name = 'Açık Yeşil Boynuz',
            item = 'unihorn6',
            detail = 'Evcil hayvanım harikalar diyarında',
            image = 'unihorn6.png',
            price = 175
        },
        [19] = {
            name = 'Gri Boynuz',
            item = 'unihorn7',
            detail = 'Evcil hayvanım harikalar diyarında',
            image = 'unihorn7.png',
            price = 175
        },
        [20] = {
            name = 'Turuncu-Pembe Boynuz',
            item = 'unihorn8',
            detail = 'Evcil hayvanım harikalar diyarında',
            image = 'unihorn8.png',
            price = 175
        },
        [21] = {
            name = 'Bej Boynuz',
            item = 'unihorn9',
            detail = 'Evcil hayvanım harikalar diyarında',
            image = 'unihorn9.png',
            price = 175
        },
        [22] = {
            name = 'Kahverengi Tasma',
            item = 'collar',
            detail = 'Bir sahibim var!',
            image = 'collar.png',
            price = 175
        },
        [23] = {
            name = 'Siyah Tasma',
            item = 'collar2',
            detail = 'Bir sahibim var!',
            image = 'collar2.png',
            price = 250
        },
        [24] = {
            name = 'Beyaz Tasma',
            item = 'collar3',
            detail = 'Bir sahibim var!',
            image = 'collar3.png',
            price = 250
        },
        [25] = {
            name = 'Sarı Tasma',
            item = 'collar4',
            detail = 'Bir sahibim var!',
            image = 'collar4.png',
            price = 250
        },
        [26] = {
            name = 'Yeşil Tasma',
            item = 'collar5',
            detail = 'Bir sahibim var!',
            image = 'collar5.png',
            price = 250
        },
        [27] = {
            name = 'Pembe Tasma',
            item = 'collar6',
            detail = 'Bir sahibim var!',
            image = 'collar6.png',
            price = 250
        },
        [28] = {
            name = 'Desenli Tasma',
            item = 'collar7',
            detail = 'Bir sahibim var!',
            image = 'collar7.png',
            price = 250
        },
        [29] = {
            name = 'Havalı Gözlük',
            item = 'coolglasses',
            detail = 'Benim havalı sevgilim!',
            image = 'coolglasses.png',
            price = 350
        },
        [30] = {
            name = 'Gül',
            item = 'rose',
            detail = 'Juliett için',
            image = 'rose.png',
            price = 75
        },
        [31] = {
            name = 'Çiftçi Şapkası',
            item = 'hat',
            detail = 'Tarlada yaşıyoruz',
            image = 'hat.png',
            price = 125
        },
        [32] = {
            name = 'Baret',
            item = 'hat2',
            detail = 'Önce güvenlik',
            image = 'hat2.png',
            price = 75
        },
        [33] = {
            name = 'Turuncu Siperlik',
            item = 'glasses2',
            detail = 'Güzel bir turuncu vizör',
            image = 'glasses2.png',
            price = 75
        },
        [34] = {
            name = 'Güneş Gözlüğü',
            item = 'glasses',
            detail = 'Güneşe izin yok',
            image = 'glasses.png',
            price = 75
        },
        [35] = {
            name = 'Oyun Kolu',
            item = 'controller',
            detail = 'Fifa daha iyi',
            image = 'controller.png',
            price = 75
        },
        [36] = {
            name = 'Oyuncak Ayı',
            item = 'teddybear',
            detail = 'Tombul...',
            image = 'teddybear.png',
            price = 75
        },
        -- Update v1.5
        [37] = {
            name = 'Papyon',
            item = 'bowtie',
            detail = 'Geceye hazır',
            image = 'bowtie.png',
            price = 75
        },
        [38] = {
            name = 'Siyah Yelek',
            item = 'blackvest',
            detail = 'Siyah daha iyi',
            image = 'blackvest.png',
            price = 150
        },
        [39] = {
            name = 'Elit Tasma',
            item = 'elytecollar',
            detail = 'Burjuvazi!',
            image = 'elytecollar.png',
            price = 75
        },
        [40] = {
            name = 'Kırmızı Yelek',
            item = 'redvest',
            detail = 'Rahat',
            image = 'redvest.png',
            price = 75
        },
        [41] = {
            name = 'Batman Yeleği',
            item = 'batmanvest',
            detail = 'Şehir ona ihtiyaç duyuyor...',
            image = 'batmanvest.png',
            price = 75
        },
        [42] = {
            name = 'Arı Kanatları',
            item = 'beewings',
            detail = 'Arı gibi vız!',
            image = 'beewings.png',
            price = 75
        },
        [43] = {
            name = 'Arı Kuyruğu',
            item = 'beetail',
            detail = 'Arı gibi vız!',
            image = 'beetail.png',
            price = 75
        },
        [44] = {
            name = 'Parti Gözlükleri',
            item = 'partyglasses',
            detail = 'Eğlence modunda',
            image = 'partyglasses.png',
            price = 75
        },
        [45] = {
            name = 'Zincir',
            item = 'petchain',
            detail = 'Süper hava atma',
            image = 'chain.png',
            price = 125
        },
        [46] = {
            name = 'Geyik Boynuzu',
            item = 'petdeer',
            detail = 'Bir geyik gibi',
            image = 'deer.png',
            price = 75
        },
        [47] = {
            name = 'Papatya Tacı',
            item = 'daisycrown',
            detail = 'Papatya benim favorim',
            image = 'daisycrown.png',
            price = 75
        },
        [48] = {
            name = 'Aşçı Şapkası',
            item = 'petchef',
            detail = 'Lezzetli',
            image = 'chef.png',
            price = 75
        },
        [49] = {
            name = 'Papatya Yeleği',
            item = 'daisyvest',
            detail = 'Çiçekler..',
            image = 'daisyvest.png',
            price = 75
        },
        [50] = {
            name = 'Peri Yeleği',
            item = 'fairyvest',
            detail = 'Bir peri masalı gibi',
            image = 'fairyvest.png',
            price = 75
        },
        [51] = {
            name = 'Kahverengi Ayakkabılar',
            item = 'brownshoes',
            detail = "Nikey'ime bak",
            image = 'brownshoes.png',
            price = 750
        },
        [52] = {
            name = 'Yılbaşı Yeleği',
            item = 'xmasvest',
            detail = 'Mutlu 2024!',
            image = 'xmasvest.png',
            price = 75
        },
        [53] = {
            name = 'Pembe Kazak',
            item = 'pinksweater',
            detail = 'Sıcacık ve rahat tutar',
            image = 'pinksweater.png',
            price = 75
        },
        [54] = {
            name = 'Boncuk Kolye',
            item = 'beadnecklace',
            detail = 'Şık bir boncuk kolye',
            image = 'beadnecklace.png',
            price = 75
        },
        -- [55] = {
        --     name = 'K9 Yeleği',
        --     item = 'k9vest',
        --     detail = 'Sadece K9 köpekler için',
        --     image = 'k9vest.png',
        --     price = 750
        -- },
    },
    ["food"] = {
        [1] = {
            name = 'İsim Etiketi',
            item = 'nametag',
            detail = 'Evcil hayvanınızı yeniden adlandırın',
            image = 'nametag.png',
            price = 250
        },
        [2] = {
            name = 'Evcil Hayvan Mama Kabı',
            item = 'petbowl',
            detail = 'Evcil hayvanınızı besleyin',
            image = 'petbowl.png',
            price = 300
        },
        [3] = {
            name = 'Evcil Hayvan Yatağı',
            item = 'petbed',
            detail = 'Evcil hayvanınız için güzel bir uyku yeri',
            image = 'bed1.png',
            price = 400
        },
        [4] = {
            name = 'Evcil Hayvan Yatağı',
            item = 'petbed2',
            detail = 'Evcil hayvanınız için güzel bir uyku yeri',
            image = 'bed2.png',
            price = 400
        },
        [5] = {
            name = 'Tedavi Kiti',
            item = 'treatmentkit',
            detail = 'Evcil hayvanınızı bu kit ile iyileştirin',
            image = 'treatmentkit.png',
            price = 750
        },
        [6] = {
            name = 'Canlandırma Kiti',
            item = 'revivekit',
            detail = 'Evcil hayvanınızı bu kit ile diriltin',
            image = 'revivekit.png',
            price = 1500
        },
        [7] = {
            name = 'Tedavi Hapları',
            item = 'treatmentpills',
            detail = 'Evcil hayvanınızı bu hap ile tedavi edin',
            image = 'treatmentpills.png',
            price = 125
        }
    }
}

---------------------------PET SHOP----------------------------
---------------------------------------------------------------

--[[	
	You can add additional items to specified shop from here.

	name = Item Label will be displayed
	item = Item spawn code
	detail = Description of item that we are selling
	price = Cost of item

	--- @param WARNING!!! name value cant be same with another item
]]

Config.PetShop = {
    ["pets"] = {
        [1] = {
            name = 'Rottweiler',
            pet = 'a_c_chop',
            image = 'rottweiler.png',
            price = 5000
        },
        [2] = {
            name = 'Westy',
            pet = 'a_c_westy_2',
            image = 'westy.png',
            price = 3500
        },
        [3] = {
            name = 'Pug',
            pet = 'a_c_pug',
            image = 'pug.png',
            price = 7500
        },
        [4] = {
            name = 'Çoban Köpeği',
            pet = 'a_c_shepherd_2',
            image = 'shepherd.png',
            price = 3500
        },
        [5] = {
            name = 'Retriever',
            pet = 'a_c_retriever_2',
            image = 'retriever.png',
            price = 4500
        },
        [6] = {
            name = 'Kaniş',
            pet = 'a_c_poodle_2',
            image = 'poodle.png',
            price = 5500
        },
        [7] = {
            name = 'Husky',
            pet = 'a_c_husky_2',
            image = 'husky.png',
            price = 12000
        },
        [8] = {
            name = 'Kedi',
            pet = 'a_c_cat_01',
            image = 'cat.png',
            price = 3500
        },
        [9] = {
            name = 'İngiliz Bulldog',
            pet = 'dusa_englishbulldog',
            image = 'englishbulldog.png',
            price = 6000
        },
        [10] = {
            name = 'Cane Corso',
            pet = 'dusa_cane',
            image = 'canecorso.png',
            price = 4500
        },
        [11] = {
            name = 'Sfenks Kedi',
            pet = 'dusa_sphynx',
            image = 'sphynx.png',
            price = 2000
        },
    }
}

-----------------------CLOTHES & PROPS-------------------------
---------------------------------------------------------------

--[[	
	You can add custom clothes and props for specified pet from here.

	Name = Item Label will be displayed on pet item inventory
	Item = Item spawn code
	Object = If we trying to put an object to our pet, fill object name to here.
	PropLocation = Prop Placement
]]

Config.Clothes = {
    ['head'] = {
        ['rose'] = {
            Name = "Rose",
            Item = "rose",
            Type = "common",
            Object = 'prop_single_rose',
            PropLocation = {
                small_dog = {
                    bone = 43,
                    x = 0.15332691190758,
                    y = -0.062107743663485,
                    z = 0.066639859404067,
                    rx = 0,
                    ry = 0,
                    rz = 0
                },
                mid_dog = {
                    bone = 24,
                    x = 0.2,
                    y = 0.04,
                    z = -0.02,
                    rx = -87.63,
                    ry = 0.0,
                    rz = 0.0
                },
                big_dog = {
                    bone = 24,
                    x = 0.22,
                    y = 0.0,
                    z = -0.18,
                    rx = -88.2,
                    ry = 0.0,
                    rz = 0.0
                },
                cat = {
                    bone = 30,
                    x = 0.048632767184813,
                    y = -0.040485144069792,
                    z = 0.063472026045328,
                    rx = 0,
                    ry = 0,
                    rz = 0
                }
            }
        },
        ['teddybear'] = {
            Name = "Teddybear",
            Item = "teddybear",
            Type = "common",
            Object = 'v_ilev_mr_rasberryclean',
            PropLocation = {
                small_dog = {
                    bone = 43,
                    x = 0.23797552126564,
                    y = -0.16283801945746,
                    z = 0.081646299885037,
                    rx = -121.03013591781,
                    ry = -2.8499769862592,
                    rz = -5.2166469225047
                },
                mid_dog = {
                    bone = 24,
                    x = 0.27390041590979,
                    y = -0.0036334737099782,
                    z = -0.12255619207937,
                    rx = -22.388692918892,
                    ry = 0.44939278415787,
                    rz = 1.090776652701
                },
                big_dog = {
                    bone = 28,
                    x = 0.3130782813796,
                    y = -0.065821104946223,
                    z = -0.15280038261728,
                    rx = -35.429959401441,
                    ry = 0,
                    rz = 0
                },
                cat = {
                    bone = 30,
                    x = 0.13453436766997,
                    y = -0.15405085227926,
                    z = 0.024219005651067,
                    rx = -111.59288025536,
                    ry = -0.027243756027282,
                    rz = 8.2486889759476
                }
            }
        },
        ['controller'] = {
            Name = "Controller",
            Item = "controller",
            Type = "common",
            Object = 'prop_controller_01',
            PropLocation = {
                small_dog = {
                    bone = 43,
                    x = 0.16758927604656,
                    y = -0.085040869561587,
                    z = 0.013206661003331,
                    rx = -142.66544242445,
                    ry = -55.186499503864,
                    rz = -11.392768108621
                },
                mid_dog = {
                    bone = 24,
                    x = 0.29934235398764,
                    y = 0.013279733065824,
                    z = -0.013241819360333,
                    rx = -40.599750417246,
                    ry = 4.3496596984102,
                    rz = -5.5657128534063
                },
                big_dog = {
                    bone = 28,
                    x = 0.30658891181076,
                    y = -0.035751250342854,
                    z = -0.078547007521069,
                    rx = -66.03718105409,
                    ry = 24.44854468552,
                    rz = -35.652548935388
                },
                cat = {
                    bone = 30,
                    x = 0.11187854467801,
                    y = -0.001677991836873,
                    z = -0.0094256768097289,
                    rx = -130.59245422765,
                    ry = -29.666187986369,
                    rz = 29.457671342692
                }
            }
        },
        ['glasses'] = {
            Name = "Glasses",
            Item = "glasses",
            Type = "common",
            Object = 'prop_cs_sol_glasses',
            PropLocation = {
                small_dog = {
                    bone = 43,
                    x = 0.078260785458838,
                    y = 0.01601204924513,
                    z = -0.013027493894448,
                    rx = -93.848679250994,
                    ry = 82.838386854986,
                    rz = -2.3669491112577
                },
                mid_dog = {
                    bone = 24,
                    x = 0.11811521065397,
                    y = 0.0039491253274335,
                    z = 0.033960687032447,
                    rx = 1.6326613277509,
                    ry = -24.730177679491,
                    rz = 86.102304710203
                },
                big_dog = {
                    bone = 28,
                    x = 0.15980705975198,
                    y = -0.00036652981173241,
                    z = 0.058642375397252,
                    rx = -0.20109280551227,
                    ry = -3.0476634207628,
                    rz = 93.776844344287
                },
                cat = {
                    bone = 30,
                    x = -0.0069889462531592,
                    y = 0.007682379685312,
                    z = 0.0072323714742633,
                    rx = 71.58508147373,
                    ry = -84.816364721435,
                    rz = 167.85992890735
                }
            }
        },
        ['glasses2'] = {
            Name = "Orange Glasses",
            Item = "glasses2",
            Object = 'prop_safety_glasses',
            Type = "common",
            PropBone = 57, -- head
            PropLocation = {
                small_dog = {
                    bone = 43,
                    x = 0.077959883674453,
                    y = 0.0018896452034932,
                    z = 0.0012582459325001,
                    rx = -105.28276119458,
                    ry = 82.387292110243,
                    rz = 5.316676054293
                },
                mid_dog = {
                    bone = 24,
                    x = 0.1066189353952,
                    y = 0.0057314671486598,
                    z = 0.037805535245232,
                    rx = -2.387856089624,
                    ry = -18.234573185335,
                    rz = 97.590868436293
                },
                big_dog = {
                    bone = 28,
                    x = 0.18053396145797,
                    y = 0.00048140398878868,
                    z = 0.06503885407883,
                    rx = -0.70872632716882,
                    ry = -10.639565221985,
                    rz = 93.833096033136
                },
                cat = {
                    bone = 30,
                    x = -0.0019672564595794,
                    y = -0.0085080855874836,
                    z = 0.0053487454013671,
                    rx = 60.060641479984,
                    ry = -81.544862712488,
                    rz = -178.89868095781
                }
            }
        },
        ['hat'] = {
            Name = "Cool Hat",
            Item = "hat",
            Object = 'prop_proxy_hat_01',
            Type = "common",
            PropBone = 57, -- head
            PropLocation = {
                small_dog = {
                    bone = 43,
                    x = -0.050429144037253,
                    y = 0.0031918678752557,
                    z = 0.023357459751596,
                    rx = -46.867272410138,
                    ry = -38.059939902661,
                    rz = 44.908553864873
                },
                mid_dog = {
                    bone = 24,
                    x = 0.0,
                    y = 0.0057099868212281,
                    z = 0.077327563973554,
                    rx = -4.6042081888232,
                    ry = -24.83168351775,
                    rz = 82.345522395818
                },
                big_dog = {
                    bone = 28,
                    x = 0.074208001710417,
                    y = -0.0051760594032867,
                    z = 0.15834367398835,
                    rx = -7.1803610894215,
                    ry = -1.9911139279042,
                    rz = 74.581610254669
                },
                cat = {}
            }
        },
        ['hat2'] = {
            Name = "Hard Hat",
            Item = "hat2",
            Object = 'prop_hard_hat_01',
            Type = "common",
            PropBone = 57, -- head
            PropLocation = {
                small_dog = {
                    bone = 43,
                    x = 0.0,
                    y = 0.071232871935932,
                    z = 0.0076047877806853,
                    rx = -106.52058425262,
                    ry = 77.82590722619,
                    rz = 16.14553182329
                },
                mid_dog = {
                    bone = 24,
                    x = -0.038120310392856,
                    y = -0.014874978093623,
                    z = 0.057055152479202,
                    rx = 4.2372506146564,
                    ry = -38.502806142872,
                    rz = 83.213235626414
                },
                big_dog = {
                    bone = 28,
                    x = 0.041572671887593,
                    y = -0.0057471885795875,
                    z = 0.14814030157223,
                    rx = -1.0558362494377,
                    ry = -10.544063166281,
                    rz = 95.75112075677
                },
                cat = {}
            }
        },
        ['collar'] = {
            Name = "Brown Collar",
            Item = "collar",
            Type = "dog",
            Component = 3,
            Variation = 1,
            Texture = 0
        },
        ['collar2'] = {
            Name = "Black Collar",
            Item = "collar2",
            Type = "dog",
            Component = 3,
            Variation = 1,
            Texture = 1
        },
        ['collar3'] = {
            Name = "White Collar",
            Item = "collar3",
            Type = "dog",
            Component = 3,
            Variation = 1,
            Texture = 2
        },
        ['collar4'] = {
            Name = "Yellow Collar",
            Item = "collar4",
            Type = "dog",
            Component = 3,
            Variation = 1,
            Texture = 3
        },
        ['collar5'] = {
            Name = "Green Collar",
            Item = "collar5",
            Type = "dog",
            Component = 3,
            Variation = 1,
            Texture = 4
        },
        ['collar6'] = {
            Name = "Pink Collar",
            Item = "collar6",
            Type = "dog",
            Component = 3,
            Variation = 1,
            Texture = 5
        },
        ['collar7'] = {
            Name = "Patterned Collar",
            Item = "collar7",
            Type = "dog",
            Component = 3,
            Variation = 1,
            Texture = 6
        },
        ['coolglasses'] = {
            Name = "Cool Glasses",
            Item = "coolglasses",
            Type = "dog",
            Component = 1,
            Variation = 1,
            Texture = 0
        },
        ['bluebandana'] = {
            Name = "Blue Bandana",
            Item = "bluebandana",
            Type = "dog",
            Component = 3,
            Variation = 2,
            Texture = 0
        },
        ['blackbandana'] = {
            Name = "Black Bandana",
            Item = "blackbandana",
            Type = "dog",
            Component = 3,
            Variation = 2,
            Texture = 1
        },
        ['unihorn'] = {
            Name = "Yellow Horn",
            Item = "unihorn",
            Type = "dog",
            Component = 8,
            Variation = 1,
            Texture = 0
        },
        ['unihorn2'] = {
            Name = "Green Horn",
            Item = "unihorn2",
            Type = "dog",
            Component = 8,
            Variation = 1,
            Texture = 1
        },
        ['unihorn3'] = {
            Name = "Blue Horn",
            Item = "unihorn3",
            Type = "dog",
            Component = 8,
            Variation = 1,
            Texture = 2
        },
        ['unihorn4'] = {
            Name = "Orange Horn",
            Item = "unihorn4",
            Type = "dog",
            Component = 8,
            Variation = 1,
            Texture = 3
        },
        ['unihorn5'] = {
            Name = "Navy Blue Horn",
            Item = "unihorn5",
            Type = "dog",
            Component = 8,
            Variation = 1,
            Texture = 4
        },
        ['unihorn6'] = {
            Name = "Light Green Horn",
            Item = "unihorn6",
            Type = "dog",
            Component = 8,
            Variation = 1,
            Texture = 5
        },
        ['unihorn7'] = {
            Name = "Gray Horn",
            Item = "unihorn7",
            Type = "dog",
            Component = 8,
            Variation = 1,
            Texture = 6
        },
        ['unihorn8'] = {
            Name = "Orange-Pink Horn",
            Item = "unihorn8",
            Type = "dog",
            Component = 8,
            Variation = 1,
            Texture = 7
        },
        ['unihorn9'] = {
            Name = "Beige Horn",
            Item = "unihorn9",
            Type = "dog",
            Component = 8,
            Variation = 1,
            Texture = 8
        },
        ['tinyhat'] = {
            Name = "Brown Tiny Hat",
            Item = "tinyhat",
            Type = "dog",
            Component = 8,
            Variation = 2,
            Texture = 0
        },
        ['tinyhat2'] = {
            Name = "Yellow Tiny Hat",
            Item = "tinyhat2",
            Type = "dog",
            Component = 8,
            Variation = 2,
            Texture = 1
        },
        ['tinyhat3'] = {
            Name = "Green Tiny Hat",
            Item = "tinyhat3",
            Type = "dog",
            Component = 8,
            Variation = 2,
            Texture = 2
        },
        ['tinyhat4'] = {
            Name = "Cyan Tiny Hat",
            Item = "tinyhat4",
            Type = "dog",
            Component = 8,
            Variation = 2,
            Texture = 3
        },
        ['tinyhat5'] = {
            Name = "Blue Tiny Hat",
            Item = "tinyhat5",
            Type = "dog",
            Component = 8,
            Variation = 2,
            Texture = 4
        },
        ['tinyhat6'] = {
            Name = "Purple Tiny Hat",
            Item = "tinyhat6",
            Type = "dog",
            Component = 8,
            Variation = 2,
            Texture = 5
        },
        ['tinyhat7'] = {
            Name = "Pink Tiny Hat",
            Item = "tinyhat7",
            Type = "dog",
            Component = 8,
            Variation = 2,
            Texture = 6
        },
        ['tinyhat8'] = {
            Name = "Red Tiny Hat",
            Item = "tinyhat8",
            Type = "dog",
            Component = 8,
            Variation = 2,
            Texture = 7
        },
        ['tinyhat9'] = {
            Name = "Orange Tiny Hat",
            Item = "tinyhat9",
            Type = "dog",
            Component = 8,
            Variation = 2,
            Texture = 8
        },
        ['tinyhat10'] = {
            Name = "Beige Tiny Hat",
            Item = "tinyhat10",
            Type = "dog",
            Component = 8,
            Variation = 2,
            Texture = 9
        },

        -- Update v1.5
        ['petchef'] = {
            Name = "Chef Hat",
            Item = "petchef",
            Type = "dog",
            Component = 8,
            Variation = 1,
            Texture = 0
        },
        ['xmasvest'] = {
            Name = "XMas Vest",
            Item = "xmasvest",
            Type = "dog",
            Component = 3,
            Variation = 2,
            Texture = 0
        },
        ['pinksweater'] = {
            Name = "Pink Sweater",
            Item = "pinksweater",
            Type = "dog",
            Component = 3,
            Variation = 5,
            Texture = 0
        },
        ['beadnecklace'] = {
            Name = "Bead Necklace",
            Item = "beadnecklace",
            Type = "dog",
            Component = 7,
            Variation = 4,
            Texture = 0
        },
        ['daisycrown'] = {
            Name = "Daisy Crown",
            Item = "daisycrown",
            Type = "dog",
            Component = 8,
            Variation = 4,
            Texture = 0
        },
        ['brownshoes'] = {
            Name = "Brown Shoes",
            Item = "brownshoes",
            Type = "dog",
            Component = 6,
            Variation = 1,
            Texture = 0
        },
        ['fairyvest'] = {
            Name = "Fairy Vest",
            Item = "fairyvest",
            Type = "dog",
            Component = 3,
            Variation = 1,
            Texture = 0
        },
        ['elytecollar'] = {
            Name = "Elyte Collar",
            Item = "elytecollar",
            Type = "dog",
            Component = 7,
            Variation = 3,
            Texture = 0
        },
        ['blackvest'] = {
            Name = "Black Vest",
            Item = "blackvest",
            Type = "dog",
            Component = 3,
            Variation = 6,
            Texture = 0
        },
        ['daisyvest'] = {
            Name = "Daisy Vest",
            Item = "daisyvest",
            Type = "dog",
            Component = 7,
            Variation = 6,
            Texture = 0
        },
        ['redvest'] = {
            Name = "Red Vest",
            Item = "redvest",
            Type = "dog",
            Component = 3,
            Variation = 4,
            Texture = 0
        },
        ['batmanvest'] = {
            Name = "Batman Vest",
            Item = "batmanvest",
            Type = "dog",
            Component = 3,
            Variation = 3,
            Texture = 0
        },
        ['beewings'] = {
            Name = "Bee Wings",
            Item = "beewings",
            Type = "dog",
            Component = 7,
            Variation = 1,
            Texture = 0
        },
        ['beetail'] = {
            Name = "Bee Tail",
            Item = "beetail",
            Type = "dog",
            Component = 8,
            Variation = 2,
            Texture = 0
        },
        ['partyglasses'] = {
            Name = "Party Glasses",
            Item = "partyglasses",
            Type = "dog",
            Component = 7,
            Variation = 2,
            Texture = 0
        },
        ['petchain'] = {
            Name = "Chain",
            Item = "petchain",
            Type = "dog",
            Component = 7,
            Variation = 7,
            Texture = 0
        },
        ['petdeer'] = {
            Name = "Deer Horn",
            Item = "petdeer",
            Type = "dog",
            Component = 8,
            Variation = 3,
            Texture = 0
        },
        ['bowtie'] = {
            Name = "Bowtie",
            Item = "bowtie",
            Type = "dog",
            Component = 7,
            Variation = 5,
            Texture = 0
        },
        -- ['k9vest'] = {
        --     Name = "K9 Vest",
        --     Item = "k9vest",
        --     Type = "dog",
        --     Component = 3,
        --     Variation = 1,
        --     Texture = 0
        -- },
    },
    ['body'] = {}
}

-----------------------PETS & ANIMATIONS-----------------------
---------------------------------------------------------------

--[[	
	You can add custom pets and give them some animations from here.
	We categorised dogs as 3 different type. Small-Mid-Big
	These categories are depends on dog size. Compare them with default ones before doing anything.

	["type"] = Pet type
	["dictionary"] = Define animation dictionaries from this category
	["animation"] = Define animations from this category

	false means the pet you trying to is not able to do that animation.
	Website for animations - https://forge.plebmasters.de/animations
]]

Config.Pets = {
    ["Small Dogs"] = {
        ["a_c_poodle_2"] = {
            ["type"] = "dog",
            ["dictionary"] = {
                sit = "creatures@pug@amb@world_dog_sitting@idle_a",
                up = "creatures@pug@amb@world_dog_sitting@exit",
                bark = "creatures@pug@amb@world_dog_barking@idle_a",
                stopbark = "creatures@pug@amb@world_dog_barking@exit",
                sleep = false,
                wake = false,
                eat = false,
                getin = false,
                getout = false,
                carsit = false
            },
            ["animation"] = {
                sit = "idle_b",
                up = "exit",
                bark = "idle_a",
                stopbark = "exit",
                sleep = false,
                wake = false,
                eat = false,
                getin = false,
                getout = false,
                carsit = false
            }
        },
        ["a_c_pug"] = {
            ["type"] = "dog",
            ["dictionary"] = {
                sit = "creatures@pug@amb@world_dog_sitting@idle_a",
                up = "creatures@pug@amb@world_dog_sitting@exit",
                bark = "creatures@pug@amb@world_dog_barking@idle_a",
                stopbark = "creatures@pug@amb@world_dog_barking@exit",
                sleep = false,
                wake = false,
                eat = false,
                getin = false,
                getout = false,
                carsit = false
            },
            ["animation"] = {
                sit = "idle_b",
                up = "exit",
                bark = "idle_a",
                stopbark = "exit",
                sleep = false,
                wake = false,
                eat = false,
                getin = false,
                getout = false,
                carsit = false
            }
        },
        ["a_c_westy_2"] = {
            ["type"] = "dog",
            ["dictionary"] = {
                sit = "creatures@pug@amb@world_dog_sitting@idle_a",
                up = "creatures@pug@amb@world_dog_sitting@exit",
                bark = "creatures@pug@amb@world_dog_barking@idle_a",
                stopbark = "creatures@pug@amb@world_dog_barking@exit",
                sleep = false,
                wake = false,
                eat = false,
                getin = false,
                getout = false,
                carsit = false
            },
            ["animation"] = {
                sit = "idle_b",
                up = "exit",
                bark = "idle_a",
                stopbark = "exit",
                sleep = false,
                wake = false,
                eat = false,
                getin = false,
                getout = false,
                carsit = false
            }
        }
    },
    ["Mid Dogs"] = {
        ["a_c_retriever_2"] = {
            ["type"] = "dog",
            ["dictionary"] = {
                sit = "creatures@retriever@amb@world_dog_sitting@idle_a",
                up = "creatures@retriever@amb@world_dog_sitting@exit",
                bark = "creatures@rottweiler@amb@world_dog_barking@idle_a",
                stopbark = "creatures@retriever@amb@world_dog_barking@exit",
                sleep = "creatures@rottweiler@amb@sleep_in_kennel@",
                wake = "creatures@rottweiler@amb@sleep_in_kennel@",
                tricks = "creatures@rottweiler@tricks@",
                eat = "creatures@rottweiler@move",
                getin = "creatures@rottweiler@incar@",
                getout = "creatures@rottweiler@incar@",
                carsit = "creatures@rottweiler@incar@"
            },
            ["animation"] = {
                sit = "idle_b",
                up = "exit",
                bark = "idle_a",
                stopbark = "exit",
                sleep = "sleep_in_kennel",
                wake = "exit_kennel",
                paw = "paw_right_loop",
                stoppaw = "paw_right_exit",
                dance = "beg_loop",
                stopdance = "beg_exit",
                eat = "fetch_pickup",
                getin = "get_in",
                getout = "get_out",
                carsit = "lean_back"
            }
        },
        ["a_c_husky_2"] = {
            ["type"] = "dog",
            ["dictionary"] = {
                sit = "creatures@retriever@amb@world_dog_sitting@idle_a",
                up = "creatures@retriever@amb@world_dog_sitting@exit",
                bark = "creatures@rottweiler@amb@world_dog_barking@idle_a",
                stopbark = "creatures@retriever@amb@world_dog_barking@exit",
                sleep = "creatures@rottweiler@amb@sleep_in_kennel@",
                wake = "creatures@rottweiler@amb@sleep_in_kennel@",
                tricks = "creatures@rottweiler@tricks@",
                eat = "creatures@rottweiler@move",
                getin = "creatures@rottweiler@incar@",
                getout = "creatures@rottweiler@incar@",
                carsit = "creatures@rottweiler@incar@"
            },
            ["animation"] = {
                sit = "idle_b",
                up = "exit",
                bark = "idle_a",
                stopbark = "exit",
                sleep = "sleep_in_kennel",
                wake = "exit_kennel",
                paw = "paw_right_loop",
                stoppaw = "paw_right_exit",
                dance = "beg_loop",
                stopdance = "beg_exit",
                eat = "fetch_pickup",
                getin = "get_in",
                getout = "get_out",
                carsit = "lean_back"
            }
        },
        ["dusa_englishbulldog"] = {
            ["type"] = "dog",
            ["dictionary"] = {
                sit = "creatures@retriever@amb@world_dog_sitting@idle_a",
                up = "creatures@retriever@amb@world_dog_sitting@exit",
                bark = "creatures@rottweiler@amb@world_dog_barking@idle_a",
                stopbark = "creatures@retriever@amb@world_dog_barking@exit",
                sleep = "creatures@rottweiler@amb@sleep_in_kennel@",
                wake = "creatures@rottweiler@amb@sleep_in_kennel@",
                tricks = "creatures@rottweiler@tricks@",
                eat = "creatures@rottweiler@move",
                getin = "creatures@rottweiler@incar@",
                getout = "creatures@rottweiler@incar@",
                carsit = "creatures@rottweiler@incar@"
            },
            ["animation"] = {
                sit = "idle_b",
                up = "exit",
                bark = "idle_a",
                stopbark = "exit",
                sleep = "sleep_in_kennel",
                wake = "exit_kennel",
                paw = "paw_right_loop",
                stoppaw = "paw_right_exit",
                dance = "beg_loop",
                stopdance = "beg_exit",
                eat = "fetch_pickup",
                getin = "get_in",
                getout = "get_out",
                carsit = "lean_back"
            }
        },
    },
    ["Big Dogs"] = {
        ["a_c_chop"] = {
            ["type"] = "dog",
            ["dictionary"] = {
                sit = "creatures@retriever@amb@world_dog_sitting@idle_a",
                up = "creatures@retriever@amb@world_dog_sitting@exit",
                bark = "creatures@rottweiler@amb@world_dog_barking@idle_a",
                stopbark = "creatures@retriever@amb@world_dog_barking@exit",
                sleep = "creatures@rottweiler@amb@sleep_in_kennel@",
                wake = "creatures@rottweiler@amb@sleep_in_kennel@",
                tricks = "creatures@rottweiler@tricks@",
                eat = "creatures@rottweiler@move",
                getin = "creatures@rottweiler@incar@",
                getout = "creatures@rottweiler@incar@",
                carsit = "creatures@rottweiler@incar@"
            },
            ["animation"] = {
                sit = "idle_b",
                up = "exit",
                bark = "idle_a",
                stopbark = "exit",
                sleep = "sleep_in_kennel",
                wake = "exit_kennel",
                paw = "paw_right_loop",
                stoppaw = "paw_right_exit",
                dance = "beg_loop",
                stopdance = "beg_exit",
                eat = "fetch_pickup",
                getin = "get_in",
                getout = "get_out",
                carsit = "lean_back"
            }
        },
        ["a_c_shepherd_2"] = {
            ["type"] = "dog",
            ["dictionary"] = {
                sit = "creatures@retriever@amb@world_dog_sitting@idle_a",
                up = "creatures@retriever@amb@world_dog_sitting@exit",
                bark = "creatures@rottweiler@amb@world_dog_barking@idle_a",
                stopbark = "creatures@retriever@amb@world_dog_barking@exit",
                sleep = "creatures@rottweiler@amb@sleep_in_kennel@",
                wake = "creatures@rottweiler@amb@sleep_in_kennel@",
                tricks = "creatures@rottweiler@tricks@",
                eat = "creatures@rottweiler@move",
                getin = "creatures@rottweiler@incar@",
                getout = "creatures@rottweiler@incar@",
                carsit = "creatures@rottweiler@incar@"
            },
            ["animation"] = {
                sit = "idle_b",
                up = "exit",
                bark = "idle_a",
                stopbark = "exit",
                sleep = "sleep_in_kennel",
                wake = "exit_kennel",
                paw = "paw_right_loop",
                stoppaw = "paw_right_exit",
                dance = "beg_loop",
                stopdance = "beg_exit",
                eat = "fetch_pickup",
                getin = "get_in",
                getout = "get_out",
                carsit = "lean_back"
            }
        },
        ["dusa_cane"] = {
            ["type"] = "dog",
            ["dictionary"] = {
                sit = "creatures@retriever@amb@world_dog_sitting@idle_a",
                up = "creatures@retriever@amb@world_dog_sitting@exit",
                bark = "creatures@rottweiler@amb@world_dog_barking@idle_a",
                stopbark = "creatures@retriever@amb@world_dog_barking@exit",
                sleep = "creatures@rottweiler@amb@sleep_in_kennel@",
                wake = "creatures@rottweiler@amb@sleep_in_kennel@",
                tricks = "creatures@rottweiler@tricks@",
                eat = "creatures@rottweiler@move",
                getin = "creatures@rottweiler@incar@",
                getout = "creatures@rottweiler@incar@",
                carsit = "creatures@rottweiler@incar@"
            },
            ["animation"] = {
                sit = "idle_b",
                up = "exit",
                bark = "idle_a",
                stopbark = "exit",
                sleep = "sleep_in_kennel",
                wake = "exit_kennel",
                paw = "paw_right_loop",
                stoppaw = "paw_right_exit",
                dance = "beg_loop",
                stopdance = "beg_exit",
                eat = "fetch_pickup",
                getin = "get_in",
                getout = "get_out",
                carsit = "lean_back"
            }
        },
        ["dusa_doberman"] = {
            ["type"] = "dog",
            ["dictionary"] = {
                sit = "creatures@retriever@amb@world_dog_sitting@idle_a",
                up = "creatures@retriever@amb@world_dog_sitting@exit",
                bark = "creatures@rottweiler@amb@world_dog_barking@idle_a",
                stopbark = "creatures@retriever@amb@world_dog_barking@exit",
                sleep = "creatures@rottweiler@amb@sleep_in_kennel@",
                wake = "creatures@rottweiler@amb@sleep_in_kennel@",
                tricks = "creatures@rottweiler@tricks@",
                eat = "creatures@rottweiler@move",
                getin = "creatures@rottweiler@incar@",
                getout = "creatures@rottweiler@incar@",
                carsit = "creatures@rottweiler@incar@"
            },
            ["animation"] = {
                sit = "idle_b",
                up = "exit",
                bark = "idle_a",
                stopbark = "exit",
                sleep = "sleep_in_kennel",
                wake = "exit_kennel",
                paw = "paw_right_loop",
                stoppaw = "paw_right_exit",
                dance = "beg_loop",
                stopdance = "beg_exit",
                eat = "fetch_pickup",
                getin = "get_in",
                getout = "get_out",
                carsit = "lean_back"
            }
        },
        -- ["ft-dobermanv2"] = {
        --     ["type"] = "dog",
        --     ["dictionary"] = {
        --         sit = "creatures@retriever@amb@world_dog_sitting@idle_a",
        --         up = "creatures@retriever@amb@world_dog_sitting@exit",
        --         bark = "creatures@rottweiler@amb@world_dog_barking@idle_a",
        --         stopbark = "creatures@retriever@amb@world_dog_barking@exit",
        --         sleep = "creatures@rottweiler@amb@sleep_in_kennel@",
        --         wake = "creatures@rottweiler@amb@sleep_in_kennel@",
        --         tricks = "creatures@rottweiler@tricks@",
        --         eat = "creatures@rottweiler@move",
        --         getin = "creatures@rottweiler@incar@",
        --         getout = "creatures@rottweiler@incar@",
        --         carsit = "creatures@rottweiler@incar@"
        --     },
        --     ["animation"] = {
        --         sit = "idle_b",
        --         up = "exit",
        --         bark = "idle_a",
        --         stopbark = "exit",
        --         sleep = "sleep_in_kennel",
        --         wake = "exit_kennel",
        --         paw = "paw_right_loop",
        --         stoppaw = "paw_right_exit",
        --         dance = "beg_loop",
        --         stopdance = "beg_exit",
        --         eat = "fetch_pickup",
        --         getin = "get_in",
        --         getout = "get_out",
        --         carsit = "lean_back"
        --     }
        -- },
        -- ["ft-pterrier"] = {
        --     ["type"] = "dog",
        --     ["dictionary"] = {
        --         sit = "creatures@retriever@amb@world_dog_sitting@idle_a",
        --         up = "creatures@retriever@amb@world_dog_sitting@exit",
        --         bark = "creatures@rottweiler@amb@world_dog_barking@idle_a",
        --         stopbark = "creatures@retriever@amb@world_dog_barking@exit",
        --         sleep = "creatures@rottweiler@amb@sleep_in_kennel@",
        --         wake = "creatures@rottweiler@amb@sleep_in_kennel@",
        --         tricks = "creatures@rottweiler@tricks@",
        --         eat = "creatures@rottweiler@move",
        --         getin = "creatures@rottweiler@incar@",
        --         getout = "creatures@rottweiler@incar@",
        --         carsit = "creatures@rottweiler@incar@"
        --     },
        --     ["animation"] = {
        --         sit = "idle_b",
        --         up = "exit",
        --         bark = "idle_a",
        --         stopbark = "exit",
        --         sleep = "sleep_in_kennel",
        --         wake = "exit_kennel",
        --         paw = "paw_right_loop",
        --         stoppaw = "paw_right_exit",
        --         dance = "beg_loop",
        --         stopdance = "beg_exit",
        --         eat = "fetch_pickup",
        --         getin = "get_in",
        --         getout = "get_out",
        --         carsit = "lean_back"
        --     }
        -- },
        -- ["golden_r"] = {
        --     ["type"] = "dog",
        --     ["dictionary"] = {
        --         sit = "creatures@retriever@amb@world_dog_sitting@idle_a",
        --         up = "creatures@retriever@amb@world_dog_sitting@exit",
        --         bark = "creatures@rottweiler@amb@world_dog_barking@idle_a",
        --         stopbark = "creatures@retriever@amb@world_dog_barking@exit",
        --         sleep = "creatures@rottweiler@amb@sleep_in_kennel@",
        --         wake = "creatures@rottweiler@amb@sleep_in_kennel@",
        --         tricks = "creatures@rottweiler@tricks@",
        --         eat = "creatures@rottweiler@move",
        --         getin = "creatures@rottweiler@incar@",
        --         getout = "creatures@rottweiler@incar@",
        --         carsit = "creatures@rottweiler@incar@"
        --     },
        --     ["animation"] = {
        --         sit = "idle_b",
        --         up = "exit",
        --         bark = "idle_a",
        --         stopbark = "exit",
        --         sleep = "sleep_in_kennel",
        --         wake = "exit_kennel",
        --         paw = "paw_right_loop",
        --         stoppaw = "paw_right_exit",
        --         dance = "beg_loop",
        --         stopdance = "beg_exit",
        --         eat = "fetch_pickup",
        --         getin = "get_in",
        --         getout = "get_out",
        --         carsit = "lean_back"
        --     }
        -- },
    },
    ["Cats"] = {
        ["a_c_cat_01"] = {
            ["type"] = "cat",
            ["dictionary"] = {
                sit = "creatures@cat@amb@world_cat_sleeping_ledge@idle_a",
                up = false,
                bark = false,
                stopbark = false,
                sleep = "creatures@cat@amb@world_cat_sleeping_ground@base",
                wake = "creatures@cat@amb@world_cat_sleeping_ground@exit",
                tricks = "creatures@rottweiler@tricks@",
                eat = false,
                getin = false,
                getout = false,
                carsit = false
            },
            ["animation"] = {
                sit = "idle_a",
                up = false,
                bark = false,
                stopbark = false,
                sleep = "base",
                wake = "exit",
                paw = false,
                stoppaw = false,
                dance = false,
                stopdance = false,
                eat = false,
                getin = false,
                getout = false,
                carsit = false
            }
        },
        ["dusa_sphynx"] = {
            ["type"] = "cat",
            ["dictionary"] = {
                sit = "creatures@cat@amb@world_cat_sleeping_ledge@base",
                up = false,
                bark = false,
                stopbark = false,
                sleep = "creatures@cat@amb@world_cat_sleeping_ground@base",
                wake = "creatures@cat@amb@world_cat_sleeping_ground@exit",
                tricks = "creatures@cat@amb@world_cat_sleeping_ground@exit",
                eat = false,
                getin = false,
                getout = false,
                carsit = false
            },
            ["animation"] = {
                sit = "base",
                up = false,
                bark = false,
                stopbark = false,
                sleep = "base",
                wake = "exit",
                paw = false,
                stoppaw = false,
                dance = false,
                stopdance = false,
                eat = false,
                getin = false,
                getout = false,
                carsit = false
            }
        },
    },
    ["Wild"] = {
        ["a_c_mtlion"] = {},
        ["a_c_panther"] = {},
        ["a_c_pig"] = {}
    },
    ["Other"] = {
        ["a_c_rabbit_01"] = {}
    }
}

-----------------------PETS & ANIMATIONS-----------------------
---------------------------------------------------------------

--[[	
	You can add custom pets and give them some animations from here.
	We categorised dogs as 3 different type. Small-Mid-Big
	These categories are depends on dog size. Compare them with default ones before doing anything.

	["type"] = Pet type
	["dictionary"] = Define animation dictionaries from this category
	["animation"] = Define animations from this category

	false means the pet you trying to is not able to do that animation.
	Website for animations - https://forge.plebmasters.de/animations
]]

Config.Emotes = {
    ["emotes"] = {
        [1] = {
            name = 'Top Fırlat',
            description = 'Attığınız top evcil hayvanınız tarafından geri getirilecek.',
            emote_code = 'ball'
        },
        [2] = {
            name = 'Otur',
            description = 'Evcil hayvanınıza oturmasını söyleyin.',
            emote_code = 'sit'
        },
        [3] = {
            name = 'Pet',
            description = 'Evcil hayvanınızın kafasını okşayın.',
            emote_code = 'pet'
        },
        [4] = {
            name = 'Yere Yat',
            description = 'Evcil hayvanınıza uzanmasını söyleyin.',
            emote_code = 'lay'
        },
        [5] = {
            name = 'Havla',
            description = 'Evcil hayvanınıza havlamasını söyleyin',
            emote_code = 'bark'
        },
        [6] = {
            name = 'Pençe/Pati',
            description = 'Evcil hayvanınız pençe atacak',
            emote_code = 'paw'
        },
        [7] = {
            name = 'Dans',
            description = 'Evcil hayvanınızı dans ettirin.',
            emote_code = 'dance'
        }
    },
    ["actions"] = {
        [1] = {
            name = 'Takip Et',
            description = 'Evcil hayvan sizi takip eder.',
            action_code = 'follow',
            icon = 'ball.svg'
        },
        [2] = {
            name = 'Go To',
            description = 'Evcil hayvan belirtilen konuma gider.',
            action_code = 'goto',
            icon = 'ball.svg'
        },
        -- [3] = {
        --     name = 'Attack',
        --     description = 'Have your pet attack the pointed person',
        --     action_code = 'attack',
        --     icon = 'ball.svg'
        -- },
        [3] = {
            name = 'Araca İn/Bin',
            description = "Evcil hayvanın araca in/bin yapar.",
            action_code = 'getin',
            icon = 'ball.svg'
        }
    }
}

------------------------PLACABLE OBJECTS-----------------------
---------------------------------------------------------------

--[[
	You can add custom objects that you can put anywhere for your pet from here.

	label = Item label will be shown in the menu
	prop = Prop code
	type = Item type for pet interaction. 
	Options : 
	bed = Your pet can sleep and sit on this object
	...
]]

Config.Objects = {
    [1] = {
        label = 'Bed 1',
        prop = 'sf_prop_sf_bed_dog_01a',
        item = 'petbed',
        type = 'bed'
    },
    [2] = {
        label = 'Bed 2',
        prop = 'sf_prop_sf_bed_dog_01b',
        item = 'petbed2',
        type = 'bed'
    }
}

----------------K9 OPTIONS/ALL CONFIGURATIONS------------------
---------------------------------------------------------------

--[[	
	You can configure K9 abilities and other things from here

]]

Config.PoliceJobs = {
    ['police'] = {
        grade = 2
    },
    ['sheriff'] = {
        grade = 0
    }
}

Config.K9 = {
    -- ['dusa_doberman'] = {
    --     name = 'Doberman K9',
    --     image = 'doberman.png',
    --     price = 100,
    --     pet = 'dusa_doberman',
    --     type = 'big', -- 'big' or 'mid' or 'small'
    --     attack = true,
    --     search = true,
    --     jobs = {
    --         ['police'] = {
    --             grade = 3
    --         },
    --         ['sheriff'] = {
    --             grade = 0
    --         }
    --     },
    --     permit = {
    --         'char3:d6427c9718e5503c240fd9dba0d9cb016ba15ad1'
    --     },
    --     animations = {
    --         ["dictionary"] = {
    --             sit = "creatures@retriever@amb@world_dog_sitting@idle_a",
    --             up = "creatures@retriever@amb@world_dog_sitting@exit",
    --             bark = "creatures@rottweiler@amb@world_dog_barking@idle_a",
    --             stopbark = "creatures@retriever@amb@world_dog_barking@exit",
    --             sleep = "creatures@rottweiler@amb@sleep_in_kennel@",
    --             wake = "creatures@rottweiler@amb@sleep_in_kennel@",
    --             tricks = "creatures@rottweiler@tricks@",
    --             eat = "creatures@rottweiler@move",
    --             getin = "creatures@rottweiler@incar@",
    --             getout = "creatures@rottweiler@incar@",
    --             carsit = "creatures@rottweiler@incar@"
    --         },
    --         ["animation"] = {
    --             sit = "idle_b",
    --             up = "exit",
    --             bark = "idle_a",
    --             stopbark = "exit",
    --             sleep = "sleep_in_kennel",
    --             wake = "exit_kennel",
    --             paw = "paw_right_loop",
    --             stoppaw = "paw_right_exit",
    --             dance = "beg_loop",
    --             stopdance = "beg_exit",
    --             eat = "fetch_pickup",
    --             getin = "get_in",
    --             getout = "get_out",
    --             carsit = "lean_back"
    --         }
    --     }
    -- },
}

Config.IllegalItems = { -- Add item code that will trigger K9
    'weed_whitewidow',
    'weed_skunk',
    'weed_purplehaze',
    'weed_ogkush',
    'weed_amnesia',
    'weed_ak47',
    'weed_whitewidow_seed',
    'weed_skunk_seed',
    'weed_purplehaze_seed',
    'weed_ogkush_seed',
    'weed_amnesia_seed',
    'weed_ak47_seed',
    'weed',
    'cocain',
    'cocaine',
    'meth',
    'opium',
    'weed_package',
    'weed_brick',
    'coke_brick',
    'joint',
    'cokebaggy',
    'crack_baggy',
    'xtcbaggy',
    'coke_small_brick',
    'oxy',
}

-------------------------TRANSLATIONS--------------------------
---------------------------------------------------------------
Config.Locale = "tr" -- en / de / fr / es / it / tr
Config.Translations = {
    ["en"] = {
        notifyError = 'Error!',
        notifySuccess = 'Success!',
        notifyInfo = 'Info',
        notifyHunger = 'Yummy!',

        -- Interactions
        e_interact = 'E - Open Shop',
        keymap_description = 'Pet Shop Interactions',

        -- Pet Store
        store_header = 'Buy some things for your animals!',
        store_addcart = 'Add',
        store_paycard = 'PAY TO CARD',
        store_paycash = 'PAY TO CASH',

        -- Wardrobe
        wardrobe_header = 'Dress up your pets!',
        wardrobe_info = 'INFO!',
        wardrobe_infop = 'Drag and drop to dress the pet',

        -- Emote Menu
        emote_emotes = 'EMOTES',
        emote_actions = 'ACTIONS',
        emote_health = 'HEALTH',
        emote_hunger = 'HUNGER',
        emote_healthy = 'HEALTHY',

        -- Pet Menu
        petmenu_pets = 'PETS',
        petmenu_call = 'CALL',
        petmenu_sleep = 'GO SLEEP',
        petmenu_delete = 'RELEASE',

        -- Release Pet Menu
        release_title = 'Are you sure?',
        release_yes = 'YES',
        release_no = 'NO',

        -- Pet Shop
        petshop_header = 'Adopt a new, cute pet!',
        petshop_addcart = 'Add',
        petshop_paycard = 'PAY TO CARD',
        petshop_paycash = 'PAY TO CASH',
        petshop_added = 'ADDED',
        petshop_delete = 'DELETE',
        petshop_rotate = 'PRESS A-D TO ROTATE'
    },
    ["de"] = {
        notifyError = 'Fehler!',
        notifySuccess = 'Erfolg!',
        notifyInfo = 'Info',
        notifyHunger = 'Lecker!',

        -- Interaktionen
        e_interact = 'E - Laden öffnen',
        keymap_description = 'Tierhandlungsinteraktionen',

        -- Tierladen
        store_header = 'Kaufen Sie einige Dinge für Ihre Tiere!',
        store_addcart = 'Hinzufügen',
        store_paycard = 'MIT KARTE BEZAHLEN',
        store_paycash = 'BAR BEZAHLEN',

        -- Kleiderschrank
        wardrobe_header = 'Kleiden Sie Ihre Haustiere an!',
        wardrobe_info = 'INFO!',
        wardrobe_infop = 'Zum Anziehen des Haustiers ziehen und ablegen',

        -- Emote-Menü
        emote_emotes = 'EMOTES',
        emote_actions = 'AKTIONEN',
        emote_health = 'GESUNDHEIT',
        emote_hunger = 'HUNGER',
        emote_healthy = 'GESUND',

        -- Haustiermenü
        petmenu_pets = 'HAUSTIERE',
        petmenu_call = 'RUFEN',
        petmenu_sleep = 'SCHLAFEN GEHEN',
        petmenu_delete = 'FREIGEBEN',

        -- Haustier freigeben Menü
        release_title = 'Sind Sie sicher?',
        release_yes = 'JA',
        release_no = 'NEIN',

        -- Tierladen
        petshop_header = 'Adoptiere ein neues, niedliches Haustier!',
        petshop_addcart = 'Hinzufügen',
        petshop_paycard = 'MIT KARTE BEZAHLEN',
        petshop_paycash = 'BAR BEZAHLEN',
        petshop_added = 'HINZUGEFÜGT',
        petshop_delete = 'LÖSCHEN',
        petshop_rotate = 'DRÜCKEN SIE A-D ZUM DREHEN'
    },
    ["es"] = {
        notifyError = '¡Error!',
        notifySuccess = '¡Éxito!',
        notifyInfo = 'Información',
        notifyHunger = '¡Yummy!',
    
        -- Interacciones
        e_interact = 'E - Abrir Tienda',
        keymap_description = 'Interacciones de la Tienda de Mascotas',

        -- Tienda de Mascotas
        store_header = '¡Compra algunas cosas para tus mascotas!',
        store_addcart = 'Agregar',
        store_paycard = 'PAGAR CON TARJETA',
        store_paycash = 'PAGAR EN EFECTIVO',
    
        -- Armario
        wardrobe_header = '¡Viste a tus mascotas!',
        wardrobe_info = '¡INFORMACIÓN!',
        wardrobe_infop = 'Arrastra y suelta para vestir a la mascota',
    
        -- Menú de Emotes
        emote_emotes = 'EMOTES',
        emote_actions = 'ACCIONES',
        emote_health = 'SALUD',
        emote_hunger = 'HAMBRE',
        emote_healthy = 'SANO',
    
        -- Menú de Mascotas
        petmenu_pets = 'MASCOTAS',
        petmenu_call = 'LLAMAR',
        petmenu_sleep = 'IR A DORMIR',
        petmenu_delete = 'LIBERAR',
    
        -- Menú de Liberación de Mascotas
        release_title = '¿Estás seguro?',
        release_yes = 'SÍ',
        release_no = 'NO',
    
        -- Tienda de Mascotas
        petshop_header = '¡Adopta una nueva y linda mascota!',
        petshop_addcart = 'Agregar',
        petshop_paycard = 'PAGAR CON TARJETA',
        petshop_paycash = 'PAGAR EN EFECTIVO',
        petshop_added = 'AGREGADO',
        petshop_delete = 'ELIMINAR',
        petshop_rotate = 'PRESIONA A-D PARA GIRAR'
    },
    ["it"] = {
        notifyError = 'Errore!',
        notifySuccess = 'Successo!',
        notifyInfo = 'Informazioni',
        notifyHunger = 'Delizioso!',

        -- Interazioni
        e_interact = 'E - Apri Negozio',
        keymap_description = 'Interazioni del Negozio di Animali',

        -- Negozio per Animali Domestici
        store_header = 'Compra qualcosa per i tuoi animali!',
        store_addcart = 'Aggiungi',
        store_paycard = 'PAGA CON LA CARTA',
        store_paycash = 'PAGA IN CONTANTI',
    
        -- Armadio
        wardrobe_header = 'Vesti i tuoi animali!',
        wardrobe_info = 'INFORMAZIONI!',
        wardrobe_infop = "Trascina e rilascia per vestire l'animale",
    
        -- Menu Emote
        emote_emotes = 'EMOTI',
        emote_actions = 'AZIONI',
        emote_health = 'SALUTE',
        emote_hunger = 'FAME',
        emote_healthy = 'IN SALUTE',
    
        -- Menu Animali Domestici
        petmenu_pets = 'ANIMALI',
        petmenu_call = 'CHIAMA',
        petmenu_sleep = 'VAI A DORMIRE',
        petmenu_delete = 'RILASCIA',
    
        -- Menu Rilascio Animali Domestici
        release_title = 'Sei sicuro?',
        release_yes = 'SÌ',
        release_no = 'NO',
    
        -- Negozio per Animali Domestici
        petshop_header = 'Adotta un nuovo, adorabile animale domestico!',
        petshop_addcart = 'Aggiungi',
        petshop_paycard = 'PAGA CON LA CARTA',
        petshop_paycash = 'PAGA IN CONTANTI',
        petshop_added = 'AGGIUNTO',
        petshop_delete = 'ELIMINA',
        petshop_rotate = 'PREMI A-D PER GIRARE'
    },
    ["fr"] = {
        notifyError = 'Erreur!',
        notifySuccess = 'Succès!',
        notifyInfo = 'Infos',
        notifyHunger = 'Miam !',
    
        -- Interactions
        e_interact = 'E - Ouvrir la Boutique',
        keymap_description = 'Interactions de la Boutique pour Animaux',

        -- Animalerie
        store_header = 'Achetez des choses pour vos animaux !',
        store_addcart = 'Ajouter',
        store_paycard = 'PAYER PAR CARTE',
        store_paycash = 'PAYER EN ESPÈCES',
    
        -- Armoire
        wardrobe_header = 'habillez vos animaux !',
        wardrobe_info = 'INFO !',
        wardrobe_infop = "Faites glisser et déposez pour habiller l'animal",
    
        -- Menu Emote
        emote_emotes = 'ÉMOTICÔNES',
        emote_actions = 'ACTIONS',
        emote_health = 'SANTÉ',
        emote_hunger = 'FAIM',
        emote_healthy = 'EN FORME',
    
        -- Menu des Animaux de Compagnie
        petmenu_pets = 'ANIMAUX',
        petmenu_call = 'APPELER',
        petmenu_sleep = 'DORMIR',
        petmenu_delete = 'LIBÉRER',
    
        -- Menu de Libération des Animaux de Compagnie
        release_title = 'Êtes-vous sûr ?',
        release_yes = 'OUI',
        release_no = 'NON',
    
        -- Animalerie
        petshop_header = 'Adoptez un nouvel animal de compagnie mignon !',
        petshop_addcart = 'Ajouter',
        petshop_paycard = 'PAYER PAR CARTE',
        petshop_paycash = 'PAYER EN ESPÈCES',
        petshop_added = 'AJOUTÉ',
        petshop_delete = 'SUPPRIMER',
        petshop_rotate = 'APPUYEZ SUR A-D POUR FAIRE TOURNER'
    },
    ["tr"] = {
        notifyError = 'Hata!',
        notifySuccess = 'Başarılı!',
        notifyInfo = 'Bilgi',
        notifyHunger = 'Lezzetli!',
    
        -- Etkileşimler
        e_interact = 'E - Mağazayı Aç',
        keymap_description = 'Evcil Hayvan Mağazası Etkileşimleri',

        -- Evcil Hayvan Mağazası
        store_header = 'Evcil hayvanlarınız için bazı şeyler satın alın!',
        store_addcart = 'Ekle',
        store_paycard = 'KARTLA ÖDE',
        store_paycash = 'NAKİTLE ÖDE',
    
        -- Giysi Dolabı
        wardrobe_header = 'Evcil hayvanlarınızı giydirin!',
        wardrobe_info = 'BİLGİ!',
        wardrobe_infop = 'Evcil hayvanı giydirmek için sürükleyin ve bırakın',
    
        -- Emote Menüsü
        emote_emotes = 'EMOTELER',
        emote_actions = 'EYLEMLER',
        emote_health = 'SAĞLIK',
        emote_hunger = 'AÇLIK',
        emote_healthy = 'SAĞLIKLI',
    
        -- Evcil Hayvan Menüsü
        petmenu_pets = 'PETLER',
        petmenu_call = 'ÇAĞIR',
        petmenu_sleep = 'UYUMAYA GİT',
        petmenu_delete = 'SERBEST BIRAK',
    
        -- Evcil Hayvanı Serbest Bırak Menüsü
        release_title = 'Emin misiniz?',
        release_yes = 'EVET',
        release_no = 'HAYIR',
    
        -- Evcil Hayvan Mağazası
        petshop_header = 'Yeni, sevimli bir evcil hayvan sahiplen!',
        petshop_addcart = 'Ekle',
        petshop_paycard = 'KARTLA ÖDE',
        petshop_paycash = 'NAKİTLE ÖDE',
        petshop_added = 'EKLENDİ',
        petshop_delete = 'SİL',
        petshop_rotate = 'DÖNDÜRMEK İÇİN A-D TUŞLARINA BAS'
    }
}

Config.Notifications = {
    ["en"] = {
        callpetfirst = 'Bu menüyü açmak için öncelikle evcil hayvanınızı almanız gerekiyor!',
        willsniff = 'Koklayacak', -- "Pet is going to sniff", will add petname to start of the sentence
        willattack = 'Saldıracak',
        caught_illness = 'Hastalığa yakalandı:',
        dead_revive = 'Evcil hayvanınız öldü! Onu acilen canlandırın!',
        eaten_food = 'Evcil hayvanınız yemeğini yemişti!',
        call_to_feed = 'Pet çağırmadan evcil hayvanınızı besleyemezsiniz',
        too_faraway = 'Evcil hayvanınızdan çok uzaktasınız. Uyumaya gitti',
        donthave_tennis = 'Tenis topunuz yok!',
        noveh_nearby = 'Yakınlarda araç yok.',
        following = 'Şimdi seni takip ediyor!',
        cant_animate = 'Bu evcil hayvan bu animasyonu yapamaz!',
        released_pet = 'Doğaya salındığında mutlu bir hayat yaşayacak.',
        pet_went = 'Sen öldüğün için evine gitti!',
        fartosend = 'Evcil hayvanınızı o kadar uzağa gönderemezsiniz!',
        pet_renamed_to = 'Evcil hayvanınızın adını şu şekilde değiştirdiniz:',
        call_to_rename = 'Evcil hayvanınızı çağırmadan yeniden adlandıramazsınız',
        petisinbed = ' zaten yatakta, bu eylemi yapamazsınız',

        -- target
        t_sleep = 'Uyu',
        t_sit = 'Otur',
        t_out = 'Çık',
        t_delete = 'Sil',

        -- k9
        k9_search = 'You can only search people with K9 dogs',
        k9_attack = 'You can only attack people with K9 dogs',
        k9_found = 'K9 found some illegal items at person',
        k9_nofound = 'K9 couldnt find anything',

        -- inform
        goto_info = 'Evcil hayvanınızın gidebileceği herhangi bir yeri seçin',
        attack_info = "Evcil hayvanınızın kime saldıracağını seçin! (İptal etmek için X'e basın)",

        -- text ui
        finalize_attack = '[E] - Saldırıyı Sonlandır',
        attack_canceled = 'Saldırı iptal edildi',
        determine_location = '[E] - Konumu belirle',

        -- context menu
        context_header = 'Evcil Hayvanınıza İsim Verin',
        context_label = 'İsim',
        context_desc = 'Evcil Hayvanınıza İsim Verin',

        -- shop
        totalpaid = '$ karşılığında bir şey satın aldınız',
        basket_empty = 'Sepetiniz boş! Şu anda ödeme yapamazsınız.',

        -- treatment
        treated_success = 'başarıyla tedavi edildi!',
        treatment_aborted = 'Tedaviyi bıraktın.',
        revived_success = 'başarıyla yeniden canlandırıldı!',
        already_healthy = 'zaten çok sağlıklı bir evcil hayvan, onu tedavi etmen için bir neden yok.',
        too_awaytotreat = "Sen pet'ten çok uzaktasın",
        callpet_totreat = 'Bu ürünü kullanmadan önce evcil hayvanınızı çağırmalısınız.',

        -- buy pet
        bought_pet = 'Başarıyla bir evcil hayvan satın aldınız!',
        not_enough_cash = 'Yeterli paranız yok!',
        not_enough_bank = 'Bankanızda yeterli paranız yok!',
    },
    ["de"] = {
        callpetfirst = 'Zuerst musst du deinen Haustier rufen, um dieses Menü zu öffnen!',
        willsniff = 'wird schnüffeln', -- "Das Haustier wird schnüffeln", Haustiername wird vor den Satz gestellt
        willattack = 'wird angreifen!',
        caught_illness = 'hat sich eine Krankheit eingefangen:',
        dead_revive = 'Dein Haustier ist tot! Erwecke ihn dringend zum Leben!',
        eaten_food = 'Dein Haustier hat sein Futter gegessen!',
        call_to_feed = 'Du kannst dein Haustier nicht füttern, bevor du es gerufen hast',
        too_faraway = 'Du bist zu weit von deinem Haustier entfernt. Es ist eingeschlafen',
        donthave_tennis = 'Du hast keinen Tennisball!',
        noveh_nearby = 'Es sind keine Fahrzeuge in der Nähe.',
        following = 'folgt dir jetzt!',
        cant_animate = 'Dieses Haustier kann diese Animation nicht ausführen',
        released_pet = 'wurde in die Natur entlassen, es wird ein glückliches Leben führen.',
        pet_went = 'ging nach Hause, weil du gestorben bist',
        fartosend = 'Du kannst dein Haustier nicht so weit schicken',
        pet_renamed_to = 'Du hast dein Haustier in umbenannt',
        call_to_rename = 'Du kannst dein Haustier nicht umbenennen, bevor du es gerufen hast',
        petisinbed = 'Haustier ist bereits im Bett, diese Aktion ist nicht möglich.',

        -- Ziel
        t_sleep = 'Schlafen',
        t_sit = 'Sitzen',
        t_out = 'Hinaus',
        t_delete = 'Entfernen',
    
        -- k9
        k9_search = 'Du kannst nur Personen mit K9-Hunden durchsuchen',
        k9_attack = 'Du kannst nur Personen mit K9-Hunden angreifen',
        k9_found = 'K9 hat einige illegale Gegenstände bei der Person gefunden.',
        k9_nofound = 'K9 konnte nichts finden.',
    
        -- informieren
        goto_info = 'Wähle einen Ort aus, den dein Haustier besuchen soll',
        attack_info = 'Wähle aus, wen dein Haustier angreifen wird! (Drücke X, um abzubrechen)',
    
        -- Text UI
        finalize_attack = '[E] - Angriff abschließen',
        attack_canceled = 'Angriff abgebrochen',
        determine_location = '[E] - Ort bestimmen',
    
        -- Kontextmenü
        context_header = 'Dein Haustier benennen',
        context_label = 'Name',
        context_desc = 'Dein Haustier benennen',
    
        -- Laden
        totalpaid = 'Du hast etwas für $ gekauft',
        basket_empty = 'Dein Warenkorb ist leer! Du kannst im Moment nicht bezahlen.',
    
        -- Behandlung
        treated_success = 'wurde erfolgreich behandelt!',
        treatment_aborted = 'Du hast die Behandlung abgebrochen.',
        revived_success = 'wurde erfolgreich wiederbelebt!',
        already_healthy = 'ist bereits ein sehr gesundes Haustier, es gibt keinen Grund, es zu behandeln.',
        too_awaytotreat = 'Du bist zu weit entfernt von',
        callpet_totreat = 'Du musst dein Haustier rufen, bevor du diesen Gegenstand benutzen kannst.',
    
        -- Haustier kaufen
        bought_pet = 'Du hast erfolgreich ein Haustier gekauft!',
        not_enough_cash = 'Du hast nicht genug Bargeld!',
        not_enough_bank = 'Du hast nicht genug Geld auf deinem Bankkonto!',
    },
    ["es"] = {
        callpetfirst = 'Primero debes llamar a tu mascota para abrir este menú.',
        willsniff = 'olerá', -- "La mascota va a oler", el nombre de la mascota se coloca al principio de la oración
        willattack = 'atacará',
        caught_illness = 'ha contraído una enfermedad:',
        dead_revive = '¡Tu mascota está muerta! ¡Revívela urgentemente!',
        eaten_food = 'Tu mascota ha comido su comida.',
        call_to_feed = 'No puedes alimentar a tu mascota antes de llamarla.',
        too_faraway = 'Estás demasiado lejos de tu mascota. Se ha ido a dormir.',
        donthave_tennis = '¡No tienes una pelota de tenis!',
        noveh_nearby = 'No hay vehículos cerca.',
        following = '¡te está siguiendo ahora!',
        cant_animate = 'Esta mascota no puede realizar esta animación.',
        released_pet = 'ha sido liberada a la naturaleza, vivirá una vida feliz.',
        pet_went = 'se fue a su hogar porque has muerto.',
        fartosend = 'No puedes enviar a tu mascota tan lejos.',
        pet_renamed_to = 'Has cambiado el nombre de tu mascota a',
        call_to_rename = 'No puedes cambiar el nombre de tu mascota antes de llamarla.',
        petisinbed = 'La mascota ya está en la cama, no puedes realizar esta acción.',

        -- target
        t_sleep = 'Dormir',
        t_sit = 'Sentarse',
        t_out = 'Salir',
        t_delete = 'Eliminar',
    
        -- k9
        k9_search = 'Solo puedes buscar a personas con perros K9.',
        k9_attack = 'Solo puedes atacar a personas con perros K9.',
        k9_found = 'K9 encontró algunos objetos ilegales en la persona.',
        k9_nofound = 'K9 no pudo encontrar nada.',
    
        -- informar
        goto_info = 'Elige cualquier ubicación para que tu mascota vaya.',
        attack_info = 'Elige a quién atacará tu mascota. (Presiona X para cancelar)',
    
        -- texto UI
        finalize_attack = '[E] - Finalizar Ataque',
        attack_canceled = 'Ataque cancelado',
        determine_location = '[E] - Determinar ubicación',
    
        -- menú contextual
        context_header = 'Nombrar a tu mascota',
        context_label = 'Nombre',
        context_desc = 'Nombrar a tu mascota',
    
        -- tienda
        totalpaid = 'Compraste algo por $',
        basket_empty = '¡Tu cesta está vacía! No puedes pagar en este momento.',
    
        -- tratamiento
        treated_success = 'fue tratada con éxito.',
        treatment_aborted = 'Abortaste el tratamiento.',
        revived_success = 'fue revivida con éxito.',
        already_healthy = 'es una mascota muy saludable, no hay razón para tratarla.',
        too_awaytotreat = 'Estás demasiado lejos de',
        callpet_totreat = 'Debes llamar a tu mascota antes de usar este objeto.',
    
        -- comprar mascota
        bought_pet = '¡Compraste con éxito una mascota!',
        not_enough_cash = '¡No tienes suficiente dinero en efectivo!',
        not_enough_bank = '¡No tienes suficiente dinero en tu banco!',
    },
    ["fr"] = {
        callpetfirst = "Vous devez d'abord appeler votre animal de compagnie pour ouvrir ce menu !",
        willsniff = 'va renifler', -- "L'animal de compagnie va renifler", le nom de l'animal de compagnie est placé au début de la phrase
        willattack = 'va attaquer !',
        caught_illness = 'a attrapé une maladie :',
        dead_revive = 'Votre animal de compagnie est mort ! Réanimez-le de toute urgence !',
        eaten_food = 'Votre animal de compagnie a mangé sa nourriture !',
        call_to_feed = "Vous ne pouvez pas nourrir votre animal de compagnie avant de l'avoir appelé.",
        too_faraway = "Vous êtes trop loin de votre animal de compagnie. Il s'est endormi.",
        donthave_tennis = "Vous n'avez pas de balle de tennis !",
        noveh_nearby = "Il n'y a pas de véhicule à proximité.",
        following = 'vous suit maintenant !',
        cant_animate = 'Cet animal de compagnie ne peut pas effectuer cette animation.',
        released_pet = 'a été relâché dans la nature, il vivra une vie heureuse.',
        pet_went = 'est rentré chez lui car vous êtes mort.',
        fartosend = 'Vous ne pouvez pas envoyer votre animal de compagnie aussi loin.',
        pet_renamed_to = 'Vous avez renommé votre animal de compagnie en',
        call_to_rename = "Vous ne pouvez pas renommer votre animal de compagnie avant de l'avoir appelé.",
        petisinbed = "L'animal de compagnie est déjà au lit, vous ne pouvez pas effectuer cette action.",

        -- target
        t_sleep = 'Dormir',
        t_sit = 'S\'asseoir',
        t_out = 'Sortir',
        t_delete = 'Supprimer',
    
        -- k9
        k9_search = 'Vous ne pouvez rechercher que des personnes avec des chiens K9.',
        k9_attack = 'Vous ne pouvez attaquer que des personnes avec des chiens K9.',
        k9_found = 'K9 a trouvé des objets illégaux sur la personne.',
        k9_nofound = 'K9 n\'a rien trouvé.',
    
        -- informer
        goto_info = 'Choisissez un endroit pour que votre animal de compagnie aille.',
        attack_info = 'Choisissez qui votre animal de compagnie attaquera ! (Appuyez sur X pour annuler)',
    
        -- texte UI
        finalize_attack = "[E] - Finaliser l'attaque",
        attack_canceled = 'Attaque annulée',
        determine_location = "[E] - Déterminer l'emplacement",
    
        -- menu contextuel
        context_header = 'Nommez votre animal de compagnie',
        context_label = 'Nom',
        context_desc = 'Nommez votre animal de compagnie',
    
        -- boutique
        totalpaid = 'Vous avez acheté quelque chose pour $',
        basket_empty = 'Votre panier est vide ! Vous ne pouvez pas payer pour le moment.',
    
        -- traitement
        treated_success = 'a été traité avec succès !',
        treatment_aborted = 'Vous avez interrompu le traitement.',
        revived_success = 'a été réanimé avec succès !',
        already_healthy = "est déjà un animal de compagnie très en bonne santé, il n'y a aucune raison de le traiter.",
        too_awaytotreat = 'Vous êtes trop loin de',
        callpet_totreat = "Vous devez appeler votre animal de compagnie avant d'utiliser cet objet.",
    
        -- acheter un animal de compagnie
        bought_pet = "Vous avez acheté avec succès un animal de compagnie !",
        not_enough_cash = "Vous n'avez pas assez d'argent liquide !",
        not_enough_bank = "Vous n'avez pas assez d'argent dans votre banque !",
    },
    ["tr"] = {
        callpetfirst = 'Bu menüyü açmadan önce önce evcil hayvanınızı çağırmanız gerekiyor!',
        willsniff = 'koklayacak', -- "Evcil hayvan koklayacak", cümle başına evcil hayvanın adını ekler
        willattack = 'saldıracak!',
        caught_illness = 'bir hastalık kapmıştır:',
        dead_revive = 'Evcil hayvanınız öldü! Acil olarak onu canlandırın!',
        eaten_food = 'Evcil hayvanınız yemeğini yedi!',
        call_to_feed = 'Evcil hayvanınızı çağırmadan önce onu besleyemezsiniz',
        too_faraway = 'Evcil hayvanınızdan çok uzaksınız. O uyumaya gitti.',
        donthave_tennis = 'Tenis topunuz yok!',
        noveh_nearby = 'Yakınlarda hiç araç yok.',
        following = 'şimdi sizi takip ediyor!',
        cant_animate = 'Bu evcil hayvan bu animasyonu yapamaz',
        released_pet = 'doğaya salındı, mutlu bir hayat yaşayacak.',
        pet_went = 'ölünce evine döndü',
        fartosend = 'Evcil hayvanınızı o kadar uzağa gönderemezsiniz',
        pet_renamed_to = 'Evcil hayvanınızın adını değiştirdiniz:',
        call_to_rename = 'Evcil hayvanınızı çağırmadan önce adını değiştiremezsiniz',
        petisinbed = 'Evcil hayvanınız zaten bir yatakta yatıyor, bu aksiyonu gerçekleştiremez',

        -- target
        t_sleep = 'Uyu',
        t_sit = 'Otur',
        t_out = 'Çık',
        t_delete = 'Sil',
    
        -- k9
        k9_search = 'Sadece K9 köpekleri ile insanları arayabilirsiniz',
        k9_attack = 'Sadece K9 köpekleri ile insanları saldırabilirsiniz',
        k9_found = 'K9, kişide bazı yasa dışı nesneler buldu.',
        k9_nofound = 'K9 hiçbir şey bulamadı.',
    
        -- bilgilendirme
        goto_info = 'Evcil hayvanınızın gitmesini istediğiniz bir yeri seçin',
        attack_info = 'Evcil hayvanınızın kim saldıracağını seçin! (İptal etmek için X tuşuna basın)',
    
        -- metin arayüzü
        finalize_attack = '[E] - Saldırıyı Tamamla',
        attack_canceled = 'Saldırı iptal edildi',
        determine_location = '[E] - Konumu Belirle',
    
        -- bağlam menüsü
        context_header = 'Evcil Hayvanınıza İsim Ver',
        context_label = 'İsim',
        context_desc = 'Evcil Hayvanınıza İsim Ver',
    
        -- mağaza
        totalpaid = '$ karşılığında bir şey satın aldınız',
        basket_empty = 'Sepetiniz boş! Şu anda ödeme yapamazsınız.',
    
        -- tedavi
        treated_success = 'başarıyla tedavi edildi!',
        treatment_aborted = 'Tedaviyi iptal ettiniz.',
        revived_success = 'başarıyla canlandırıldı!',
        already_healthy = 'zaten çok sağlıklı bir evcil hayvandır, onu tedavi etmek için hiçbir neden yoktur.',
        too_awaytotreat = 'Evcil hayvanınızdan çok uzaksınız',
        callpet_totreat = 'Bu öğeyi kullanmadan önce evcil hayvanınızı çağırmalısınız.',
    
        -- evcil hayvan satın alma
        bought_pet = 'Başarıyla bir evcil hayvan satın aldınız!',
        not_enough_cash = 'Yeterli nakit paranız yok!',
        not_enough_bank = 'Bankanızda yeterli para yok!',
    },
    ["it"] = {
        callpetfirst = 'Prima devi chiamare il tuo animale domestico per aprire questo menu!',
        willsniff = 'snifferà', -- "L'animale domestico sta per annusare", il nome dell'animale domestico viene inserito all'inizio della frase
        willattack = 'attaccherà!',
        caught_illness = 'ha contratto una malattia:',
        dead_revive = 'Il tuo animale domestico è morto! Rianimalo urgentemente!',
        eaten_food = 'Il tuo animale domestico ha mangiato il suo cibo!',
        call_to_feed = 'Non puoi nutrire il tuo animale domestico prima di chiamarlo',
        too_faraway = 'Sei troppo lontano dal tuo animale domestico. È andato a dormire.',
        donthave_tennis = 'Non hai una palla da tennis!',
        noveh_nearby = 'Non ci sono veicoli nelle vicinanze.',
        following = 'ti sta seguendo ora!',
        cant_animate = 'Questo animale domestico non può eseguire questa animazione',
        released_pet = 'è stato liberato nella natura, vivrà una vita felice.',
        pet_went = 'è andato a casa perché sei morto',
        fartosend = 'Non puoi mandare il tuo animale domestico così lontano',
        pet_renamed_to = 'Hai rinominato il tuo animale domestico in',
        call_to_rename = 'Non puoi rinominare il tuo animale domestico prima di chiamarlo',
        petisinbed = "L'animale domestico è già a letto, non puoi eseguire questa azione.",

        -- target
        t_sleep = 'Dormire',
        t_sit = 'Sedersi',
        t_out = 'Uscire',
        t_delete = 'Rimuovere',
    
        -- k9
        k9_search = 'Puoi cercare solo persone con cani K9',
        k9_attack = 'Puoi attaccare solo persone con cani K9',
        k9_found = 'K9 ha trovato alcuni oggetti illegali sulla persona.',
        k9_nofound = 'K9 non ha trovato nulla.',
    
        -- informazioni
        goto_info = 'Scegli una qualsiasi posizione per far andare il tuo animale domestico',
        attack_info = 'Scegli chi il tuo animale domestico attaccherà! (Premi X per annullare)',
    
        -- testo UI
        finalize_attack = "[E] - Concludi l'attacco",
        attack_canceled = 'Attacco annullato',
        determine_location = '[E] - Determina la posizione',
    
        -- menu contestuale
        context_header = 'Dai un nome al tuo animale domestico',
        context_label = 'Nome',
        context_desc = 'Dai un nome al tuo animale domestico',
    
        -- negozio
        totalpaid = 'Hai comprato qualcosa per $',
        basket_empty = 'Il tuo carrello è vuoto! Non puoi effettuare il pagamento in questo momento.',
    
        -- trattamento
        treated_success = 'è stato trattato con successo!',
        treatment_aborted = 'Hai interrotto il trattamento.',
        revived_success = 'è stato rianimato con successo!',
        already_healthy = "è già un animale domestico molto sano, non c'è motivo di trattarlo.",
        too_awaytotreat = 'Sei troppo lontano da',
        callpet_totreat = "Devi chiamare il tuo animale domestico prima di usare questo oggetto.",
    
        -- acquisto animale domestico
        bought_pet = 'Hai acquistato con successo un animale domestico!',
        not_enough_cash = 'Non hai abbastanza denaro contante!',
        not_enough_bank = 'Non hai abbastanza denaro in banca!',
    }   
}

------------------------!!NOT AVAILABLE!!----------------------
--------------------------VET OPTIONS--------------------------
---------------------------------------------------------------

--[[	
	You can configure Vet options from here
	
	W.I.P
]]

-- Config.HealPrice = 500
-- VET CONFIGURATIONS WILL BE LISTED HERE

----------------------------------------------------------------
----                   DUSADEV.TEBEX.IO                     ----
----------------------------------------------------------------