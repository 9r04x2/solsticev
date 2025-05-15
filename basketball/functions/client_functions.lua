-- █▀▀ █░█ █▄░█ █▀▀ ▀█▀ █ █▀█ █▄░█ █▀
-- █▀░ █▄█ █░▀█ █▄▄ ░█░ █ █▄█ █░▀█ ▄█

-- Handle player loaded event for ESX
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    Wait(1000)
    AllPropsSpawn()
end)

-- Handle player loaded event for QBCore
RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Wait(1000)
    AllPropsSpawn()
end)

ScreenText = function(type, text)
    if type then 
        lib.showTextUI(text)
    else 
        lib.hideTextUI()
    end
end

notify = function(text)
    exports['ZSX_UIV2']:Notification("Bilgi", Config.Langs[text], "fas fa-info-circle", 5000)
end
