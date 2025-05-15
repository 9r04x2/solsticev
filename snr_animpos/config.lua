Config = {}

--Set Command Name
Config.CommandName = "animpos"

--Set Max Distance
Config.MaxDistance = 5 --default 5
Config.MaxDistanceNotify = "Mesafe sınırı aşıldı!"

Config.CancelDistance = 1.8 --default 1.8
Config.CancelMaxDistance = "Konumlandırmayı bozmak için konumlandırıldığınız yerde olmanız gerekir!"

--Set Notify lang.
Config.AlreadyPosing = "Bunu zaten yapıyorsun!"
Config.AlreadyFinishPosing = "Bunu yapmadan önce pozu bozmalısın!"
Config.isnotanim = "Kullanmak için animasyon yapmanız gerekir!"

--SYNC Optimization
Config.SyncOpt = 100 --default 100 (if you have a high number of players, it is recommended to increase the number. (estimated over 200))

Config.Transparency = true --default true

function Notify(text)

    -- default
    -- BeginTextCommandThefeedPost('STRING')
    -- AddTextComponentSubstringPlayerName(text)
    -- EndTextCommandThefeedPostTicker(0,1)

    --  pNotify
    -- exports.pNotify:SendNotification({text = text})

    --QBCORE
    local QBCore = exports['qb-core']:GetCoreObject()
    QBCore.Functions.Notify(text, "error")

    --[[ ESX
    ESX = nil

    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(30)
        end
    end) ]]
    --ESX.ShowHelpNotification(text)
end


function isanimcheck() -- Please edit this function to cooperate with your animation script. 
    -- If you will leave it as is, players can edit their position not only while playing an animation

    -- If you are having issues with the function, please reach out on our Discord server for support by opening a ticket.

    return true -- COMMENT OR REMOVE THIS IF you are USING ONE OF THE CONFIGURATIONS below

    -- Example configurations - uncomment one of them if you have done everything correctly.

    -- return exports.rpemotes:IsPlayerInAnim() -- rpemotes (out of the box NEWEST VERSION)
    -- return exports['esx_animations']:isInAnim() -- esx_animations (read below)
    -- return exports.dpemotes:isInAnim() -- dpemotes (read below)

    -- IF YOU ARE USING dpemotes: Paste this code uncommented in client/Emote.lua

    -- exports('isInAnim', function()
    --     return IsInAnimation 
    -- end)

    -- IF YOU ARE USING esx_animations: Paste this code uncommented in client/main.lua

    -- exports('isInAnim', function()
    --     return inAnim 
    -- end)
end