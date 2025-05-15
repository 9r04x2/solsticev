 ----------------------------------------------------------------
----                   DUSADEV.TEBEX.IO                     ----
----------------------------------------------------------------
config = {}
config.debug = false -- For debugging purposes
config.framework = 'auto' -- auto / esx / qb
config.inventory = 'ox_inventory' -- ox_inventory / qb-inventory / qs-inventory / ps-inventory / chezza_inventory / codem-inventory
config.target = 'qb' -- ox / qtarget / qb
--- @param -- Check https://dusa.gitbook.io for documentation

config.HighlightFish = true -- Balık pedini vurgula [Sarı kenarlık]
config.levelSystem = { -- Her seviye için gereken XP
    [1] = {
        level = 1,
        xp = 100,
        price = 100
    },
    [2] = {
        level = 2,
        xp = 500,
        price = 200
    },
    [3] = {
        level = 3,
        xp = 1500,
        price = 300
    },
    [4] = {
        level = 4,
        xp = 2500,
        price = 400
    },
}

--[[
    You can add new items to the shop list here.
    The name option is used to determine the name of the item.
    The description option is used to determine the description of the item.
    The itemCode option is used to determine the item code of the item.
    The price option is used to determine the price of the item.
    The img option is used to determine the image of the item.
    The minLevel option is used to determine the level required to buy the item.
    The type option is used to determine the type of the item. (common, rare, epic, legendary)
]]
config.shop = {
    [1] = {
        name = 'Olta',
        description = 'Balıkçılık seviyenize uygun bir olta satın alın.',
        itemCode = 'rod_2', -- This one doesnt matter for rod, it will be changed by the system. It will automatically replace player rod with player's level rod.
        price = 10,
        img = 'rod_2',
        minLevel = 1,
        type = 'legendary'
    },
    [2] = {
        name = 'Solucan',
        description = 'Küçük balıkları yakalamak için temel bir solucan.',
        itemCode = 'worm',
        price = 5,
        img = 'worm',
        minLevel = 1,
        type = 'common'
    },
    [3] = {
        name = 'Karides Yemi',
        description = 'Daha iyi balıklar yakalamak için bir karides yemi',
        itemCode = 'shrimp_lure',
        price = 10,
        img = 'shrimplure',
        minLevel = 1, 
        type = 'legendary'
    },
    [4] = {
        name = 'Takım Kutusu',
        description = 'Balıklarınızı ve aletlerinizi saklamak için bir takım kutusu',
        itemCode = 'tackle_box',
        price = 50,
        img = 'tackle_box',
        minLevel = 1, 
        type = 'epic'
    },
}

--[[
    You can add new fish species to the fish list here.
    The typeLabel option is used to determine the label of the fish. (COMMON, RARE, EPIC, LEGENDARY)
    The price option is used to determine the sale price of the fish.
    The chance option is used to determine the chance of catching the fish.
    The model option is used to determine the model of the fish.
    The difficulty option is used to determine the difficulty of catching the fish. (easy, medium, hard)
    The xpreward option is used to determine the experience reward for catching the fish.
    The requiredLevel option is used to determine the level required to catch the fish.
    The baits option is used to determine the bait required to catch the fish.
]]
config.fishlbs = false -- Enabling metadata for fish weight, more weight = more money. Disabling this completely removes the weight system. [W.I.P.] WILL BE ADDED WITH 1.2 UPDATE
config.fish = {
    ['mullet'] = {
        name = 'mullet', -- do not change this value
        label = 'Kefal', -- edit this value for shown name at UI
        description = 'Kefal, okyanusta yüzmeyi seven bir balıktır.',
        type = 'common',
        typeLabel = 'COMMON',
        price = 150,
        chance = 70,
        model = 'prop_lm_fish2_medium',
        difficulty = 'easy',
        xpreward = 5,
        requiredLevel = 1,
        baits = { 'worm'} -- Fishing Level 1/4
    },
    ['perch'] = {
        name = 'perch', -- do not change this value
        label = 'Levrek', -- edit this value for shown name at UI
        description = 'Levrek, okyanusta yüzmeyi seven bir balıktır.',
        type = 'common',
        typeLabel = 'COMMON',
        price = 170,
        chance = 70,
        model = 'prop_lm_fish2_small',
        difficulty = 'easy',
        xpreward = 5,
        requiredLevel = 1,
        baits = { 'worm'} -- Fishing Level 1/4
    },
    ['bass'] = {
        name = 'bass', -- do not change this value
        label = 'Büyük Levrek', -- edit this value for shown name at UI
        description = 'Büyük Levrek, okyanusta yüzmeyi seven bir balıktır.',
        type = 'rare',
        typeLabel = 'RARE',
        price = 190,
        chance = 35,
        model = 'prop_lm_fish1_medium',
        difficulty = 'easy',
        xpreward = 10, -- easy / medium / hard
        requiredLevel = 2,
        baits = { 'worm'} -- Fishing Level 1/4
    },
    ['carp'] = {
        name = 'carp', -- do not change this value
        label = 'Sazan balığı', -- edit this value for shown name at UI
        description = 'Sazan balığı, okyanusta yüzmeyi seven bir balıktır.',
        type = 'rare',
        typeLabel = 'RARE',
        price = 200,
        chance = 35,
        model = 'prop_lm_fish5_medium',
        difficulty = 'medium',
        xpreward = 15,
        requiredLevel = 2,
        baits = { 'worm'} -- Fishing Level 1/4
    },
    ['trout'] = {
        name = 'trout', -- do not change this value
        label = 'Alabalık', -- edit this value for shown name at UI
        description = 'Alabalık, okyanusta yüzmeyi seven bir balıktır.',
        type = 'rare',
        typeLabel = 'RARE',
        price = 220,
        chance = 35,
        model = 'prop_lm_fish3_medium',
        difficulty = 'medium',
        xpreward = 5,
        requiredLevel = 2,
        baits = { 'worm'}
    },
    ['tuna'] = {
        name = 'tuna', -- do not change this value
        label = 'Ton balığı', -- edit this value for shown name at UI
        description = 'Ton balığı, okyanusta yüzmeyi seven bir balıktır.',
        type = 'epic',
        typeLabel = 'EPIC',
        price = 250,
        chance = 20,
        model = 'prop_lm_fish4_medium',
        difficulty = 'hard',
        requiredLevel = 3,
        xpreward = 5,
        baits = { 'worm', 'shrimp_lure'}
    },
    ['crab'] = {
        name = 'crab', -- do not change this value
        label = 'Yengeç', -- edit this value for shown name at UI
        description = 'Yengeç, okyanusta yüzmeyi seven bir balıktır.',
        type = 'epic',
        typeLabel = 'EPIC',
        price = 300,
        chance = 15,
        model = 'prop_lm_crab_medium',
        difficulty = 'hard',
        requiredLevel = 3,
        xpreward = 5,
        baits = { 'worm', 'shrimp_lure'}
    },
    ['lobster'] = {
        name = 'lobster', -- do not change this value
        label = 'Istakoz', -- edit this value for shown name at UI
        description = 'Istakoz, okyanusta yüzmeyi seven bir balıktır.',
        type = 'legendary',
        typeLabel = 'LEGENDARY',
        price = 320,
        chance = 10,
        model = 'prop_lm_lobster_medium',
        difficulty = 'hard',
        xpreward = 5,
        requiredLevel = 4,
        baits = { 'worm', 'shrimp_lure'}
    },
    ['turtle'] = {
        name = 'turtle', -- do not change this value
        label = 'Kaplumbağa', -- edit this value for shown name at UI
        description = 'Kaplumbağa, okyanusta yüzmeyi seven bir balıktır.',
        type = 'legendary',
        typeLabel = 'LEGENDARY',
        price = 350,
        chance = 8,
        model = 'prop_lm_turtle',
        difficulty = 'hard',
        xpreward = 5,
        requiredLevel = 4,
        baits = { 'illegalbait'}
    },
    ['octopus'] = {
        name = 'octopus', -- do not change this value
        label = 'Ahtapot', -- edit this value for shown name at UI
        description = 'Ahtapot, okyanusta yüzmeyi seven bir balıktır.',
        type = 'legendary',
        typeLabel = 'LEGENDARY',
        price = 500,
        chance = 7,
        model = 'prop_lm_octopus',
        difficulty = 'hard',
        xpreward = 5,
        requiredLevel = 4,
        baits = { 'illegalbait'}
    },
}

--[[
    prop_lm_fishing_rod1 -> red
    prop_lm_fishing_rod2 -> blue
    prop_lm_fishing_rod3 -> black
    prop_lm_fishing_rod4 -> yellow
]]
config.fishingRods = {
    { item = 'rod_1', model = 'prop_lm_fishing_rod2', minLevel = 1 },
    { item = 'rod_2', model = 'prop_lm_fishing_rod4', minLevel = 2 },
    { item = 'rod_3', model = 'prop_lm_fishing_rod3', minLevel = 3 },
    { item = 'rod_4', model = 'prop_lm_fishing_rod1', minLevel = 4 },
}

--[[
    You can add new baits to the bait list here.
    The price option is used to determine the price of the bait.
    The minLevel option is used to determine the level required to use the bait.
    The increase option is used to determine the increase in the chance of catching fish.
]]
config.baits = {
    ["worm"] = { item = 'worm', price = 5, minLevel = 1, increase = 0.5},
    ["shrimp_lure"] = { item = 'shrimp_lure', price = 100, minLevel = 2, increase = 5.0 },
    ["illegalbait"] = { item = 'illegalbait', price = 300, minLevel = 3, increase = 15.0 },
}

--[[
    You can add tasks to the task list here.
    The taskDetails option is used to determine the type of task and which fish type is required.
    The goal option is used to determine the number of fish to be caught.
    The current option is used to determine the number of fish caught. So dont change it, otherwise it will set all players current progress to another value.
    
    Adding New Task Type:
    If you want to add a new task type, follow this path: 'modules/task/customize.lua'. 
    Inside customize.lua, you will encounter an event triggered every time a fish is caught. 
    You can use these parameters to create new task types of your choice.
]]
config.taskList = {
    [1] = {
        taskTitle = '5 Kefal Yakala',
        taskDescription = '5 Kefal Yakala',
        reward = 400, -- Experience reward
        taskDetails = {
            type = 'catch', -- Type of task
            fish = 'mullet' -- Fish type required for task
        },
        goal = 5, -- Number of fish required for task
        current = 0 -- Player current progress (DONT CHANGE IT)
    },
    [2] = {
        taskTitle = '5 Levrek Yakala',
        taskDescription = '5 Levrek Yakala',
        reward = 400,
        taskDetails = {
            type = 'catch',
            fish = 'bass'
        },
        goal = 5,
        current = 0
    },
    [3] = {
        taskTitle = '5 Ton Balığı Yakala',
        taskDescription = '5 Ton Balığı Yakala',
        reward = 400,
        taskDetails = {
            type = 'catch',
            fish = 'tuna'
        },
        goal = 5,
        current = 0
    },
    [4] = {
        taskTitle = '5 Istakoz Yakalayın',
        taskDescription = '5 Istakoz Yakalayın',
        reward = 400,
        taskDetails = {
            type = 'catch',
            fish = 'lobster'
        },
        goal = 5,
        current = 0
    }
}

--[[
    You determine the texts in the information tab located at the top right of the menu in this area.
]]
config.infoList = {
    [1] = {
        title = 'Yem Talimatları',
        category = 'YEMLER',
        description = 'Yemler balıkları çekmek için kullanılır. Her yemin balıklar üzerinde farklı bir etkisi vardır. Yem ne kadar iyi olursa, yakalayabileceğiniz balık o kadar iyi olur.',
    },
    [2] = {
        title = 'Olta Talimatları',
        category = 'OLTALAR',
        description = 'Her oltanın kendi seviyesi ve farklı türleri vardır. Daha yüksek seviyeli olta, daha iyi balıklar anlamına gelir. Ancak dikkat edin, seviye arttıkça benzersiz balıklar için zorluk seviyesi de artar.',
    },
    [3] = {
        title = 'Olta nasıl yükseltilir?',
        category = 'OLTALAR',
        description = 'Olta seviyeleri, tamamen balıkçılık seviyenizle aynıdır. Eğer 2. seviyedeyseniz, 2. seviye olta kullanabilirsiniz. Oltanızı mağazadan satın alabilirsiniz. Oltanızı yükseltmek istiyorsanız, balıkçılık seviyenizi artırmanız gerekir.',
    },
    [4] = {
        title = 'Neden görevler var?',
        category = 'GÖREVLER',
        description = 'Balıkçılık görevleri, tamamlayarak XP ödülleri kazanabileceğiniz zorluklardır.',
    },
    [5] = {
        title = 'Görevler nasıl tamamlanır?',
        category = 'GÖREVLER',
        description = 'Bir görevi tamamlamak için gerekli sayıda balık tutmanız gerekir. İlerlemeyi görev listesinde takip edebilirsiniz. Tüm ilerlemeyi tamamladıktan sonra, göreve tıklayıp XP ödülünüzü alabilirsiniz.',
    },
    [6] = {
        title = 'Balıkçılık Seviyesi Nedir?',
        category = 'SEVİYE',
        description = 'Balıkçılık seviyesi, bir balıkçı olarak ilerlemenizi gösterir. Seviyeniz ne kadar yüksekse, o kadar iyi balıklar ve oltalar elde edersiniz.',
    },
    [7] = {
        title = 'Nasıl seviye atlanır?',
        category = 'SEVİYE',
        description = 'Bir sonraki seviyeye geçmek için yeterli deneyime sahipseniz, XP çubuğuna tıklayarak kolayca seviyenizi artırabilirsiniz.',
    },
    [8] = {
        title = 'Bölgeler Hakkında Bilgi Edinme',
        category = 'BÖLGELER',
        description = 'Balıkçılık bölgeleri, balık tutabileceğiniz alanlardır. Her bölge, farklı balık görevlerine sahiptir.',
    },
}


--[[
    The fishing zones are listed here. 
    If you want to add a new fishing zone, you can add it here.
    minLevel option filters people who can fish at the level in the area. 
    includeOutside option allows you to regulate whether fish species that are available everywhere will also appear in this area. 
    With the fishList option, you can specify only the fish that will appear in this area.
]]
config.debugzone = false
config.fishingZones = {
    {
        blip = {
            enabled = false,
            name = 'Iskele',
            sprite = 317,
            color = 56,
            scale = 0.6
        },
        locations = {
            vec3(-837.6635, -1341.0834, 5.0005), 
        },
        radius = 120.0,
        minLevel = 1,
        includeOutside = true,
        message = { enter = 'Balıkçılığı bölgesine girdiniz.', exit = 'Balıkçılık bölgesini terk ettiniz.' },
        fishList = { 'bass', 'crab', 'trout' }
    },

    {
        blip = {
            enabled = false,
            name = 'Kumlu İskele',
            sprite = 317,
            color = 24,
            scale = 0.6
        },
        locations = {
            vec3(713.43, 4093.02, 34.73),
        },
        radius = 250.0,
        minLevel = 2,
        includeOutside = true,
        message = { enter = 'Kumlu iskele balıkçılık bölgesine girdiniz..', exit = 'Kumlu iskele balıkçılık bölgesini terk ettiniz..' },
        fishList = { 'trout', 'tuna' }
    },

    {
        blip = {
            enabled = false,
            name = 'Yasadışı Balıkçılık',
            sprite = 317,
            color = 56,
            scale = 0.6
        },
        locations = {
            vec3(2754.04, -1502.44, 1.16), 
        },
        radius = 75.0,
        minLevel = 4,
        includeOutside = true,
        message = { enter = 'Yasadışı bir giriş yaptınız.', exit = 'Yasadışı işlerden ayrıldınız..' },
        fishList = { 'turtle', 'octopus' }
    },

    {
        blip = {
            enabled = false,
            name = 'Istakoz Yuvası',
            sprite = 317,
            color = 56,
            scale = 0.6
        },
        locations = {
            vec3(-962.8201, -1456.9215, 1.3933),
        },
        radius = 20.0,
        minLevel = 4,
        includeOutside = true,
        message = { enter = 'Bir ıstakoz yuvasına girdiniz..', exit = 'Istakoz Yuvasından ayrıldınız..' },
        fishList = { 'lobster' }
    },
}

--[[
    The fish species that can be caught in any area are listed here. 
    If you do not want the fish listed here to appear in special areas, disable the `includeOutside` option in that area
]]
config.outside = {
    fishList = {
        'mullet',
        'perch',
    }
}

config.ped = {
    model = `s_m_y_robber_01`, -- ped model
    buyAccount = 'money', -- accounts: money, bank
    sellAccount = 'money', -- accounts: money, bank
    blip = {
        name = 'Balıkçılık', -- blip name
        sprite = 356,
        color = 74,
        scale = 0.75
    },

    locations = {
        vector4(-840.8867, -1332.6449, 5.0002, 289.2888) 
    }
}