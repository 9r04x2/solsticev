-- QBCore = exports['qb-core']:GetCoreObject()

-- AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
--     PlayerData = QBCore.Functions.GetPlayerData()
--     isPlayerWhitelisted = PlayerWhitelisted()
-- end)

-- RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
--     PlayerData = QBCore.Functions.GetPlayerData()
--     isPlayerWhitelisted = PlayerWhitelisted()
-- end)

-- Weapons = {
--     "weapon_beanbagshotgun",
--     "weapon_flashlight",
--     "weapon_glock19gen4",
--     "weapon_stungun",
--     "bodycam",
--     "weapon_nightstick",
--     "gps"
-- }

-- Jobs = {
--   'police',
--     'sheriff',
--     'sasp',
--     'usng',
--     'usarmy',
--     'parkranger',
--     'doj',
--     'gov',
--     'lssp',
--     'lspr',
--     'dsd',
--     'vespuccipd',
--     'bcsd',
--     'pbsd',
--     'weazel',
--     'fbi'
-- }

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(2000)
--         local player = PlayerPedId()
--         if not isPlayerWhitelisted then
--             for k, v in pairs(Weapons) do
--                 local player = PlayerPedId()
--                 local weapon = GetHashKey(v)
--                 if HasPedGotWeapon(player, weapon, false) then
--                     RemoveWeaponFromPed(player, weapon)
--                     TriggerServerEvent('antibadcop:server:RemoveItem', v, 1)
--                     TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[v], 'remove', 1) 
--                 end
--             end
--         end
--     end
-- end)

-- function PlayerWhitelisted()
-- 	for k, v in ipairs(Jobs) do
-- 		if v == PlayerData.job.name then
-- 			return true
-- 		end
-- 	end
-- 	return false
-- end

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
--         local playerPed = PlayerPedId()
--         local vehicle = GetVehiclePedIsIn(playerPed, false)

--         if vehicle ~= 0 and not IsThisModelABicycle(GetEntityModel(vehicle)) then 
--             local weapon = GetSelectedPedWeapon(playerPed)
--             if weapon ~= GetHashKey("WEAPON_UNARMED") then
--                 SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true)
--             end
--         end
--     end
-- end)

