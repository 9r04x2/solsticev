
if Config.Framework == "qbcore" then
	QBCore = exports[Config.QBCoreName]:GetCoreObject()
elseif Config.Framework == "esx" then
	if Config.IsESXLegacy then
		ESX = exports[Config.ESXLegacyName]:getSharedObject()
	else
		ESX = nil
		CreateThread(function()
			while ESX == nil do
				TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
				Citizen.Wait(0)
			end
		end)
	end
end

function Notify(msg, type)
	if (Config.Framework == "qbcore") and (QBCore ~= nil) then -- Notification for QBCore Framework
		local notif = "success"
		if type == 2 then
			notif = "error"
		end
		QBCore.Functions.Notify(msg, notif, 5000)
	elseif (Config.Framework == "esx") and (ESX ~= nil) then -- Notification for ESX Framework
		local notif = "~g~"
		if type == 2 then
			notif = "~r~"
		end
		ESX.ShowNotification(notif..""..msg)
	else -- Notification for Standalone Framework
		local notif = "~g~"
		if type == 2 then
			notif = "~r~"
		end
		SetNotificationTextEntry('STRING')
		AddTextComponentSubstringPlayerName(notif..""..msg)
		DrawNotification(false, true)
	end
end

RegisterNetEvent("dz-drone:client:Notify", function(msg, type)
	Notify(msg, type)
end)

RegisterNetEvent("dz-drone:client:InitiateDrone", function()
	InitiateDrone({
		speed		= 2,							-- Drone movement speed - usage: 2.5 / 15 / 100
		range		= 350,							-- Drone max range length before loses signal - usage: 100 / 350 / 1000
		sphere		= true,							-- Drone max range zone red walls sphere - usage: true / false
		health		= 100,							-- Drone health value - usage: 50 / 100 / 250 or "false" if you don't want the drone to have health (invincible)
		explode		= false,						-- Drone explode when its health reaches 0 - usage: true / false
		heatvision	= false,						-- Drone has heatvision option - usage: true / false
		nightvision	= false,						-- Drone has nightvision option - usage: true / false
		spotlight	= false,						-- Drone has spotlight - usage: true / false
		sound		= true,							-- Drone make sound - usage: true / false
		scanner		= false,						-- Using players scanner - usage: true / false
		release		= false,						-- Release Drone option - keep the drone running in air, disconnect from it the reconnect - usage: true / false
		soundboard	= false,						-- Soundboard option - drone has the ability to play sound files - usage: true / false
		item		= 'drone',						-- Inventory item name, used to return the item name after the drone is stopped
		model		= 'ch_prop_casino_drone_02a',	-- Drone object model, you can change it to any addon drone model
	})
end)

RegisterNetEvent("dz-drone:client:InitiateDroneLSPD", function()
	InitiateDrone({
		speed		= 4,							-- Drone movement speed - usage: 2.5 / 15 / 100
		range		= 600,							-- Drone max range length before loses signal - usage: 100 / 350 / 1000
		sphere		= true,							-- Drone max range zone red walls sphere - usage: true / false
		health		= 500,							-- Drone health value - usage: 50 / 100 / 250 or "false" if you don't want the drone to have health (invincible)
		explode		= true,							-- Drone explode when its health reaches 0 - usage: true / false
		heatvision	= true,							-- Drone has heatvision option - usage: true / false
		nightvision	= true,							-- Drone has nightvision option - usage: true / false
		spotlight	= true,							-- Drone has spotlight - usage: true / false
		sound		= true,							-- Drone make sound - usage: true / false
		scanner		= true,							-- Using players scanner - usage: true / false
		release		= true,							-- Release Drone option - keep the drone running in air, disconnect from it the reconnect - usage: true / false
		soundboard	= true,							-- Soundboard option - drone has the ability to play sound files - usage: true / false
		item		= 'drone_lspd',					-- Inventory item name, used to return the item name after the drone is stopped
		model		= 'ch_prop_casino_drone_02a',	-- Drone object model, you can change it to any addon drone model
	})
end)

RegisterNetEvent('dz-drone:client:OnDroneSpawned', function(drone) -- Event triggered when drone has been spawned
	TriggerServerEvent('dz-drone:server:DoSyncDrone', ObjToNet(drone))
end)

RegisterNetEvent('dz-drone:client:DoSyncDrone', function(drone)
	local Drone = NetToObj(drone)
	if DoesEntityExist(Drone) then
		SetEntityLodDist(Drone, 9999)
	end
end)

RegisterNetEvent('dz-drone:client:OnDroneStopped', function(type, item) -- Event triggered when drone has been stopped
	if type == 'destroyed' then -- you functions here when the drone is destroyed
		Notify('The drone destroyed', 2)
		TriggerServerEvent('dz-drone:server:RemoveItem', item) -- Remove The Drone from inventory
	elseif type == 'exploded' then -- you functions here when the drone is exploded
		Notify('The drone exploded', 2)
		TriggerServerEvent('dz-drone:server:RemoveItem', item) -- Remove The Drone from inventory
	elseif type == 'signallost' then -- you functions here when the drone's signal is lost
		Notify('The drone signal is lost', 2)
		TriggerServerEvent('dz-drone:server:RemoveItem', item) -- Remove The Drone from inventory
	elseif type == 'playerdied' then -- you functions here when the player die
		Notify('Player Died, The drone is lost', 2)
	else -- you functions here when the drone is canceled
		Notify('Drone canceled', 2)
	end
end)

RegisterCommand('dronefix', function(source,args)
	StopDrone() -- You can use this function to stop the drone. for example when player die
end)

CreateThread(function()
	while true do
		Wait(500)
		if (Drones ~= nil) and (Drones.DroneObj ~= nil) and (DoesEntityExist(Drones.DroneObj)) then
			local IsTouchingEntity = false
			for k,v in pairs(GetActivePlayers()) do
				local Ped = GetPlayerPed(v)
				if (IsEntityTouchingEntity(Drones.DroneObj, Ped)) and (Ped ~= PlayerPedId()) then
					IsTouchingEntity = true
				end
			end
			if IsTouchingEntity then
				SetEntityHealth(Drones.DroneObj, GetEntityHealth(Drones.DroneObj) - 5)
			end
		end
	end
end)

-------------------------------------------------------------------------------------
----------------------------------- Test Command ------------------------------------
--------------- You can comment it or remove it if you use UsableItem ---------------

-- RegisterCommand('drone', function(source, args)
-- 	local Argument = tonumber(args[1])
-- 	if (Argument == nil) or (Argument == 1) then	-- Command: /drone or /drone 1
-- 		InitiateDrone({
-- 			speed		= 2,		-- Drone movement speed - usage: 2.5 / 15 / 100
-- 			range		= 350,		-- Drone max range length before loses signal - usage: 100 / 350 / 1000
-- 			sphere		= true,		-- Drone max range zone red walls sphere - usage: true / false
-- 			health		= 100,		-- Drone health value - usage: 50 / 100 / 250 or "false" if you don't want the drone to have health (invincible)
-- 			explode		= false,	-- Drone explode when its health reaches 0 - usage: true / false
-- 			heatvision	= false,	-- Drone has heatvision option - usage: true / false
-- 			nightvision	= false,	-- Drone has nightvision option - usage: true / false
-- 			spotlight	= false,	-- Drone has spotlight - usage: true / false
-- 			sound		= true,		-- Drone make sound - usage: true / false
-- 			scanner		= false,	-- Using players scanner - usage: true / false
-- 			release		= false,	-- Release Drone option - keep the drone running in air, disconnect from it the reconnect - usage: true / false
-- 			soundboard	= false,		-- Soundboard option - drone has the ability to play sound files - usage: true / false
-- 		})
-- 	elseif (Argument == 2) then		-- Command: /drone 2
-- 		InitiateDrone({
-- 			speed		= 4,		-- Drone movement speed - usage: 2.5 / 15 / 100
-- 			range		= 600,		-- Drone max range length before loses signal - usage: 100 / 350 / 1000
-- 			sphere		= true,		-- Drone max range zone red walls sphere - usage: true / false
-- 			health		= 500,		-- Drone health value - usage: 50 / 100 / 250 or "false" if you don't want the drone to have health (invincible)
-- 			explode		= true,		-- Drone explode when its health reaches 0 - usage: true / false
-- 			heatvision	= true,		-- Drone has heatvision option - usage: true / false
-- 			nightvision	= true,		-- Drone has nightvision option - usage: true / false
-- 			spotlight	= true,		-- Drone has spotlight - usage: true / false
-- 			sound		= true,		-- Drone make sound - usage: true / false
-- 			scanner		= true,		-- Using players scanner - usage: true / false
-- 			release		= true,		-- Release Drone option - keep the drone running in air, disconnect from it the reconnect - usage: true / false
-- 			soundboard	= true,		-- Soundboard option - drone has the ability to play sound files - usage: true / false
-- 		})
-- 	end
-- end)