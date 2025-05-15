Config = Config or {}
Locales = Locales or {}

Config.Locales = 'TR'
Config.InteractType = {
    ["textui"]   = { useThis = true },
    ["drawtext"] = { useThis = false },
    ["target"]   = { useThis = false }
}

Config.StashSettings = {
    maxweight = 10000,
    slots = 75
}

Config.Inventory = "new-ox_inventory"
            --[ lj-inventory ]
            --[ ps-inventory ]
            --[ qs-inventory ]
            --[ ox_inventory ]
            --[ new-qb-inventory ]
            --[ new-ox_inventory ]

Config.Locations = {
    [1] = {
        pedSettings = { coord = vector4(-819.4632, -1341.8756, 4.1503, 233.78030), model = "a_m_m_prolhost_01" },
        availableRooms = { 
            type1 = 50, 
            type2 = 50, 
            type3 = 50, 
            type4 = 50, 
            type5 = 50, 
            type6 = 50 
        }
    },
    [2] = {
        pedSettings = { coord = vector4(1728.3417, 3851.7764, 33.7859, 217.5594), model = "a_m_m_prolhost_01" },
        availableRooms = { 
            type1 = 50, 
            type2 = 50, 
            type3 = 50, 
            type4 = 50, 
            type5 = 50, 
            type6 = 50 
        }
    },
}

Config.Types = {
    type1 = {
        roomImage = "https://r2.fivemanage.com/KHKs7RCoDCyKGQ18SjSQh/images/type1.png",
        roomPrice = 100, -- Per Day
        roomLabel = "Simple Room",
        roomShell = "t1_furn_shell",
        doorOffset = vector4(-2.3, 1.5, 0.0, 180.0),
        stashOffset = vector4(2.3, 2.0, 0.25, 180.0),
        clothOffset = vector4(5.3, -1.35, 0.25, 180.0),
    },
    type2 = {
        roomImage = "https://r2.fivemanage.com/KHKs7RCoDCyKGQ18SjSQh/images/type2.png",
        roomPrice = 1000, -- Per Day
        roomLabel = "Classic Room",
        roomShell = "lev_apartment_shell",
        doorOffset = vector4(0.0, -2.5, 0.0, -90.0),
        stashOffset = vector4(-1.0, 2.25, -0.25, -90.0),
        clothOffset = vector4(7.4, 3.25, -0.25, -90.0)
    },
    type3 = {
        roomImage = "https://r2.fivemanage.com/KHKs7RCoDCyKGQ18SjSQh/images/type3.png",
        roomPrice = 5000, -- Per Day
        roomLabel = "Wide Room",
        roomShell = "t2_furn_shell",
        doorOffset = vector4(1.5, 0.0, 0.0, 180.0),
        stashOffset = vector4(1.5, -8.0, 1.0, 180.0),
        clothOffset = vector4(-3.5, -7.0, 1.0, 180.0)
    },
    type4 = {
        roomImage = "https://r2.fivemanage.com/KHKs7RCoDCyKGQ18SjSQh/images/type4.png",
        roomPrice = 10000, -- Per Day
        roomLabel = "Extra Wide Room",
        roomShell = "t3_furn_shell",
        doorOffset = vector4(0.0, 0.5, 0.0, 180.0),
        stashOffset = vector4(0.0, -9.5, 1.0, 180.0),
        clothOffset = vector4(-4.0, -4.5, 1.0, 180.0)
    },
    type5 = {
        roomImage = "https://r2.fivemanage.com/KHKs7RCoDCyKGQ18SjSQh/images/type5.png",
        roomPrice = 750, -- Per Day
        roomLabel = "Standard Room",
        roomShell = "standardmotel_shell",
        doorOffset = vector4(0.0, -2.5, 0.0, -90.0),
        stashOffset = vector4(1.5, -3.5, -1.0, -90.0),
        clothOffset = vector4(1.25, 3.0, -1.0, -90.0)
    },
    type6 = {
        roomImage = "https://r2.fivemanage.com/KHKs7RCoDCyKGQ18SjSQh/images/type6.png",
        roomPrice = 10000, -- Per Day
        roomLabel = "Deluxe Room",
        roomShell = "modernhotel_shell",
        doorOffset = vector4(5.0, 4.0, -1.5, 180.0),
        stashOffset = vector4(6.0, 0.0, -1.0, 180.0),
        clothOffset = vector4(3.0, -4.0, -1.0, 180.0)
    },
}

function Config.Notification(text, server, source)
    if server then
        TriggerClientEvent('esx:showNotification', source, text)
        TriggerClientEvent('QBCore:Notify', source, text)
    else
        TriggerEvent('esx:showNotification', text)
        TriggerEvent('QBCore:Notify', text)
    end
end