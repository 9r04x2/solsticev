Framework = {}
if GetResourceState('qb-core') ~= 'missing' then
    Framework = exports['qb-core']:GetCoreObject()
    Framework.RegisterServerCallback = Framework.Functions.CreateCallback
    Framework.TriggerServerCallback = Framework.Functions.TriggerCallback
    Framework.GetPlayerFromId = Framework.Functions.GetPlayer
    Framework.GetPlate = Framework.Functions.GetPlate
    Framework.Trim = Framework.Functions.Trim
    Framework.DrawText3D = Framework.Functions.DrawText3D
    Framework.GetPlayerData = Framework.Functions.GetPlayerData
    Framework.RegisterUsableItem = Framework.Functions.CreateUseableItem
    
    Framework.GetPlayer = function(source)
        local xPlayer = Framework.Functions.GetPlayer(source)
        while xPlayer == nil do
            Citizen.Wait(100)
            xPlayer = Framework.Functions.GetPlayer(source)
        end
        xPlayer.jobName = xPlayer.PlayerData.job.name
        xPlayer.name = xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname
        xPlayer.identifier = xPlayer.PlayerData.citizenid
        xPlayer.money = xPlayer.PlayerData.money.cash
        xPlayer.bank = xPlayer.PlayerData.money.bank
        xPlayer.birthdate = xPlayer.PlayerData.charinfo.birthdate or "00-00-0000"
        xPlayer.gender = xPlayer.PlayerData.charinfo.gender or 0

        xPlayer.removeInventoryItem = xPlayer.Functions.RemoveItem 
        return xPlayer
    end

    Framework.RemoveFromBank = function(src, amount)
        local xPlayer = Framework.GetPlayer(src)
        xPlayer.Functions.RemoveMoney('bank', amount)
    end

    Framework.RemoveMoney = function(src, amount)
        local xPlayer = Framework.GetPlayer(src)
        xPlayer.Functions.RemoveMoney('cash', amount)
    end

    Framework.AddBank = function(src, amount)
        local xPlayer = Framework.GetPlayer(src)
        xPlayer.Functions.AddMoney('bank', amount)
    end

    Framework.GetItem = function(src, item)
        local xPlayer = Framework.GetPlayer(src)
        return xPlayer.Functions.GetItemByName(item)
    end



    Framework.GetClosestPlayer = Framework.Functions.GetClosestPlayer 
    Framework.GetClosestVehicle = Framework.Functions.GetClosestVehicle

    Framework.F = 'QB'
 
else
    Framework = exports["es_extended"]:getSharedObject()
    Framework.RegisterServerCallback = Framework.RegisterServerCallback
    Framework.TriggerServerCallback = Framework.TriggerServerCallback
    Framework.GetPlayerFromId = Framework.GetPlayerFromId
    Framework.Trim = Framework.Math.Trim

    Framework.GetPlayerData = Framework.GetPlayerData
    Framework.RegisterUsableItem = Framework.RegisterUsableItem
    
    Framework.GetPlayer = function(source)
        local xPlayer = Framework.GetPlayerFromId(source)
        while xPlayer == nil do
        
            Citizen.Wait(100)
            xPlayer = Framework.GetPlayerFromId(source)
        end
        xPlayer.jobName = xPlayer.getJob().name
        xPlayer.name = xPlayer.getName()
        xPlayer.identifier = xPlayer.identifier or xPlayer.getIdentifier()
        xPlayer.money = xPlayer.getMoney()
        xPlayer.bank = xPlayer.getAccount('bank').money
        xPlayer.removeInventoryItem = xPlayer.removeInventoryItem
        return xPlayer
    end

    Framework.RemoveFromBank = function(src, amount)
        local xPlayer = Framework.GetPlayer(src)
        xPlayer.removeAccountMoney('bank', amount)
    end

    Framework.RemoveMoney = function(src, amount)
        local xPlayer = Framework.GetPlayer(src)
        xPlayer.removeMoney(amount)
    end

    Framework.AddBank = function(src, amount)
        local xPlayer = Framework.GetPlayer(src)
        xPlayer.addAccountMoney('bank', amount)
    end

    Framework.GetItem = function(src, item)
        local xPlayer = Framework.GetPlayer(src)
        return xPlayer.getInventoryItem(item)
    end

    Framework.Game = Framework.Game or {}
    Framework.Game.Utils = Framework.Game.Utils or {}
    Framework.GetClosestPlayer = Framework.Game.GetClosestPlayer
    Framework.GetClosestVehicle = Framework.Game.GetClosestVehicle
    Framework.DrawText3D = Framework.Game.Utils.DrawText3D

    Framework.F = 'ESX'
end

_G.QBCore = Framework
_G.ESX = Framework