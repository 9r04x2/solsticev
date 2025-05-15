local QBCore = exports['qb-core']:GetCoreObject()
local lastVehicles = {}
local isClear = false


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	local PlayerJob = QBCore.Functions.GetPlayerData().job.name
	if PlayerJob == 'police' or PlayerJob == 'sheriff' or PlayerJob == "state" or PlayerJob == "ranger" or PlayerJob == "sahp" or PlayerJob == "vpd" or PlayerJob == 'ambulance' or PlayerJob == 'state' or PlayerJob == 'doj' or PlayerJob == 'davison' or PlayerJob == 'pbso' then
		isClear = true
	end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function()
	local PlayerJob = QBCore.Functions.GetPlayerData().job.name
	if PlayerJob == 'police' or PlayerJob == 'sheriff' or PlayerJob == "state" or PlayerJob == "ranger" or PlayerJob == "sahp" or PlayerJob == "vpd" or PlayerJob == 'ambulance' or PlayerJob == 'state' or PlayerJob == 'doj' or PlayerJob == 'davison' or PlayerJob == 'pbso'  then
		isClear = true
	else
		isClear = false
	end
end)

local notifIn = false
local notifOut = false

CreateThread(function()
	if Config['SAFEZONE'] then
		-- for k, v in pairs(Config['zone']) do
		-- 	blip = AddBlipForRadius(v.x, v.y, v.z, v.radio)
		-- 	SetBlipHighDetail(blip, true)
		-- 	SetBlipColour(blip, 2)
		-- 	SetBlipAlpha (blip, 128)
		-- end
	end
	while true do
		local sleep = 1000
		local player = PlayerPedId()
		local plyCoords = GetEntityCoords(player)
		for k, v in pairs(Config["zone"]) do
			local dist = #(plyCoords - vector3(v.x, v.y, v.z))
			if dist <= v.radio then
				sleep = 5
				if not isClear then
					if dist <= v.radio then
						if not notifIn then
							notifIn = true
							notifOut = false
						end
					else
						if not notifOut then
							notifOut = true
							notifIn = false
						end
					end
					if notifIn then
						DisableControlAction(2, 37, true)
						DisableControlAction(0, 106, true)
						DisableControlAction(0, 44, true)
						DisableControlAction(0, 140, true)
						DisableControlAction(0, 25, true)
						DisablePlayerFiring(player, true)
						N_0x4757f00bc6323cfe(-1553120962, 0.0)
						veh = GetGamePool('CVehicle')
						SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true) 
						for k,v in pairs(veh) do
							SetEntityNoCollisionEntity(v, PlayerPedId(), true)
						end
					end
				end
			end
		end
		Wait(sleep)
	end
end)

CreateThread(function()
    while true do
        Wait(100)
        DisableControlAction(1, 140, true)
        if not IsPlayerTargettingAnything(PlayerId()) then
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

