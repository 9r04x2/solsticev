QBCore = exports['qb-core']:GetCoreObject()
    

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
end)

local clientcooldown = GetGameTimer()
local PlayerData = {}

RegisterCommand('+oyuncuara', function()
    TriggerEvent('police:client:RobPlayer')
end)

RegisterKeyMapping('+oyuncuara', 'Oyuncunun Üstünü Ara', 'keyboard', 'g')
