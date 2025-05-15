if not lib then return end

-- require 'core.client'

-- require 'locales.en'

-- require 'modules.fishing.client'
-- require 'modules.minigame.client'
-- require 'modules.shop.client'
-- require 'modules.task.client'
-- require 'modules.level.client'
-- require 'modules.rod.client'
-- require 'modules.tackle.client'

-- local Functions = require 'functions'

function client.OpenMenu()
    local fishlist  = ConvertFishlist()
    local shoplist  = ConvertShoplist()
    local tasklist  = ConvertTasklist()
    local infoList  = ConvertInfoList()
    local sellList  = ConvertSellList()
    local levelList = ConvertLevelList()

    Functions.Navigate('home')
    SendNUIMessage({
        action = 'SET_LIST',
        data = {fishList = fishlist, shopList = shoplist, taskList = tasklist, infoList = infoList, sellList = sellList, levelList = levelList}
    })
    local level     = GetCurrentLevel()
    local xp        = GetCurrentXP()
    local maxEXP    = config.levelSystem[level].xp
    local name      = PlayerData.name
    local job       = PlayerData.gradeLabel
    local lastFish  = GetLatestFish()
    local rodLevel  = GetCurrentRodLevel()
    SendNUIMessage({
        action = 'SET_PROFILE',
        data = {level = level, rodLevel = rodLevel, xp = xp, maxEXP = maxEXP, name = name, job = job, lastFish = lastFish}
    })
end
RegisterNetEvent('dusa_fishing:OpenMenu', client.OpenMenu)

function client.CloseMenu()
    Functions.CUI()
end

function client.OpenMinigame()
    Functions.Navigate('miniGame')
end

function ConvertLevelList()
    local LEVELLIST = {}
    for k, v in pairs(config.levelSystem) do
        LEVELLIST[k] = {
            level = v.level,
            xp = v.xp,
            price = v.price
        }
    end
    return LEVELLIST
end

-- translate
CreateThread(function ()
    SetTimeout(2000, function()
        SendNUIMessage({
            action = 'SET_LANGUAGE',
            data = ui_language
        })
    end)
end)