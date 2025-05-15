Config = {}

Config.questions = {
    title = 'Tohumu kontrol et',
    steps = {
       [1] = {label = 'Tohumu kontrol et', value = 1},
    },
}

Config.DailyResetTime = 20 -- Günlük sıfırlama süresi (saniye cinsinden)
Config.MaxPaymentCount = 3 -- Bir gün içinde alınabilecek maksimum ödeme sayısı
Config.PaymentAmount = 5000 -- Bir ödeme miktarı



Config2 = {
    Shops = {
        ["Shop3"] = {
            model = "a_f_m_downtown_01",
            coords = vector3(-1466.54, -1388.36, 4.14),
            heading = 109.27,
            jobNames = {"lssp"}, 
            items = {
                ["painting"] = {
                    label = "Tablo",
                    price = 12000,
                },
                ["rolex"] = {
                    label = "Rolex",
                    price = 200,
                },
                ["objets_historiques_5"] = {
                    label = "Tarihi Eser",
                    price = 250,
                },
                ["jewels"] = {
                    label = "Mücevher",
                    price = 14000,
                },
                ["metalscrap"] = {
                    label = "Scrup Metal",
                    price = 9500,
                },
                ["scrapmetal"] = {
                    label = "Scrup Metal2",
                    price = 9500,
                },
                ["leftdoor"] = {
                    label = "Sol Kapı",
                    price = 264,
                },
                ["rightdoor"] = {
                    label = "Sağ Kapı",
                    price = 264,
                },
                ["tyres"] = {
                    label = "Lastik",
                    price = 48,
                },
                ["trunk"] = {
                    label = "Gövde",
                    price = 213,
                },
                ["hood"] = {
                    label = "Kaput",
                    price = 300,
                },
                ["engine"] = {
                    label = "Motor",
                    price = 1900,
                },
                ["vehicleseats"] = {
                    label = "Koltuklar",
                    price = 70,
                },
                ["koltuk"] = {
                    label = "Koltuklar",
                    price = 70,
                },
                ["rubber"] = {
                    label = "Lastik2",
                    price = 30,
                },
                ["arkatampon"] = {
                    label = "Tampon",
                    price = 200,
                },
            }
        },
        ["armisst"] = {
            model = "a_f_m_downtown_01",
            coords = vector3(-191.51, -1549.93, 34.35),
            heading = 133.61,
            jobNames = {"armis"}, 
            items = {
                ["packed_weed"] = {
                    label = "Armis",
                    price = 290,
                },
            }
        },
        ["soyguncu"] = {
            model = "a_f_m_downtown_01",
            coords = vector3(225.77, -1760.85, 28.69),
            heading = 133.61,
            jobNames = {"evsoygunu"},
            items = {
                ["television"] = {
                    label = "Televizyon",
                    description = "Televizyonu şu fiyata sat: $",
                    price = 100,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["shoebox"] = {
                    label = "Ayakkabı Kutusu", 
                    description = "Ayakkabı Kutusunu şu fiyata sat: $",
                    price = 40,
                    MinAmount = 1,
                    MaxAmount = 2
                },
                ["dj_deck"] = {
                    label = "DJ Seti",
                    description = "DJ Setini şu fiyata sat: $", 
                    price = 120,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["console"] = {
                    label = "Konsol",
                    description = "Konsolu şu fiyata sat: $",
                    price = 90,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["boombox"] = {
                    label = "Müzik Çalar",
                    description = "Müzik Çaları şu fiyata sat: $",
                    price = 150,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["bong"] = {
                    label = "Nargile",
                    description = "Nargileyi şu fiyata sat: $",
                    price = 50,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["pogo"] = {
                    label = "Pogo Heykeli",
                    description = "Sanat Eserini şu fiyata sat: $",
                    price = 1500,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["flat_television"] = {
                    label = "Düz Ekran TV",
                    description = "Düz Ekran TV'yi şu fiyata sat: $",
                    price = 500,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["coffemachine"] = {
                    label = "Kahve Makinesi",
                    description = "Kahve Makinesini şu fiyata sat: $",
                    price = 90,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["hairdryer"] = {
                    label = "Saç Kurutma Makinesi",
                    description = "Saç Kurutma Makinesini şu fiyata sat: $",
                    price = 20,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["j_phone"] = {
                    label = "Telefon",
                    description = "Telefonu şu fiyata sat: $",
                    price = 40,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["sculpture"] = {
                    label = "Heykel",
                    description = "Heykeli şu fiyata sat: $",
                    price = 300,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["toiletry"] = {
                    label = "Tuvalet Malzemesi",
                    description = "Tuvalet Malzemesini şu fiyata sat: $",
                    price = 10,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["laptop"] = {
                    label = "Dizüstü Bilgisayar",
                    description = "Dizüstü Bilgisayarı şu fiyata sat: $",
                    price = 80,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["monitor"] = {
                    label = "Monitör",
                    description = "Monitörü şu fiyata sat: $",
                    price = 80,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["printer"] = {
                    label = "Yazıcı",
                    description = "Yazıcıyı şu fiyata sat: $",
                    price = 60,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["watch"] = {
                    label = "Saat",
                    description = "Saati şu fiyata sat: $",
                    price = 90,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["toothpaste"] = {
                    label = "Diş Macunu",
                    description = "Diş Macununu şu fiyata sat: $",
                    price = 4,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["soap"] = {
                    label = "Sabun",
                    description = "Sabunu şu fiyata sat: $",
                    price = 2,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["shampoo"] = {
                    label = "Şampuan",
                    description = "Şampuanı şu fiyata sat: $",
                    price = 16,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["romantic_book"] = {
                    label = "Romantik Kitap",
                    description = "Romantik Kitabı şu fiyata sat: $",
                    price = 20,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["necklace"] = {
                    label = "Kolye",
                    description = "Kolyeyi şu fiyata sat: $",
                    price = 150,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["gold_watch"] = {
                    label = "Altın Saat",
                    description = "Altın Saati şu fiyata sat: $",
                    price = 300,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["gold_bracelet"] = {
                    label = "Altın Bileklik",
                    description = "Altın Bilekliği şu fiyata sat: $",
                    price = 200,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["bracelet"] = {
                    label = "Bileklik",
                    description = "Bilekliği şu fiyata sat: $",
                    price = 50,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["earings"] = {
                    label = "Küpe",
                    description = "Küpeyi şu fiyata sat: $",
                    price = 110,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["book"] = {
                    label = "Kitap",
                    description = "Kitabı şu fiyata sat: $",
                    price = 10,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["skull"] = {
                    label = "Kafatası Sanatı",
                    description = "Kafatasını şu fiyata sat: $",
                    price = 1000,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["pencil"] = {
                    label = "Kalem",
                    description = "Kalemi şu fiyata sat: $",
                    price = 10,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["notepad"] = {
                    label = "Not Defteri",
                    description = "Not Defterini şu fiyata sat: $",
                    price = 20,
                    MinAmount = 1,
                    MaxAmount = 20
                },
                ["tapeplayer"] = {
                    label = "Teyp",
                    description = "Teypi şu fiyata sat: $",
                    price = 100,
                    MinAmount = 1,
                    MaxAmount = 20
                }
            }
        },
        ["torbacijoint"] = {
            model = "a_f_m_downtown_01",
            coords = vector3(225.77, -1760.85, 28.69),
            heading = 133.61,
            jobNames = {"torbaci"}, 
            items = {
                ["joint"] = {
                    label = "Joint",
                    price = 190,
                },
            }
        },
        ["cokeshop"] = {
            model = "a_f_m_downtown_01",
            coords = vector3(-1604.32, 5197.11, 3.36),
            heading = 114.04,
            jobNames = {"unemployed"}, 
            items = {
                ["packed_coke"] = {
                    label = "Paketlenmiş Kokain",
                    price = 190,
                },
            }
        },   
          
     }
}


Config.DetectionZone = {
    center = vector3(-1486.51, -1273.35, 2.36), 
    radius = 100.0 -- Alanın yarıçapı
}

Config.Items = {
    "iron",  -- Çıkabilecek itemler
    "scrapmetal",
    "metalscrap",
    "objets_historiques_1",
    "objets_historiques_2",
    "objets_historiques_3",
    "objets_historiques_4",
    "objets_historiques_5"
}

Config.ProgressBarDuration = 5000 
Config.DetectorItem = "metal_detector" 
-------------------------- FUNCIONALITY

Config.RemoveContractAfterUse = true -- Choose if you want to keep the item after the player uses it

Config.RemoveMoneyOnSign = true -- Set if you want the script to automatically remove the money from the buyer's bank account and deposit it into the seller's account when the buyer signs it

Config.DateFormat = '%d-%m-%Y' -- (Date that appears in the contract interface) To change the date format check this website - https://www.lua.org/pil/22.1.html

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 5

Config.BotName = 'SuRReaL' -- Write the desired bot name

Config.ServerName = 'SuRReaL' -- Write your server's name

Config.IconURL = 'https://cdn.discordapp.com/attachments/1287542982915919988/1289305964939448464/615c8161099e6834187181_.png?ex=66f85740&is=66f705c0&hm=8b940e3a443305b26a35eb6e883553f051ea22a3311a52ef167f0e8e4063252a&' -- Insert your desired image link

Config.WebhookDateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html45518a

Config.sellVehicleWebhookColor = '65352'


-- Config.DepoCoordinates = vector3(1185.0676269531,-3168.1982421875,7.3114886283875)

-- Config.BlipSettings = {
--     sprite = 473,
--     display = 7,
--     scale = 0.4,
--     color = 4,
--     name = "Depo"
-- }

Config.MarkerSettings = {
    type = 2,
    scale = vector3(0.4, 0.4, 0.3),
    color = {r = 255, g = 0, b = 0, a = 200},
    distance = 20.0,
    interactDistance = 3.0,
    textDistance = 1.0,
    text = "Kiralık Depo",
    interactKey = 38 -- [E] Key
}

Config.StashSettings = {
    maxWeight = 10000000,
    slots = 140
}

Config.RentPrice = 5000
Config.NotificationType = "QBCore:Notify"



Config.Peds = {
    { 
        region = 1,
        coords = vector3(0, 0, 0), -- Bölge 1 Koordinatları
        heading = 158.0,
        model = "s_m_y_ammucity_01",
        items = {
            { name = "water", label = "Su", price = 5 },
            { name = "sandwich", label = "Sandviç", price = 10 },
        }
    },
    {
        region = 2,
        coords = vector3(0, 0, 0), -- Bölge 2 Koordinatları
        heading = 201.0,
        model = "s_m_y_ammucity_01",
        items = {
            { name = "armor", label = "Zırh", price = 150 },
            { name = "bandage", label = "Bandaj", price = 50 },
        }
    }
}











Config.Framework = 'qb' -- esx
Config.PlayerLoadedEvent = 'QBCore:Client:OnPlayerLoaded' -- esx:playerLoaded

Config.Identifiers = { -- identifiers that will be able to pickup/pause/stop music even if they are not of boombox
    ["license:6d3b6254a50416697dcaa91878e2eb03d9112302"] = true,
    ["fivem:1234"] = true,
    ["steam:1234"] = true,
    ["char1:1234"] = true, -- for esx player identifiers
    ["citizenid"] = true, -- for qbcore citizenid
}


-- You can add as many types of boomboxes you want with different props and different distances
-- if you add an item here, make sure to add the item in your inventory as well.
ItemTable = {
    ["boombox"] = { -- item name
        prop = "prop_boombox_01", -- prop name
        distance = 10.0, -- distance to which the sound will be heard
    },
}


Config.require = {
    ['WEAPON_COMBATPDW'] = {
        requireditem = 'money',
        requireditemamount = 2000,
        repairtime = 10000
    },
}

Config.locations = {
    {
        coords = vector3(-567.8292, -1696.3129, 19.0366),
        heading = 210.3678,
        spawnprop = true, -- spawns the workbench at the location 
        free = false -- allows weapons to be repaired for free at the location
    }
}



-- Config.ClothingStores = {
--     {
--         coords = vector3(799.15, -753.14, 31.27),
--         label = "Kıyafetçi"
--     },
--     {
--         coords = vector3(425.236, -806.008, 29.491),
--         label = "Kıyafetçi"
--     },
--     {
--         coords = vector3(-162.658, -303.397, 39.733),
--         label = "Kıyafetçi"
--     },
--     -- Daha fazla konum ekleyebilirsiniz
-- }





Config.CraftLocations = {
    {
        coords = vector3(-1186.72, -903.57, 12.85),
        job = "burgershot",
        items = {
            {
                name = "burgerheartstopper",
                label = "Double Burger",
                image = "burgerheartstopper.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "burgerchickenmelt",
                label = "Tavuk Burger",
                image = "burgerchickenmelt.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "chickensandwich",
                label = "Chicken Sandwich",
                image = "chickensandwich.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "atomfries",
                label = "Crisps",
                image = "atomfries.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "mozerellasticks",
                label = "Mozarella",
                image = "mozerellasticks.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "steakburger",
                label = "Stake Burger",
                image = "steakburger.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "strawberryfloat",
                label = "Sandy Çilekli",
                image = "strawberryfloat.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "sundaystrawberry",
                label = "Sandy Karemel",
                image = "sundaystrawberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "atomshake",
                label = "Shake",
                image = "atomshake.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "atomsoda",
                label = "Soda",
                image = "atomsoda.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    {
        coords = vector3(1253.4337158203,-355.56457519531,69.071395874023),
        job = "hornys",
        items = {
            {
                name = "burgerheartstopper",
                label = "Double Burger",
                image = "burgerheartstopper.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "burgerchickenmelt",
                label = "Tavuk Burger",
                image = "burgerchickenmelt.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "chickensandwich",
                label = "Chicken Sandwich",
                image = "chickensandwich.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "atomfries",
                label = "Crisps",
                image = "atomfries.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "mozerellasticks",
                label = "Mozarella",
                image = "mozerellasticks.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "steakburger",
                label = "Stake Burger",
                image = "steakburger.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "strawberryfloat",
                label = "Sandy Çilekli",
                image = "strawberryfloat.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "sundaystrawberry",
                label = "Sandy Karemel",
                image = "sundaystrawberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "atomshake",
                label = "Shake",
                image = "atomshake.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "atomsoda",
                label = "Soda",
                image = "atomsoda.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    {
        coords = vector3(130.0832, -1282.1565, 29.2693), 
        job = "unicorn",
        items = {
               {
                name = "crisps",
                label = "Patates",
                image = "crisps.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "coffee",
                label = "Kahve",
                image = "coffee.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "wine",
                label = "Şarap",
                image = "wine.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "whiskey",
                label = "Viski",
                image = "whiskey.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "vodka",
                label = "Vodka",
                image = "vodka.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_cocktail_blue",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue2",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue3",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue4",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue5",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue6",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue7",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue8",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Yeşil Kokteyller
              {
                name = "djs_cocktail_green",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green2",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green3",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green4",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green5",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green6",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green7",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green8",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Turuncu Kokteyller
              {
                name = "djs_cocktail_orange",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange2",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange3",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange4",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange5",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange6",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange7",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange8",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Mor Kokteyller
              {
                name = "djs_cocktail_purple",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple2",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple3",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple4",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple5",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple6",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple7",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple8",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Kırmızı Kokteyller
              {
                name = "djs_cocktail_red",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red2",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red3",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red4",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red5",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red6",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red7",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red8",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              }
        }
    },
    {
        coords = vector3(416.05059814453,-1502.4289550781,30.070558547974), 
        job = "lombo",
        items = {
            {
                name = "balonezspaghetti",
                label = "balonezspaghetti",
                image = "balonezspaghetti.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beyazsarap",
                label = "beyazsarap",
                image = "beyazsarap.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "diavola",
                label = "diavola",
                image = "diavola.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "domateslispaghetti",
                label = "domateslispaghetti",
                image = "domateslispaghetti.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "italyanlazanya",
                label = "italyanlazanya",
                image = "italyanlazanya.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "italyansalata",
                label = "italyansalata",
                image = "italyansalata.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "kırmızısarap",
                label = "kırmızısarap",
                image = "kırmızısarap.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "margheritta",
                label = "margheritta",
                image = "margheritta.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "napoletana",
                label = "napoletana",
                image = "napoletana.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "sıcılıana",
                label = "sıcılıana",
                image = "sıcılıana.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "vegetariana",
                label = "vegetariana",
                image = "vegetariana.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_drink_aldente",
                label = "Aldente Drink",
                image = "djs_drink_aldente.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_drink_normal",
                label = "Normal Drink",
                image = "djs_drink_normal.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_drink_pizzathis",
                label = "Pizza This Drink",
                image = "djs_drink_pizzathis.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_melt_buffalochicken",
                label = "Buffalo Chicken Melt",
                image = "djs_melt_buffalochicken.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_melt_cheeseburger",
                label = "Cheeseburger Melt",
                image = "djs_melt_cheeseburger.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_melt_chickenbacon",
                label = "Chicken Bacon Melt",
                image = "djs_melt_chickenbacon.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_melt_meatlovers",
                label = "Meat Lovers Melt",
                image = "djs_melt_meatlovers.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_melt_pepperoni",
                label = "Pepperoni Melt",
                image = "djs_melt_pepperoni.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_plate_breadsticks",
                label = "Bread Sticks",
                image = "djs_plate_breadsticks.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_plate_cheesybreadsticks",
                label = "Cheesy Bread Sticks",
                image = "djs_plate_cheesybreadsticks.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_plate_chocolatedonutbites",
                label = "Chocolate Donut Bites",
                image = "djs_plate_chocolatedonutbites.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_plate_cookie",
                label = "Chocolate Chip Pizookie",
                image = "djs_plate_cookie.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_plate_cinammonsticks",
                label = "Cinammon Sticks",
                image = "djs_plate_cinammonsticks.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_bbqchicken",
                label = "BBQ Chicken Pizza",
                image = "djs_slice_bbqchicken.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_buffalochicken",
                label = "Buffalo Chicken Pizza",
                image = "djs_slice_buffalochicken.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_cheese",
                label = "Cheese Pizza",
                image = "djs_slice_cheese.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_hawaiian",
                label = "Hawaiian Pizza",
                image = "djs_slice_hawaiian.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_meatlovers",
                label = "Meat Lovers Pizza",
                image = "djs_slice_meatlovers.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_pepperoni",
                label = "Pepperoni Lovers Pizza",
                image = "djs_slice_pepperoni.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_supreme",
                label = "Supreme Pizza",
                image = "djs_slice_supreme.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_veggie",
                label = "Veggie Pizza",
                image = "djs_slice_veggie.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "meyvetabagi",
                label = "Meyve Tabagi",
                image = "meyvetabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
        }
    },
    {
        coords = vector3(826.1723, -108.6953, 79.2111), 
        job = "irishpub",
        items = {
            {
                name = "djs_prop_buttercroissant",
                label = "Buttercroissant",
                image = "djs_prop_buttercroissant.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_cheesedanish",
                label = "Cheesedanish",
                image = "djs_prop_cheesedanish.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_chocolatecakepop",
                label = "Chocolatecakepop",
                image = "djs_prop_chocolatecakepop.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_chocolatecroissant",
                label = "Chocolatecroissant",
                image = "djs_prop_chocolatecroissant.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_classicoatmeal",
                label = "Classicoatmeal",
                image = "djs_prop_classicoatmeal.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_bmcoffeecuplarge",
                label = "Bmcoffeecuplarge",
                image = "djs_prop_bmcoffeecuplarge.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_bmcoffeecupmedium",
                label = "Bmcoffeecupmedium",
                image = "djs_prop_bmcoffeecupmedium.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_bmcoffeecupsmall",
                label = "Bmcoffeecupsmall",
                image = "djs_prop_bmcoffeecupsmall.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_impossiblesbreakfastsandwich",
                label = "Impossiblesbreakfastsandwich",
                image = "djs_prop_impossiblesbreakfastsandwich.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_pumpkincreamcheesemuffin",
                label = "Pumpkincreamcheesemuffin",
                image = "djs_prop_pumpkincreamcheesemuffin.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_sandwichsmokedbacon",
                label = "Sandwichsmokedbacon",
                image = "djs_prop_sandwichsmokedbacon.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_turkeybaconcheddareggwhite",
                label = "Turkeybaconcheddareggwhite",
                image = "djs_prop_turkeybaconcheddareggwhite.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_unicorncakepop",
                label = "Unicorncakepop",
                image = "djs_prop_unicorncakepop.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "cereztabagi",
                label = "Cerez Tabagi",
                image = "cereztabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "meyvetabagi",
                label = "Meyve Tabagi",
                image = "meyvetabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
               {
                name = "crisps",
                label = "Patates",
                image = "crisps.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
          
            {
                name = "wine",
                label = "Şarap",
                image = "wine.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "ecola",
                label = "Kola",
                image = "ecola.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "whiskey",
                label = "Viski",
                image = "whiskey.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "vodka",
                label = "Vodka",
                image = "vodka.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_cocktail_blue",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue2",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue3",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue4",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue5",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue6",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue7",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue8",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Yeşil Kokteyller
              {
                name = "djs_cocktail_green",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green2",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green3",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green4",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green5",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green6",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green7",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green8",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Turuncu Kokteyller
              {
                name = "djs_cocktail_orange",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange2",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange3",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange4",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange5",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange6",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange7",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange8",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Mor Kokteyller
              {
                name = "djs_cocktail_purple",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple2",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple3",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple4",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple5",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple6",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple7",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple8",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Kırmızı Kokteyller
              {
                name = "djs_cocktail_red",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red2",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red3",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red4",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red5",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red6",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red7",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red8",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              }
        }
    },
    {
        coords = vector3(244.6046295166,-3158.5031738281,-0.1635422706604), 
        job = "club77",
        items = {
            {
                name = "crisps",
                label = "Patates",
                image = "crisps.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "coffee",
                label = "Kahve",
                image = "coffee.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "meyvetabagi",
                label = "meyvetabagi",
                image = "meyvetabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "wine",
                label = "Şarap",
                image = "wine.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "whiskey",
                label = "Viski",
                image = "whiskey.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "vodka",
                label = "Vodka",
                image = "vodka.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_cocktail_blue",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue2",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue3",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue4",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue5",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue6",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue7",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue8",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Yeşil Kokteyller
              {
                name = "djs_cocktail_green",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green2",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green3",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green4",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green5",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green6",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green7",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green8",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Turuncu Kokteyller
              {
                name = "djs_cocktail_orange",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange2",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange3",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange4",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange5",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange6",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange7",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange8",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Mor Kokteyller
              {
                name = "djs_cocktail_purple",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple2",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple3",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple4",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple5",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple6",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple7",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple8",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Kırmızı Kokteyller
              {
                name = "djs_cocktail_red",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red2",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red3",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red4",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red5",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red6",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red7",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red8",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              }
        }
    },
    {
        coords = vector3(276.27, 136.08, 103.41), -- Koordinatları güncelle
        job = "icecream", -- İş adını güncelle
        items = {
            {
                name = "geladobaunilha",
                label = "Vanilyalı Dondurma Dilimi",
                image = "gemorango.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "dondurma",
                label = "Dondurma",
                image = "dondurma.png",
                requiredItems = {
                    { item = "seker", amount = 1, label = "Şeker" },
                    { item = "water", amount = 1, label = "Su" }
                },
                price = 10,
                amount = 10,
                progressTime = 8000 -- Progress bar süresi (ms)
            },
            {
                name = "geladochocolate",
                label = "Çikolatalı Dondurma Dilimi",
                image = "gechocolate.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "geladomorango",
                label = "Çilekli Dondurma Dilimi",
                image = "gemorango.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "coffee",
                label = "Kahve",
                image = "coffee.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cupcake_coke",
                label = "Cupcake Coke",
                image = "cupcake_coke.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cupcake_cherry",
                label = "Cupcake Cherry",
                image = "cupcake_cherry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cupcake_blackberry",
                label = "Cupcake Blackberry",
                image = "cupcake_blackberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cupcake_strawberry",
                label = "Cupcake Strawberry",
                image = "cupcake_strawberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cupcake_vaniliy",
                label = "Cupcake Vaniliy",
                image = "cupcake_vaniliy.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "pudding_blackberry",
                label = "Pudding Blackberry",
                image = "pudding_blackberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "pudding_orange",
                label = "Pudding Orange",
                image = "pudding_orange.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "pudding_kiwi",
                label = "Pudding Kiwi",
                image = "pudding_kiwi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "pudding_strawberry",
                label = "Pudding Strawberry",
                image = "pudding_strawberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "mojito_watermelon",
                label = "Mojito Watermelon",
                image = "mojito_watermelon.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "mojito_carrot",
                label = "Mojito Carrot",
                image = "mojito_carrot.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "mojito_cucumber",
                label = "Mojito Cucumber",
                image = "mojito_cucumber.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "mojito_tomato",
                label = "Mojito Tomato",
                image = "mojito_tomato.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "mojito_banana",
                label = "Mojito Banana",
                image = "mojito_banana.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "mojito_mixed",
                label = "Mojito Mixed",
                image = "mojito_mixed.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "bubbletea_blueberry",
                label = "Bubble Tea Blueberry",
                image = "bubbletea_blueberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "bubbletea_mint",
                label = "Bubble Tea Mint",
                image = "bubbletea_mint.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "bubbletea_rose",
                label = "Bubble Tea Rose",
                image = "bubbletea_rose.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    {
        coords = vector3(-1341.24, -1070.13, 5.76),
        job = "mprestaurant",
        items = {
            {
                name = "crisps",
                label = "Patates",
                image = "crisps.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "coffee",
                label = "Kahve",
                image = "coffee.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "wine",
                label = "Şarap",
                image = "wine.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "whiskey",
                label = "Viski",
                image = "whiskey.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "mojito",
                label = "mojito",
                image = "mojito.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "jin",
                label = "Gin",
                image = "jin.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "drimartini",
                label = "Martini",
                image = "drimartini.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "champagne",
                label = "Şampanya",
                image = "champagne.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "bloodymary",
                label = "bloodymary",
                image = "bloodymary.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "vodka",
                label = "Vodka",
                image = "vodka.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "ecola",
                label = "Kola",
                image = "ecola.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "sprunk",
                label = "Sprite",
                image = "sprunk.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "fanta",
                label = "Fanta",
                image = "fanta.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cay",
                label = "Çay",
                image = "cay.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "pizza_mozzarella",
                label = "Pizza Mozzarella",
                image = "pizza_mozzarella.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "doubleburger",
                label = "Double Burger",
                image = "doubleburger.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "burger_meat",
                label = "Et Burger",
                image = "burger_meat.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "miso",
                label = "Miso Çorbas",
                image = "miso.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cereztabagi",
                label = "Cerez Tabagi",
                image = "cereztabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "meyvetabagi",
                label = "Meyve Tabagi",
                image = "meyvetabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_drink_aldente",
                label = "Aldente Drink",
                image = "djs_drink_aldente.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_drink_normal",
                label = "Normal Drink",
                image = "djs_drink_normal.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_drink_pizzathis",
                label = "Pizza This Drink",
                image = "djs_drink_pizzathis.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_melt_buffalochicken",
                label = "Buffalo Chicken Melt",
                image = "djs_melt_buffalochicken.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_melt_cheeseburger",
                label = "Cheeseburger Melt",
                image = "djs_melt_cheeseburger.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_melt_chickenbacon",
                label = "Chicken Bacon Melt",
                image = "djs_melt_chickenbacon.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_melt_meatlovers",
                label = "Meat Lovers Melt",
                image = "djs_melt_meatlovers.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_melt_pepperoni",
                label = "Pepperoni Melt",
                image = "djs_melt_pepperoni.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_plate_breadsticks",
                label = "Bread Sticks",
                image = "djs_plate_breadsticks.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_plate_cheesybreadsticks",
                label = "Cheesy Bread Sticks",
                image = "djs_plate_cheesybreadsticks.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_plate_chocolatedonutbites",
                label = "Chocolate Donut Bites",
                image = "djs_plate_chocolatedonutbites.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_plate_cookie",
                label = "Chocolate Chip Pizookie",
                image = "djs_plate_cookie.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_plate_cinammonsticks",
                label = "Cinammon Sticks",
                image = "djs_plate_cinammonsticks.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_bbqchicken",
                label = "BBQ Chicken Pizza",
                image = "djs_slice_bbqchicken.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_buffalochicken",
                label = "Buffalo Chicken Pizza",
                image = "djs_slice_buffalochicken.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_cheese",
                label = "Cheese Pizza",
                image = "djs_slice_cheese.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_hawaiian",
                label = "Hawaiian Pizza",
                image = "djs_slice_hawaiian.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_meatlovers",
                label = "Meat Lovers Pizza",
                image = "djs_slice_meatlovers.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_pepperoni",
                label = "Pepperoni Lovers Pizza",
                image = "djs_slice_pepperoni.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_supreme",
                label = "Supreme Pizza",
                image = "djs_slice_supreme.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_slice_veggie",
                label = "Veggie Pizza",
                image = "djs_slice_veggie.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "meyvetabagi",
                label = "Meyve Tabagi",
                image = "meyvetabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            }
            
        }
    },
    {
        coords = vector3(-563.14, 286.7, 81.28),
        job = "tequila",
        items = {
               {
                name = "crisps",
                label = "Patates",
                image = "crisps.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "coffee",
                label = "Kahve",
                image = "coffee.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
              name = "shotertequila",
              label = "shotertequila",
              image = "shotertequila.png",
              requiredItems = {
                  {item = "seker", amount = 1, label = "Şeker"},
                  {item = "water", amount = 1, label = "Su"}
              },
              progressTime = 10000 -- Progress bar süresi (ms)
          },
            {
                name = "wine",
                label = "Şarap",
                image = "wine.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "whiskey",
                label = "Viski",
                image = "whiskey.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "vodka",
                label = "Vodka",
                image = "vodka.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_cocktail_blue",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue2",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue3",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue4",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue5",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue6",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue7",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue8",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Yeşil Kokteyller
              {
                name = "djs_cocktail_green",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green2",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green3",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green4",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green5",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green6",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green7",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green8",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Turuncu Kokteyller
              {
                name = "djs_cocktail_orange",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange2",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange3",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange4",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange5",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange6",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange7",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange8",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Mor Kokteyller
              {
                name = "djs_cocktail_purple",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple2",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple3",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple4",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple5",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple6",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple7",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple8",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Kırmızı Kokteyller
              {
                name = "djs_cocktail_red",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red2",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red3",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red4",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red5",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red6",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red7",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red8",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              }
        }
    },
    {
        coords = vector3(128.26, -1032.17, 28.61), -- Koordinatları doldur
        job = "beanmachine",
        items = {
            {
                name = "djs_prop_buttercroissant",
                label = "Buttercroissant",
                image = "djs_prop_buttercroissant.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_cheesedanish",
                label = "Cheesedanish",
                image = "djs_prop_cheesedanish.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_chocolatecakepop",
                label = "Chocolatecakepop",
                image = "djs_prop_chocolatecakepop.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_chocolatecroissant",
                label = "Chocolatecroissant",
                image = "djs_prop_chocolatecroissant.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_classicoatmeal",
                label = "Classicoatmeal",
                image = "djs_prop_classicoatmeal.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_bmcoffeecuplarge",
                label = "Bmcoffeecuplarge",
                image = "djs_prop_bmcoffeecuplarge.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_bmcoffeecupmedium",
                label = "Bmcoffeecupmedium",
                image = "djs_prop_bmcoffeecupmedium.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_bmcoffeecupsmall",
                label = "Bmcoffeecupsmall",
                image = "djs_prop_bmcoffeecupsmall.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_impossiblesbreakfastsandwich",
                label = "Impossiblesbreakfastsandwich",
                image = "djs_prop_impossiblesbreakfastsandwich.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_pumpkincreamcheesemuffin",
                label = "Pumpkincreamcheesemuffin",
                image = "djs_prop_pumpkincreamcheesemuffin.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_sandwichsmokedbacon",
                label = "Sandwichsmokedbacon",
                image = "djs_prop_sandwichsmokedbacon.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_turkeybaconcheddareggwhite",
                label = "Turkeybaconcheddareggwhite",
                image = "djs_prop_turkeybaconcheddareggwhite.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_unicorncakepop",
                label = "Unicorncakepop",
                image = "djs_prop_unicorncakepop.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            
            {
                name = "donut",
                label = "Donut",
                image = "donut.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "beanfrappachino",
                label = "Frappachino",
                image = "beanfrappachino.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "beanhotchocolate",
                label = "Sıcak Cikolata",
                image = "beanhotchocolate.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "sebastian",
                label = "sebastian",
                image = "sebastian.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
       
            {
                name = "longisland",
                label = "longisland",
                image = "longisland.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "kruvasan",
                label = "kruvasan",
                image = "kruvasan.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cookie",
                label = "cookie",
                image = "cookie.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            }
        }
    },
    {
      coords = vector3(-1404.0774, -599.4557, 30.3200),
      job = "bahama",
      items = {
             {
              name = "crisps",
              label = "Patates",
              image = "crisps.png",
              requiredItems = {
                  {item = "seker", amount = 1, label = "Şeker"},
                  {item = "water", amount = 1, label = "Su"}
              },
              progressTime = 10000 -- Progress bar süresi (ms)
          },
          {
              name = "coffee",
              label = "Kahve",
              image = "coffee.png",
              requiredItems = {
                  {item = "seker", amount = 1, label = "Şeker"},
                  {item = "water", amount = 1, label = "Su"}
              },
              progressTime = 10000 -- Progress bar süresi (ms)
          },
          {
              name = "wine",
              label = "Şarap",
              image = "wine.png",
              requiredItems = {
                  {item = "seker", amount = 1, label = "Şeker"},
                  {item = "water", amount = 1, label = "Su"}
              },
              progressTime = 10000 -- Progress bar süresi (ms)
          },
          {
              name = "whiskey",
              label = "Viski",
              image = "whiskey.png",
              requiredItems = {
                  {item = "seker", amount = 1, label = "Şeker"},
                  {item = "water", amount = 1, label = "Su"}
              },
              progressTime = 10000 -- Progress bar süresi (ms)
          },
          {
              name = "vodka",
              label = "Vodka",
              image = "vodka.png",
              requiredItems = {
                  {item = "seker", amount = 1, label = "Şeker"},
                  {item = "water", amount = 1, label = "Su"}
              },
              progressTime = 10000 -- Progress bar süresi (ms)
          },
          {
              name = "beer",
              label = "Bira",
              image = "beer.png",
              requiredItems = {
                  {item = "seker", amount = 1, label = "Şeker"},
                  {item = "water", amount = 1, label = "Su"}
              },
              progressTime = 10000 -- Progress bar süresi (ms)
          },
          {
              name = "djs_cocktail_blue",
              label = "Mavi Kokteyl",
              image = "djs_cocktail_blue.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_blue2",
              label = "Mavi Kokteyl",
              image = "djs_cocktail_blue2.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_blue3",
              label = "Mavi Kokteyl",
              image = "djs_cocktail_blue3.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_blue4",
              label = "Mavi Kokteyl",
              image = "djs_cocktail_blue4.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_blue5",
              label = "Mavi Kokteyl",
              image = "djs_cocktail_blue5.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_blue6",
              label = "Mavi Kokteyl",
              image = "djs_cocktail_blue6.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_blue7",
              label = "Mavi Kokteyl",
              image = "djs_cocktail_blue7.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_blue8",
              label = "Mavi Kokteyl",
              image = "djs_cocktail_blue8.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
          
            -- Yeşil Kokteyller
            {
              name = "djs_cocktail_green",
              label = "Yeşil Kokteyl",
              image = "djs_cocktail_green.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_green2",
              label = "Yeşil Kokteyl",
              image = "djs_cocktail_green2.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_green3",
              label = "Yeşil Kokteyl",
              image = "djs_cocktail_green3.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_green4",
              label = "Yeşil Kokteyl",
              image = "djs_cocktail_green4.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_green5",
              label = "Yeşil Kokteyl",
              image = "djs_cocktail_green5.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_green6",
              label = "Yeşil Kokteyl",
              image = "djs_cocktail_green6.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_green7",
              label = "Yeşil Kokteyl",
              image = "djs_cocktail_green7.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_green8",
              label = "Yeşil Kokteyl",
              image = "djs_cocktail_green8.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
          
            -- Turuncu Kokteyller
            {
              name = "djs_cocktail_orange",
              label = "Turuncu Kokteyl",
              image = "djs_cocktail_orange.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_orange2",
              label = "Turuncu Kokteyl",
              image = "djs_cocktail_orange2.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_orange3",
              label = "Turuncu Kokteyl",
              image = "djs_cocktail_orange3.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_orange4",
              label = "Turuncu Kokteyl",
              image = "djs_cocktail_orange4.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_orange5",
              label = "Turuncu Kokteyl",
              image = "djs_cocktail_orange5.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_orange6",
              label = "Turuncu Kokteyl",
              image = "djs_cocktail_orange6.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_orange7",
              label = "Turuncu Kokteyl",
              image = "djs_cocktail_orange7.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_orange8",
              label = "Turuncu Kokteyl",
              image = "djs_cocktail_orange8.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
          
            -- Mor Kokteyller
            {
              name = "djs_cocktail_purple",
              label = "Mor Kokteyl",
              image = "djs_cocktail_purple.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_purple2",
              label = "Mor Kokteyl",
              image = "djs_cocktail_purple2.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_purple3",
              label = "Mor Kokteyl",
              image = "djs_cocktail_purple3.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_purple4",
              label = "Mor Kokteyl",
              image = "djs_cocktail_purple4.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_purple5",
              label = "Mor Kokteyl",
              image = "djs_cocktail_purple5.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_purple6",
              label = "Mor Kokteyl",
              image = "djs_cocktail_purple6.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_purple7",
              label = "Mor Kokteyl",
              image = "djs_cocktail_purple7.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_purple8",
              label = "Mor Kokteyl",
              image = "djs_cocktail_purple8.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
          
            -- Kırmızı Kokteyller
            {
              name = "djs_cocktail_red",
              label = "Kırmızı Kokteyl",
              image = "djs_cocktail_red.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_red2",
              label = "Kırmızı Kokteyl",
              image = "djs_cocktail_red2.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_red3",
              label = "Kırmızı Kokteyl",
              image = "djs_cocktail_red3.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_red4",
              label = "Kırmızı Kokteyl",
              image = "djs_cocktail_red4.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_red5",
              label = "Kırmızı Kokteyl",
              image = "djs_cocktail_red5.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_red6",
              label = "Kırmızı Kokteyl",
              image = "djs_cocktail_red6.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_red7",
              label = "Kırmızı Kokteyl",
              image = "djs_cocktail_red7.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            },
            {
              name = "djs_cocktail_red8",
              label = "Kırmızı Kokteyl",
              image = "djs_cocktail_red8.png",
              requiredItems = {
                { item = "seker", amount = 1, label = "Şeker" },
                { item = "water", amount = 1, label = "Su" }
              },
              progressTime = 10000
            }
      }
  },
    {
        coords = vector3(921.1070, -2529.4761, 28.3227),
        job = "afterlife",
        items = {
               {
                name = "crisps",
                label = "Patates",
                image = "crisps.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "coffee",
                label = "Kahve",
                image = "coffee.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "wine",
                label = "Şarap",
                image = "wine.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "whiskey",
                label = "Viski",
                image = "whiskey.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "vodka",
                label = "Vodka",
                image = "vodka.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_cocktail_blue",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue2",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue3",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue4",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue5",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue6",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue7",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue8",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Yeşil Kokteyller
              {
                name = "djs_cocktail_green",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green2",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green3",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green4",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green5",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green6",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green7",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green8",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Turuncu Kokteyller
              {
                name = "djs_cocktail_orange",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange2",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange3",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange4",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange5",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange6",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange7",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange8",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Mor Kokteyller
              {
                name = "djs_cocktail_purple",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple2",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple3",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple4",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple5",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple6",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple7",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple8",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Kırmızı Kokteyller
              {
                name = "djs_cocktail_red",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red2",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red3",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red4",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red5",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red6",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red7",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red8",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              }
        }
    },
    {
        coords = vector3(128.26, -1032.17, 28.61), -- Koordinatları doldur
        job = "beanmachine",
        items = {
            {
                name = "djs_prop_buttercroissant",
                label = "Buttercroissant",
                image = "djs_prop_buttercroissant.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_cheesedanish",
                label = "Cheesedanish",
                image = "djs_prop_cheesedanish.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_chocolatecakepop",
                label = "Chocolatecakepop",
                image = "djs_prop_chocolatecakepop.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_chocolatecroissant",
                label = "Chocolatecroissant",
                image = "djs_prop_chocolatecroissant.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_classicoatmeal",
                label = "Classicoatmeal",
                image = "djs_prop_classicoatmeal.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_bmcoffeecuplarge",
                label = "Bmcoffeecuplarge",
                image = "djs_prop_bmcoffeecuplarge.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_bmcoffeecupmedium",
                label = "Bmcoffeecupmedium",
                image = "djs_prop_bmcoffeecupmedium.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_bmcoffeecupsmall",
                label = "Bmcoffeecupsmall",
                image = "djs_prop_bmcoffeecupsmall.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_impossiblesbreakfastsandwich",
                label = "Impossiblesbreakfastsandwich",
                image = "djs_prop_impossiblesbreakfastsandwich.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_pumpkincreamcheesemuffin",
                label = "Pumpkincreamcheesemuffin",
                image = "djs_prop_pumpkincreamcheesemuffin.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_sandwichsmokedbacon",
                label = "Sandwichsmokedbacon",
                image = "djs_prop_sandwichsmokedbacon.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_turkeybaconcheddareggwhite",
                label = "Turkeybaconcheddareggwhite",
                image = "djs_prop_turkeybaconcheddareggwhite.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            {
                name = "djs_prop_unicorncakepop",
                label = "Unicorncakepop",
                image = "djs_prop_unicorncakepop.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000
            },
            
            {
                name = "donut",
                label = "Donut",
                image = "donut.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "beanfrappachino",
                label = "Frappachino",
                image = "beanfrappachino.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "beanhotchocolate",
                label = "Sıcak Cikolata",
                image = "beanhotchocolate.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "sebastian",
                label = "sebastian",
                image = "sebastian.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
       
            {
                name = "longisland",
                label = "longisland",
                image = "longisland.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "kruvasan",
                label = "kruvasan",
                image = "kruvasan.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cookie",
                label = "cookie",
                image = "cookie.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            }
        }
    },








    {
        coords = vector3(-1132.75, -1718.97, 4.60), -- Koordinatları doldur
        job = "iskelebar",
        items = {
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cilekkokteyl",
                label = "Çilekli Kokteys",
                image = "cilekkokteyl.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "drimartini",
                label = "Dri Martini",
                image = "drimartini.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "bloodymary",
                label = "bloodymary",
                image = "bloodymary.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "mojito_banana",
                label = "Mojoto Muz",
                image = "mojito_banana.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "shotertequila",
                label = "Tequilla",
                image = "shotertequila.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "vodka",
                label = "vodka",
                image = "vodka.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "gokkusagik",
                label = "Gökkuşağı K.",
                image = "gokkusagik.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "ozelkarisim",
                label = "Özel Karısım",
                image = "ozelkarisim.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "jin",
                label = "Gin",
                image = "jin.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cereztabagi",
                label = "Cerez Tabagi",
                image = "cereztabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "meyvetabagi",
                label = "Meyve Tabagi",
                image = "meyvetabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "longisland",
                label = "longisland",
                image = "longisland.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "doubleburger",
                label = "Double Burger",
                image = "doubleburger.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "fries",
                label = "Patates Kızartması",
                image = "fries.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            }
        }
    },
    {
        coords = vector3(946.67, 17.42, 115.30), -- Koordinatları doldur
        job = "kara",
        items = {
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cilekkokteyl",
                label = "Çilekli Kokteys",
                image = "cilekkokteyl.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "drimartini",
                label = "Dri Martini",
                image = "drimartini.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "bloodymary",
                label = "bloodymary",
                image = "bloodymary.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "mojito_banana",
                label = "Mojoto Muz",
                image = "mojito_banana.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "shotertequila",
                label = "Tequilla",
                image = "shotertequila.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "vodka",
                label = "vodka",
                image = "vodka.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "gokkusagik",
                label = "Gökkuşağı K.",
                image = "gokkusagik.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "ozelkarisim",
                label = "Özel Karısım",
                image = "ozelkarisim.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "jin",
                label = "Gin",
                image = "jin.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cereztabagi",
                label = "Cerez Tabagi",
                image = "cereztabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "meyvetabagi",
                label = "Meyve Tabagi",
                image = "meyvetabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "longisland",
                label = "longisland",
                image = "longisland.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "doubleburger",
                label = "Double Burger",
                image = "doubleburger.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "fries",
                label = "Patates Kızartması",
                image = "fries.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            }
        }
    },
    {
        coords = vector3(-298.07672119141,-70.028373718262,48.614418029785),  
        job = "cute",
        items = {
            {
                name = "cola",
                label = "Cola",
                image = "cola.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "fanta",
                label = "Fanta",
                image = "fanta.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "soda",
                label = "Soda",
                image = "soda.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "coffee",
                label = "Coffee",
                image = "coffee.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "donut",
                label = "Donut",
                image = "donut.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_coke",
                label = "Cupcake Coke",
                image = "cupcake_coke.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_cherry",
                label = "Cupcake Cherry",
                image = "cupcake_cherry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_blackberry",
                label = "Cupcake Blackberry",
                image = "cupcake_blackberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_strawberry",
                label = "Cupcake Strawberry",
                image = "cupcake_strawberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_vaniliy",
                label = "Cupcake Vaniliy",
                image = "cupcake_vaniliy.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "pudding_blackberry",
                label = "Pudding Blackberry",
                image = "pudding_blackberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "pudding_orange",
                label = "Pudding Orange",
                image = "pudding_orange.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "pudding_kiwi",
                label = "Pudding Kiwi",
                image = "pudding_kiwi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    {
        coords = vector3(-1783.12, -1236.78, 14.25),
        job = "pier",
        items = {
            {
                name = "cola",
                label = "Cola",
                image = "cola.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "fanta",
                label = "Fanta",
                image = "fanta.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "soda",
                label = "Soda",
                image = "soda.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "coffee",
                label = "Coffee",
                image = "coffee.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "donut",
                label = "Donut",
                image = "donut.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_coke",
                label = "Cupcake Coke",
                image = "cupcake_coke.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_cherry",
                label = "Cupcake Cherry",
                image = "cupcake_cherry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_blackberry",
                label = "Cupcake Blackberry",
                image = "cupcake_blackberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_strawberry",
                label = "Cupcake Strawberry",
                image = "cupcake_strawberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_vaniliy",
                label = "Cupcake Vaniliy",
                image = "cupcake_vaniliy.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "pudding_blackberry",
                label = "Pudding Blackberry",
                image = "pudding_blackberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "pudding_orange",
                label = "Pudding Orange",
                image = "pudding_orange.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "pudding_kiwi",
                label = "Pudding Kiwi",
                image = "pudding_kiwi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    {
        coords = vector3(122.85, -1041.64, 28.46), -- Koordinatları doldur
        job = "beanmachine",
        items = {
            {
                name = "cola",
                label = "Cola",
                image = "cola.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "fanta",
                label = "Fanta",
                image = "fanta.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "soda",
                label = "Soda",
                image = "soda.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "coffee",
                label = "Coffee",
                image = "coffee.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "donut",
                label = "Donut",
                image = "donut.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_coke",
                label = "Cupcake Coke",
                image = "cupcake_coke.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_cherry",
                label = "Cupcake Cherry",
                image = "cupcake_cherry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_blackberry",
                label = "Cupcake Blackberry",
                image = "cupcake_blackberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_strawberry",
                label = "Cupcake Strawberry",
                image = "cupcake_strawberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "cupcake_vaniliy",
                label = "Cupcake Vaniliy",
                image = "cupcake_vaniliy.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "pudding_blackberry",
                label = "Pudding Blackberry",
                image = "pudding_blackberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            },
            {
                name = "pudding_orange",
                label = "Pudding Orange",
                image = "pudding_orange.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "pudding_kiwi",
                label = "Pudding Kiwi",
                image = "pudding_kiwi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    {
        coords = vector3(-11.1486, -1672.8557, 29.4916), -- Koordinatları güncelle
        job = "wedshop", -- İş adını güncelle
        items = {
            {
                name = "joint",
                label = "joint",
                image = "joint.png",
                requiredItems = {
                    {item = "packed_weed", amount = 5, label = "packed_weed"},
                },
                price = 10,
                amount = 10,
                progressTime = 10000
            }
        }
    },  
    {
        coords = vector3(1101.1897, -709.1898, 57.7051), -- Koordinatları güncelle
        job = "motelcafe", -- İş adını güncelle
        items = {
            {
                name = "crisps",
                label = "Patates",
                image = "crisps.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "coffee",
                label = "Kahve",
                image = "coffee.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "meyvetabagi",
                label = "meyvetabagi",
                image = "meyvetabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "wine",
                label = "Şarap",
                image = "wine.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "whiskey",
                label = "Viski",
                image = "whiskey.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "vodka",
                label = "Vodka",
                image = "vodka.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_cocktail_blue",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue2",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue3",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue4",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue5",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue6",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue7",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_blue8",
                label = "Mavi Kokteyl",
                image = "djs_cocktail_blue8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Yeşil Kokteyller
              {
                name = "djs_cocktail_green",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green2",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green3",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green4",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green5",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green6",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green7",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_green8",
                label = "Yeşil Kokteyl",
                image = "djs_cocktail_green8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Turuncu Kokteyller
              {
                name = "djs_cocktail_orange",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange2",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange3",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange4",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange5",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange6",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange7",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_orange8",
                label = "Turuncu Kokteyl",
                image = "djs_cocktail_orange8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Mor Kokteyller
              {
                name = "djs_cocktail_purple",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple2",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple3",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple4",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple5",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple6",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple7",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_purple8",
                label = "Mor Kokteyl",
                image = "djs_cocktail_purple8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
            
              -- Kırmızı Kokteyller
              {
                name = "djs_cocktail_red",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red2",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red2.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red3",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red3.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red4",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red4.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red5",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red5.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red6",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red6.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red7",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red7.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              },
              {
                name = "djs_cocktail_red8",
                label = "Kırmızı Kokteyl",
                image = "djs_cocktail_red8.png",
                requiredItems = {
                  { item = "seker", amount = 1, label = "Şeker" },
                  { item = "water", amount = 1, label = "Su" }
                },
                progressTime = 10000
              }
        }
    }, 
    {
        coords = vector3(-591.1, -1056.86, 21.4), -- Koordinatları güncelle
        job = "uwucafe", -- İş adını güncelle
        items = {
            {
                name = "djs_strawberrycrepe_vanilla",
                label = "Vanilyalı Çilekli Krep",
                image = "djs_strawberrycrepe_vanilla.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_strawberrycrepe_strawberry",
                label = "Çilekli Çilekli Krep",
                image = "djs_strawberrycrepe_strawberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_strawberrycrepe_chocolate",
                label = "Çikolatalı Çilekli Krep",
                image = "djs_strawberrycrepe_chocolate.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_soda_yellow",
                label = "Uwu Melon Sodası ",
                image = "djs_soda_yellow.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_soda_pink",
                label = "Uwu Kavun Sodası",
                image = "djs_soda_pink.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_soda_green",
                label = "Uwu Elma Sodası",
                image = "djs_soda_green.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_plate_pandawaffle",
                label = "Panda Waffle Tabağı",
                image = "djs_plate_pandawaffle.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_plate_bearwaffles",
                label = "Ayı Waffle Tabağı",
                image = "djs_plate_bearwaffles.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_milkshake_strawberryshortcake",
                label = "Çilekli Shortcake Milkshake",
                image = "djs_milkshake_strawberryshortcake.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_milkshake_gummybear",
                label = "UGummy Bear Milkshake",
                image = "djs_milkshake_gummybear.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_milkshake_cookiemonster",
                label = "Kurabiye Canavarı Milkshake",
                image = "djs_milkshake_cookiemonster.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_milkshake_chocolatepretzel",
                label = "Çikolatalı Pretzel Milkshake",
                image = "djs_milkshake_chocolatepretzel.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_macaron_yellow",
                label = "Sarı Macaron",
                image = "djs_macaron_yellow.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_macaron_pink",
                label = "Pembe Macaron",
                image = "djs_macaron_pink.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_macaron_lightpink",
                label = "Açık Pembe Macaron",
                image = "djs_macaron_lightpink.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_macaron_lightbrown",
                label = "Açık Kahverengi Macaron",
                image = "djs_macaron_lightbrown.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_macaron_green",
                label = "Yeşil Macaron",
                image = "djs_macaron_green.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_macaron_brown",
                label = "Kahverengi Macaron",
                image = "djs_macaron_brown.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },

            {
                name = "djs_kiwicrepe_vanilla",
                label = "Vanilyalı Kiwi Krep",
                image = "djs_kiwicrepe_vanilla.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            }, {
                name = "djs_kiwicrepe_strawberry",
                label = "Çilekli Kiwi Krep",
                image = "djs_kiwicrepe_strawberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },  {
                name = "djs_kiwicrepe_chocolate",
                label = "Çikolatalı Kiwi Krep",
                image = "djs_kiwicrepe_chocolate.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },  {
                name = "djs_japanese_omelette",
                label = "Japon Omleti",
                image = "djs_japanese_omelette.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },  {
                name = "djs_glass_icetea",
                label = "Buzlu Çay",
                image = "djs_glass_icetea.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },  {
                name = "djs_glass_greentea",
                label = "Yeşil Çay",
                image = "djs_glass_greentea.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },  {
                name = "djs_bowl_veggiebibimbap",
                label = "Sebzeli Bibimbap Kasesi",
                image = "djs_bowl_veggiebibimbap.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },  {
                name = "djs_bowl_beefbibimbap",
                label = "Etli Bibimbap Kasesi",
                image = "djs_bowl_beefbibimbap.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },  {
                name = "djs_bobatea_taro",
                label = "Taro Boba Çayı",
                image = "djs_bobatea_taro.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },  {
                name = "djs_bobatea_strawberry",
                label = "Çilekli Boba Çayı",
                image = "djs_bobatea_strawberry.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },  {
                name = "djs_bobatea_pinacolada",
                label = "Pina Colada Boba Çayı",
                image = "djs_bobatea_pinacolada.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },  {
                name = "djs_bobatea_peach",
                label = "Şeftali Boba Çayı",
                image = "djs_bobatea_peach.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },  {
                name = "djs_bobatea_mango",
                label = "Mango Boba Çayı",
                image = "djs_bobatea_mango.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },  {
                name = "djs_bobatea_honeydew",
                label = "Bal Kavunu Boba Çayı",
                image = "djs_bobatea_honeydew.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_bobatea_grapefruit",
                label = "Greyfurt Boba Çayı",
                image = "djs_bobatea_grapefruit.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_bobatea_cottoncandy",
                label = "Pamuk Şekerli Boba Çayı",
                image = "djs_bobatea_cottoncandy.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_bobatea_cookiesandcream",
                label = "Kurabiye ve Krema Boba Çayı",
                image = "djs_bobatea_cookiesandcream.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_bobatea_chocolate",
                label = "Çikolatalı Boba Çayı",
                image = "djs_bobatea_chocolate.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_bobatea_chai",
                label = "Chai Boba Çayı",
                image = "djs_bobatea_chai.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_bentobox_kidsmeal",
                label = "Çocuk Menüsü Bento Kutusu",
                image = "djs_bentobox_kidsmeal.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_bentobox_heart2",
                label = "Kalp Bento Kutusu 2",
                image = "djs_bentobox_heart2.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "djs_bentobox_heart",
                label = "Kalp Bento Kutusu",
                image = "djs_bentobox_heart.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            },
        
            {
                name = "djs_bentobox_heart2",
                label = "Kalp Bento Kutusu 2",
                image = "djs_bentobox_heart2.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                price = 10,
                amount = 10,
                progressTime = 10000 -- Progress bar süresi (ms)
            }
           
        }
    },   
    {
        coords = vector3(179.29, -237.38, 52.98),
        job = "vibecafe",
        items = {

            {
                name = "bubbletea_blueberry",
                label = "Bubbletea - Yabanmersini",
                image = "bubbletea_blueberry.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "bubbletea_mint",
                label = "Bubbletea - Mint",
                image = "bubbletea_mint.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "bubbletea_rose",
                label = "Bubbletea - Rose",
                image = "bubbletea_rose.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "kruvasan",
                label = "Taze Çikolatalı Kruvasan",
                image = "kruvasan.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cereztabagi",
                label = "Çerezlik Tabak",
                image = "cereztabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cay",
                label = "Çay",
                image = "cay.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "kahve",
                label = "Kahve",
                image = "kahve.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "catcoffee",
                label = "Kahve",
                image = "catcoffee.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    
    {
        coords = vector3(14.591535568237,-1596.9801025391,27.932884216309), 
        job = "taco",
        items = {

            {
                name = "taco",
                label = "taco",
                image = "taco.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "tacobeef",
                label = "Etli Taco",
                image = "tacobeef.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "wings",
                label = "Taco Kanat",
                image = "wings.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "lemonade",
                label = "Taco Limonata",
                image = "lemonade.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cola",
                label = "Cola",
                image = "cola.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "fanta",
                label = "Fanta",
                image = "fanta.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "soda",
                label = "Soda",
                image = "soda.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    {
        coords = vector3(-1772.40, -1160.81, 12.28),
        job = "hotdog",
        items = {

            {
                name = "hotdog",
                label = "hotdog",
                image = "hotdog.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "hotdog_tatarka",
                label = "Hardallı sosisli sandviç",
                image = "hotdog_tatarka.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "hranolky_kecup",
                label = "Ketçaplı Patates Kızartması",
                image = "hranolky_kecup.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "hranolky_tatarka",
                label = "Tatar'lı patates kızartması",
                image = "hranolky_tatarka.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cola",
                label = "Cola",
                image = "cola.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "fanta",
                label = "Fanta",
                image = "fanta.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "soda",
                label = "Soda",
                image = "soda.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    {
    coords = vector3(-829.80, -966.43, 14.41),
    job = "hotdog",
    items = {

        {
            name = "hotdog",
            label = "hotdog",
            image = "hotdog.png",
            requiredItems = {
                {item = "water", amount = 1, label = "Su"},
                {item = "seker", amount = 1, label = "Şeker"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        },
        {
            name = "hotdog_tatarka",
            label = "Hardallı sosisli sandviç",
            image = "hotdog_tatarka.png",
            requiredItems = {
                {item = "water", amount = 1, label = "Su"},
                {item = "seker", amount = 1, label = "Şeker"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        },
        {
            name = "hranolky_kecup",
            label = "Ketçaplı Patates Kızartması",
            image = "hranolky_kecup.png",
            requiredItems = {
                {item = "water", amount = 1, label = "Su"},
                {item = "seker", amount = 1, label = "Şeker"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        },
        {
            name = "hranolky_tatarka",
            label = "Tatar'lı patates kızartması",
            image = "hranolky_tatarka.png",
            requiredItems = {
                {item = "water", amount = 1, label = "Su"},
                {item = "seker", amount = 1, label = "Şeker"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        },
        {
            name = "cola",
            label = "Cola",
            image = "cola.png",
            requiredItems = {
                {item = "seker", amount = 1, label = "Şeker"},
                {item = "water", amount = 1, label = "Su"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        },
        {
            name = "fanta",
            label = "Fanta",
            image = "fanta.png",
            requiredItems = {
                {item = "seker", amount = 1, label = "Şeker"},
                {item = "water", amount = 1, label = "Su"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        },
        {
            name = "soda",
            label = "Soda",
            image = "soda.png",
            requiredItems = {
                {item = "seker", amount = 1, label = "Şeker"},
                {item = "water", amount = 1, label = "Su"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        }
    }
},
{
    coords = vector3(-1835.63, -1233.48, 12.35),
    job = "hotdog",
    items = {

        {
            name = "hotdog",
            label = "hotdog",
            image = "hotdog.png",
            requiredItems = {
                {item = "water", amount = 1, label = "Su"},
                {item = "seker", amount = 1, label = "Şeker"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        },
        {
            name = "hotdog_tatarka",
            label = "Hardallı sosisli sandviç",
            image = "hotdog_tatarka.png",
            requiredItems = {
                {item = "water", amount = 1, label = "Su"},
                {item = "seker", amount = 1, label = "Şeker"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        },
        {
            name = "hranolky_kecup",
            label = "Ketçaplı Patates Kızartması",
            image = "hranolky_kecup.png",
            requiredItems = {
                {item = "water", amount = 1, label = "Su"},
                {item = "seker", amount = 1, label = "Şeker"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        },
        {
            name = "hranolky_tatarka",
            label = "Tatar'lı patates kızartması",
            image = "hranolky_tatarka.png",
            requiredItems = {
                {item = "water", amount = 1, label = "Su"},
                {item = "seker", amount = 1, label = "Şeker"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        },
        {
            name = "cola",
            label = "Cola",
            image = "cola.png",
            requiredItems = {
                {item = "seker", amount = 1, label = "Şeker"},
                {item = "water", amount = 1, label = "Su"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        },
        {
            name = "fanta",
            label = "Fanta",
            image = "fanta.png",
            requiredItems = {
                {item = "seker", amount = 1, label = "Şeker"},
                {item = "water", amount = 1, label = "Su"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        },
        {
            name = "soda",
            label = "Soda",
            image = "soda.png",
            requiredItems = {
                {item = "seker", amount = 1, label = "Şeker"},
                {item = "water", amount = 1, label = "Su"}
            },
            progressTime = 10000 -- Progress bar süresi (ms)
        }
    }
},
    {
        coords = vector3(-562.22, 289.08, 82.18),
        job = "tequila",
        items = {

            {
                name = "whiskey",
                label = "Viski",
                image = "whiskey.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer_03",
                label = "Bira Fışkısı",
                image = "beer_03.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer_05",
                label = "Bira Fışkısı Büyük",
                image = "beer_05.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "vodka",
                label = "Votka",
                image = "vodka.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "wine",
                label = "Şarap",
                image = "wine.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "water_bottle",
                label = "Su",
                image = "water_bottle.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    {
        coords = vector3(-369.30, 206.23, 76.58),
        job = "mai10",
        items = {

            {
                name = "whiskey",
                label = "Viski",
                image = "whiskey.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer_03",
                label = "Bira Fışkısı",
                image = "beer_03.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer_05",
                label = "Bira Fışkısı Büyük",
                image = "beer_05.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "vodka",
                label = "Votka",
                image = "vodka.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "wine",
                label = "Şarap",
                image = "wine.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "water_bottle",
                label = "Su",
                image = "water_bottle.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    {
        coords = vector3(1982.26, 3053.07, 47.22),
        job = "yellowjack",
        items = {

            {
                name = "whiskey",
                label = "Viski",
                image = "whiskey.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "vodka",
                label = "Votka",
                image = "vodka.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "wine",
                label = "Şarap",
                image = "wine.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "water_bottle",
                label = "Su",
                image = "water_bottle.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "kruvasan",
                label = "Taze Çikolatalı Kruvasan",
                image = "kruvasan.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cereztabagi",
                label = "Çerezlik Tabak",
                image = "cereztabagi.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "cay",
                label = "Çay",
                image = "cay.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "kahve",
                label = "Kahve",
                image = "kahve.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "catcoffee",
                label = "Kahve",
                image = "catcoffee.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    {
        coords = vector3(112.84, -1282.38, 29.62),
        job = "unicorn",
        items = {

            {
                name = "whiskey",
                label = "Viski",
                image = "whiskey.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "beer",
                label = "Bira",
                image = "beer.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"},
                    {item = "seker", amount = 1, label = "Şeker"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "vodka",
                label = "Votka",
                image = "vodka.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "wine",
                label = "Şarap",
                image = "wine.png",
                requiredItems = {
                    {item = "seker", amount = 1, label = "Şeker"},
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
            {
                name = "water_bottle",
                label = "Su",
                image = "water_bottle.png",
                requiredItems = {
                    {item = "water", amount = 1, label = "Su"}
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            }
        }
    },
    {
        coords = vector3(16.88, -1107.56, 29.80),
        job = "yirmibirst",
        items = {
            {
                name = "WEAPON_BAT",
                label = "Sopa",
                image = "WEAPON_BAT.png",
                requiredItems = {
                },
                progressTime = 10000 -- Progress bar süresi (ms)
            },
        }
    },
    
}
