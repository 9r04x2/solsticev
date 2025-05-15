Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)
Config.PauseMapText = ''                                     -- Text shown above the map when ESC is pressed. If left empty 'FiveM' will appear
Config.HarnessUses = 20
Config.DamageNeeded = 100.0                                  -- amount of damage till you can push your vehicle. 0-1000
Config.Logging = 'discord'                                   -- fivemanage

Config.AFK = {
    ignoredGroups = {
        ['mod'] = true,
        ['admin'] = true,
        ['god'] = true
    },
    secondsUntilKick = 1000000, -- AFK Kick Time Limit (in seconds)
    kickInCharMenu = false      -- Set to true if you want to kick players for being AFK even when they are in the character menu.
}

Config.HandsUp = {
    command = 'hu',
    keybind = 'X',
    controls = { 24, 25, 47, 58, 59, 63, 64, 71, 72, 75, 140, 141, 142, 143, 257, 263, 264 }
}

Config.Binoculars = {
    zoomSpeed = 10.0,        -- camera zoom speed
    storeBinocularsKey = 177 -- backspace by default
}

Config.AIResponse = {
    wantedLevels = false, -- if true, you will recieve wanted levels
    dispatchServices = {  -- AI dispatch services
        [1] = false,      -- Police Vehicles
        [2] = false,      -- Police Helicopters
        [3] = false,      -- Fire Department Vehicles
        [4] = false,      -- Swat Vehicles
        [5] = false,      -- Ambulance Vehicles
        [6] = false,      -- Police Motorcycles
        [7] = false,      -- Police Backup
        [8] = false,      -- Police Roadblocks
        [9] = false,      -- PoliceAutomobileWaitPulledOver
        [10] = false,     -- PoliceAutomobileWaitCruising
        [11] = false,     -- Gang Members
        [12] = false,     -- Swat Helicopters
        [13] = false,     -- Police Boats
        [14] = false,     -- Army Vehicles
        [15] = false      -- Biker Backup
    }
}

-- -- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686
-- Config.Discord = {
--     isEnabled = true,                                     -- If set to true, then discord rich presence will be enabled
--     applicationId = '763498470622363658',                   -- The discord application id
--     iconLarge = 'surrealrp',                               -- The name of the large icon
--     iconLargeHoverText = 'SuRReaLV Roleplay', -- The hover text of the large icon
--     iconSmall = 'surrealrp',                         -- The name of the small icon
--     iconSmallHoverText = '<3', -- The hover text of the small icon
--     updateRate = 60000,                                    -- How often the player count should be updated
--     showPlayerCount = true,                                -- If set to true the player count will be displayed in the rich presence
--     maxPlayers = 250,                                       -- Maximum amount of players
--     buttons = {
--         {
--             text = 'Oyuna Bağlan',
--             url = 'fivem://connect/185.137.98.110:30120'
--         },
--         {
--             text = 'Discord Bağlan',
--             url = 'https://discord.gg/surrealv'
--         }
--     }
-- }

-- Config.Density = {
--     parked = 2.0,
--     vehicle = 5.0,
--     multiplier = 1,
--     peds = 1,
--     scenario = 0.0
-- }

Config.Disable = {
    hudComponents = { 1, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 15, 17, 18, 19, 20, 21}, -- Hud Components, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    controls = { 37 },                                            -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = true,                                           -- false disables ammo display
    ambience = false,                                             -- disables distance sirens, distance car alarms, flight music, etc
    idleCamera = true,                                            -- disables the idle cinematic camera
    vestDrawable = false,                                         -- disables the vest equipped when using heavy armor
    pistolWhipping = true,                                        -- disables pistol whipping
    driveby = false,                                              -- disables driveby
}


Config.RelieveWeedStress = math.random(15, 20) -- stress relief amount (100 max)


Config.Consumables = {
    eat = {
        ['tosti'] = math.random(7, 12),
        ['chocolate'] = math.random(7, 12),
        ['sandwich'] = math.random(75, 100),
        ['onionrings'] = math.random(75, 100),
        ['hotdog'] = math.random(75, 100),
        ['crisps'] = math.random(75, 100),
        ['doubleburger'] = math.random(75, 100),
        ['burger_meat'] = math.random(75, 100),
        ['burger_chicken'] = math.random(75, 100),
        ['pizza_mushroom'] = math.random(75, 100),
        ['pizza_pineapple'] = math.random(75, 100),
        ['pizza_mozzarella'] = math.random(75, 100),
        ['amaebi_gunkan'] = math.random(75, 100),
        ['california_roll'] = math.random(75, 100),
        ['cheese_gunkan'] = math.random(75, 100),
        ['cheese_tobikko_ebi_roll'] = math.random(75, 100),
        ['chuka_kurage'] = math.random(75, 100),
        ['chuka_wakame_gunkan'] = math.random(75, 100),
        ['duck_sushi'] = math.random(75, 100),
        ['genki_roll'] = math.random(75, 100),
        ['hamachi'] = math.random(75, 100),
        ['hokkigai_sushi'] = math.random(75, 100),
        ['ikasushi'] = math.random(75, 100),
        ['ikura_gunkan'] = math.random(75, 100),
        ['kani_gunkan'] = math.random(75, 100),
        ['krab_miso_gunkan'] = math.random(75, 100),
        ['lobster_salad_roll'] = math.random(75, 100),
        ['losos_mentai'] = math.random(75, 100),
        ['losos_sushi'] = math.random(75, 100),
        ['spicy_salmon'] = math.random(75, 100),
        ['unagi_sushi'] = math.random(75, 100),
        ['pizza_pepperoni'] = math.random(75, 100),
        ['pizza_mozzarella'] = math.random(75, 100),
        ['pizza_pineapple'] = math.random(75, 100),
        ['pizza_mushroom'] = math.random(75, 100),
        ['taco'] = math.random(75, 100),
        ['cupcake_coke'] = math.random(75, 100),
        ['cupcake_cherry'] = math.random(75, 100),
        ['cupcake_blackberry'] = math.random(75, 100),
        ['cupcake_strawberry'] = math.random(75, 100),
        ['cupcake_vaniliy'] = math.random(75, 100),
        ['pudding_blackberry'] = math.random(75, 100),
        ['pudding_orange'] = math.random(75, 100),
        ['pudding_kiwi'] = math.random(75, 100),
        ['pudding_strawberry'] = math.random(75, 100),
        ['donut'] = math.random(25, 50),
        ['cake'] = math.random(25, 50),
        ["kraker"] = math.random(10, 20),
        ["sandwich"] = math.random(95, 100),
        ["cheescake"] = math.random(95, 100),
        ["cutepasta"] = math.random(95, 100),
        ["cikolatapasta"] = math.random(95, 100),
        ["cileklipasta"] = math.random(95, 100),
        ["kedicookie"] = math.random(95, 100),
        ["meyvelipasta"] = math.random(95, 100),
        ["prensespasta"] = math.random(95, 100),
        ["sebastian"] = math.random(95, 100),
        ["tiramisu"] = math.random(95, 100),
        ["visneliturta"] = math.random(95, 100),
        ["ahududuwaffle"] = math.random(95, 100),
        ["baget"] = math.random(95, 100),
        ["cheesetost"] = math.random(95, 100),
        ["cooked_chicken"] = math.random(95, 100),
        ["cooked_meat"] = math.random(95, 100),
        ["crossosandvic"] = math.random(95, 100),
        ["meyvelikrep"] = math.random(95, 100),
        ["simit"] = math.random(95, 100),
        ["tatlikahvalti"] = math.random(95, 100),
        ["cupcake"] = math.random(95, 100),
        ["nohutdurum"] = math.random(95, 100),
        ["nohutpilav"] = math.random(95, 100),
        ["tavukpilav"] = math.random(95, 100),
        ["pepporonipizza"] = math.random(95, 100),
        ["gennaropizza"] = math.random(95, 100),
        ["supremepizza"] = math.random(95, 100),
        ["karisikpizza"] = math.random(95, 100),
        
        ["balonezspaghetti"] = math.random(95, 100),
        ["beyazsarap"] = math.random(95, 100),
        ["diavola"] = math.random(95, 100),
        ["domateslispaghetti"] = math.random(95, 100),
        ["italyanlazanya"] = math.random(95, 100),
        ["italyansalata"] = math.random(95, 100),
        ["kırmızısarap"] = math.random(95, 100),
        ["margheritta"] = math.random(95, 100),
        ["napoletana"] = math.random(95, 100),
        ["sıcılıana"] = math.random(95, 100),
        ["vegetariana"] = math.random(95, 100),
    
        ["sushirolls"] = math.random(20, 32), -- 1
        ["pizzaslice"] = math.random(12, 16), -- 2
        ["cookie"] = math.random(5, 10), -- 3
        ["muffin"] = math.random(5, 10), -- 4
        ["fries"] = math.random(10, 18), -- 5
        ["donut"] = math.random(8, 26), -- 6
        ["icecream"] = math.random(5, 12), -- 7
        ["gum"] = math.random(3, 8), -- 9
        ["ramen"] = math.random(35, 70),
        ["meatfree"] = math.random(35, 70),
        ["moneyshot"] = math.random(35, 70),
        ["shotfries"] = math.random(35, 70),
        ["heartstopper"] = math.random(35, 70),
        ["shotrings"] = math.random(35, 70),
        ["shotnuggets"] = math.random(35, 70),
        ["icecream"] = math.random(35, 70),
        ["uwubaget"] = math.random(45, 80),
        ["uwublackandwhite"] = math.random(45, 80),
        ["uwuchocoberry"] = math.random(45, 80),
        ["uwucileklicheesecake"] = math.random(45, 80),
        ["uwucileklipasta"] = math.random(45, 80),
        ["uwucremebrulee"] = math.random(45, 5800),
        ["uwucrosson"] = math.random(45, 80),
        ["uwuctr"] = math.random(45, 80),
        ["uwuelmack"] = math.random(45, 80),
        ["uwukahvaltck"] = math.random(45, 80),
        ["uwukaramelfrappe"] = math.random(45, 80),
        ["uwukedikurabiye"] = math.random(45, 80),
        ["uwukedimacoron"] = math.random(45, 80),
        ["uwumayacupcake"] = math.random(45, 80),
        ["uwumeyvesalatas"] = math.random(45, 80),
        ["uwumeyvelikrep"] = math.random(45, 80),
        ["uwumeyveliyogurt"] = math.random(45, 80),
        ["uwumorcupcake"] = math.random(45, 80),
        ["uwupinki"] = math.random(45, 80),
        ["uwusandvic"] = math.random(45, 80),
        ["uwusimit"] = math.random(45, 80),
        ["atomfries"] = math.random(35, 70),
        ["burgerchickenmelt"] = math.random(35, 70),
        ["burgerheartstopper"] = math.random(35, 70),
        ["chickensandwich"] = math.random(35, 70),
        ["cıtırtavuk"] = math.random(35, 70),
        ["steakburger"] = math.random(35, 70),
        ["strawberryfloat"] = math.random(35, 70),
        ["sundaychocolate"] = math.random(35, 70),
        ["sundaystrawberry"] = math.random(35, 70),
        ["cookie"] = math.random(35, 70),
        ["kruvasan"] = math.random(35, 70),
        ["çikolatalıdondurma"] = math.random(35, 70),
        ["fıstıklıdondurma"] = math.random(35, 70),
        ["vanilyalıdondurma"] = math.random(35, 70),
        ["gelato"] = math.random(35, 70),
        ["kremalıcupcake"] = math.random(35, 70),
        ["bento"] = math.random(35, 70),
        ["cinmantisi"] = math.random(35, 70),
        ["karides"] = math.random(35, 70),
        ["miso"] = math.random(35, 70),
        ["noodlebowl"] = math.random(35, 70),
        ["ramen"] = math.random(35, 70),
        ["sushii"] = math.random(35, 70),
        ["sushi"] = math.random(35, 70),
        ["burrito"] = math.random(35, 70),
        ["nachoplate"] = math.random(35, 70),
        ["tacobeef"] = math.random(35, 70),
        ["wings"] = math.random(35, 70),
        ["cereztabagi"] = math.random(35, 70),
        ["meyvetabagi"] = math.random(35, 70),
        ["miso"] = math.random(35, 70),
        ["catcookie"] = math.random(35, 70),
        ["catdonut"] = math.random(35, 70),
        ["catpizza"] = math.random(35, 70),
        ["catrice"] = math.random(35, 70),
        ["chocpudding"] = math.random(35, 70),
        ["frenchtoast"] = math.random(35, 70),
        ["fruittart"] = math.random(35, 70),
        ["jello"] = math.random(35, 70),
        ["mochipink"] = math.random(35, 70),
        ["pawcakes"] = math.random(35, 70),
        ["hotdog"] = math.random(35, 70),
        ["hotdog_tatarka"] = math.random(35, 70),
        ["twerks_candy"] = math.random(35, 70),
        ["snikkel_candy"] = math.random(35, 70),
        ["hranolky_kecup"] = math.random(35, 70),
        ["hranolky_tatarka"] = math.random(3, 15)
        
        










        },
    drink = {
        ['water_bottle'] = math.random(7, 12),
        ['fruit_juice'] = math.random(7, 12),
        ['cola'] = math.random(75, 100),
        ['fanta'] = math.random(75, 100),
        ['soda'] = math.random(75, 100),
        ['coffee'] = math.random(75, 100),
        ['mojito_watermelon'] = math.random(75, 100),
        ['mojito_carrot'] = math.random(75, 100),
        ['mojito_cucumber'] = math.random(75, 100),
        ['mojito_tomato'] = math.random(75, 100),
        ['mojito_banana'] = math.random(75, 100),
        ['mojito_mixed'] = math.random(75, 100),
        ['bubbletea_blueberry'] = math.random(75, 100),
        ['bubbletea_mint'] = math.random(75, 100),
        ['bubbletea_rose'] = math.random(75, 100),
        ["pinky"] = math.random(95, 100),
        ["gokkusagik"] = math.random(95, 100),
        ["cilekkokteyl"] = math.random(95, 100),
        ["ozelkarisim"] = math.random(95, 100),
        ["caramellatte"] = math.random(95, 100),
        ["cay"] = math.random(95, 100),
        ["chocoberry"] = math.random(95, 100),
        ["cocowhite"] = math.random(95, 100),
        ["cremabrule"] = math.random(95, 100),
        ["water"] = math.random(15, 20), -- 1
        ["filtrekahve"] = math.random(95, 100),
        ["frappe"] = math.random(95, 100),
        ["icetea"] = math.random(95, 100),
        ["italiansoda"] = math.random(95, 100),
        ["limonata"] = math.random(95, 100),
        ["papatyacayi"] = math.random(95, 100),
        ["rezenecayi"] = math.random(95, 100),
        ["smoothie"] = math.random(95, 100),
        ["eCola"] = math.random(95,100),
        ["ayran"] = math.random(95, 100), -- 
        ["sprite"] = math.random(35, 54), -- 1
        ["pepsi"] = math.random(35, 54), -- 2
        ["mtndew"] = math.random(35, 54), -- 3
        ["lemonade"] = math.random(35, 54), -- 4
        ["pinklemonade"] = math.random(35, 54), -- 5
        ["icedtea"] = math.random(35, 54), -- 6
        ["milk"] = math.random(35, 54), -- 7
        ["fanta"] = math.random(35, 54), -- 8
        ["drpepper"] = math.random(35, 54), -- 9
        ["fruitpunch"] = math.random(35, 54),
        ["bscoke"] = math.random(35, 54),
        ["bscoffee"] = math.random(35, 54),
        ["milkshake"] = math.random(40, 60),
        ["uwufiltrekahve"] = math.random(40, 60),
        ["uwufrappuccinocilek"] = math.random(40, 60),
        ["uwugokkusagshake"] = math.random(40, 60),
        ["uwuicetea"] = math.random(40, 60),
        ["uwuitaliansoda"] = math.random(40, 60),
        ["uwulimonata"] = math.random(40, 60),
        ["uwulovely"] = math.random(40, 60),
        ["uwumiaspecial"] = math.random(40, 60),
        ["uwupapatyacay"] = math.random(40, 60),
        ["uwupemberuya"] = math.random(40, 60),
        ["uwurezenecay"] = math.random(40, 60),
        ["atomshake"] = math.random(35, 54), -- 2
        ["atomsoda"] = math.random(35, 54), -- 3
        ["beanfrappachino"] = math.random(35, 54), -- 4
        ["beanhotchocolate"] = math.random(35, 54), -- 5
        ["beankafeinlikahve"] = math.random(35, 54), -- 6
        ["beankafeinsizkahve"] = math.random(35, 54), -- 7
        ["longisland"] = math.random(35, 54), -- 8
        ["tomcollins"] = math.random(35, 54), -- 9
        ["blueberrybubbletea"] = math.random(35, 54),
        ["bubbletea"] = math.random(35, 54),
        ["cay"] = math.random(35, 54),
        ["çileklibubbletea"] = math.random(35, 54),
        ["kahve"] = math.random(35, 54),
        ["sake"] = math.random(35, 54),
        ["teagreen"] = math.random(35, 54),
        ["ecola"] = math.random(35, 54),
        ["lemonade"] = math.random(35, 54),
        ["sprunk"] = math.random(35, 54),
        ['cataccino'] = math.random(20, 40),
        ['catcoffee'] = math.random(20, 40),
        ['fruitsmoothie'] = math.random(20, 40),
        ['mochameow'] = math.random(20, 40)

    },
    alcohol = {
        ['whiskey'] = math.random(20, 40),
        ['beer'] = math.random(20, 40),
        ['beer_03'] = math.random(20, 40),
        ['beer_05'] = math.random(20, 40),
        ['vodka'] = math.random(20, 40),
        ['wine'] = math.random(20, 40),
        ['beerkeg'] = math.random(20, 40),
        ['beerglass'] = math.random(20, 40),
        ['bloodymary'] = math.random(20, 40),
        ['bluekamikaze'] = math.random(20, 40),
        ['champagne'] = math.random(20, 40),
        ['drimartini'] = math.random(20, 40),
        ['jin'] = math.random(20, 40),
        ['mojito'] = math.random(20, 40),
        ['negroni'] = math.random(20, 40),
        ['shootercoffeeliqure'] = math.random(20, 40),
        ['shotertequila'] = math.random(50, 80)

    }
}

Config.Fireworks = {
    delay = 5, -- time in s till it goes off
    items = {  -- firework items
        'firework1',
        'firework2',
        'firework3',
        'firework4'
    }
}

Config.BlacklistedScenarios = {
    types = {
        'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
        'WORLD_VEHICLE_MILITARY_PLANES_BIG',
        'WORLD_VEHICLE_AMBULANCE',
        'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
        'WORLD_VEHICLE_POLICE_CAR',
        'WORLD_VEHICLE_POLICE_BIKE'
    },
    groups = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`
    }
}

Config.BlacklistedVehs = {
    [`shamal`] = true,
    [`luxor`] = true,
    [`luxor2`] = true,
    [`jet`] = true,
    [`lazer`] = true,
    [`buzzard`] = true,
    [`buzzard2`] = true,
    [`annihilator`] = true,
    [`savage`] = true,
    [`titan`] = true,
    [`rhino`] = true,
    [`firetruck`] = true,
    [`mule`] = true,
    [`maverick`] = true,
    [`blimp`] = true,
    [`airtug`] = true,
    [`camper`] = true,
    [`hydra`] = true,
    [`oppressor`] = true,
    [`technical3`] = true,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = true,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = true,
    [`cargoplane2`] = true,
    [`voltic2`] = true
}

Config.BlacklistedWeapons = {
    [`WEAPON_RAILGUN`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true
}

Config.Objects = { -- for object removal
    { coords = vector3(266.09, -349.35, 44.74), heading = 0, length = 200, width = 200, model = 'prop_sec_barier_02b' },
    { coords = vector3(285.28, -355.78, 45.13), heading = 0, length = 200, width = 200, model = 'prop_sec_barier_02a' },
}

-- You may add more than 2 selections and it will bring up a menu for the player to select which floor be sure to label each section though
Config.Teleports = {
    [1] = {                   -- Elevator @ labs
        [1] = {               -- up
            poly = { coords = vector3(3540.74, 3675.59, 20.99), heading = 167.5, length = 2, width = 2 },
            allowVeh = false, -- whether or not to allow use in vehicle
            label = false     -- set this to a string for a custom label or leave it false to keep the default. if more than 2 options, label all options

        },
        [2] = { -- down
            poly = { coords = vector3(3540.74, 3675.59, 28.11), heading = 172.5, length = 2, width = 2 },
            allowVeh = false,
            label = false
        }
    },
    [2] = { --Coke Processing Enter/Exit
        [1] = {
            poly = { coords = vector3(909.49, -1589.22, 30.51), heading = 92.24, length = 2, width = 2 },
            allowVeh = false,
            label = '[E] Enter Coke Processing'
        },
        [2] = {
            poly = { coords = vector3(1088.81, -3187.57, -38.99), heading = 181.7, length = 2, width = 2 },
            allowVeh = false,
            label = '[E] Leave'
        }
    }
}

Config.CarWash = {
    dirtLevel = 0.1,                                                                                   -- threshold for the dirt level to be counted as dirty
    defaultPrice = 20,                                                                                 -- default price for the carwash
    locations = {
        [1] = { coords = vector3(174.81, -1736.77, 28.87), length = 7.0, width = 8.8, heading = 359 }, -- South Los Santos Carson Avenue
        [2] = { coords = vector3(25.2, -1391.98, 28.91), length = 6.6, width = 8.2, heading = 0 },     -- South Los Santos Innocence Boulevard
        [3] = { coords = vector3(-74.27, 6427.72, 31.02), length = 9.4, width = 8, heading = 315 },    -- Paleto Bay Boulevard
        [4] = { coords = vector3(1362.69, 3591.81, 34.5), length = 6.4, width = 8, heading = 21 },     -- Sandy Shores
        [5] = { coords = vector3(-699.84, -932.68, 18.59), length = 11.8, width = 5.2, heading = 0 }   -- Little Seoul Gas Station
    }
}




