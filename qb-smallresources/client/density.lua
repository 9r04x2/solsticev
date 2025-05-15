
-- Density = {
--     parked = 5,
--     vehicle = 2.1,
--     multiplier = 0.1,
--     peds = 0.5,
--     scenario = 0.2
-- }

-- local npcActive = false


-- RegisterNetEvent('set-npc')
-- AddEventHandler('set-npc', function(bool)
-- 	npcActive = bool
-- end)

-- Density = {
--     parked = 0.2,
--     vehicle = 1.1,
--     multiplier = 0.1,
--     peds = 1.15,
--     scenario = 2.5
-- }




-- -- CreateThread(function()
-- --     while true do
-- --         if npcActive then 
-- --             SetParkedVehicleDensityMultiplierThisFrame(Density.parked)
-- --             SetVehicleDensityMultiplierThisFrame(0.0)
-- --             SetRandomVehicleDensityMultiplierThisFrame(Density.multiplier)
-- --             SetPedDensityMultiplierThisFrame(Density.peds)
-- --             SetScenarioPedDensityMultiplierThisFrame(Density.scenario, Density.scenario) -- Walking NPC Density
-- --         else
-- --             SetParkedVehicleDensityMultiplierThisFrame(Density.parked)
-- --             SetVehicleDensityMultiplierThisFrame(Density.vehicle)
-- --             SetRandomVehicleDensityMultiplierThisFrame(Density.multiplier)
-- --             SetPedDensityMultiplierThisFrame(Density.peds)
-- --             SetScenarioPedDensityMultiplierThisFrame(Density.scenario, Density.scenario) -- Walking NPC Density
-- --         end
-- --         Wait(0)
-- --     end
-- -- end)


-- CreateThread(function()
--     while true do 
--         SetParkedVehicleDensityMultiplierThisFrame(1.0)
--         SetVehicleDensityMultiplierThisFrame(1.0)
--         SetRandomVehicleDensityMultiplierThisFrame(1.0)
--         SetPedDensityMultiplierThisFrame(1.0)
--         SetScenarioPedDensityMultiplierThisFrame(1.0) -- Walking NPC Density
--         Wait(0)
--     end
-- end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Wait(0)
--         SetRandomTrains(EnableTrains)
-- 		SetRandomBoats(false)
--         DisablePlayerVehicleRewards(PlayerId())   
-- 		SetGarbageTrucks(false)
-- 		SetCreateRandomCops(false)
-- 		SetCreateRandomCopsNotOnScenarios(false)
-- 		SetCreateRandomCopsOnScenarios(false)
--     	SetVehicleModelIsSuppressed(GetHashKey("rubble"), true)
--         SetVehicleModelIsSuppressed(GetHashKey("airbus"), true)
--         SetVehicleModelIsSuppressed(GetHashKey("trash"), true)
--         SetVehicleModelIsSuppressed(GetHashKey("trash2"), true)
--         SetVehicleModelIsSuppressed(GetHashKey("coach"), true)
--         SetVehicleModelIsSuppressed(GetHashKey("tourbus"), true)
--     	SetVehicleModelIsSuppressed(GetHashKey("bus"), true)
--     	SetVehicleModelIsSuppressed(GetHashKey("dump"), true)
--     	SetVehicleModelIsSuppressed(GetHashKey("taco"), true)
--     	SetVehicleModelIsSuppressed(GetHashKey("biff"), true)
--     	SetVehicleModelIsSuppressed(GetHashKey("blimp"), true)
-- 		SetVehicleModelIsSuppressed(GetHashKey("boxville5"), true)
--     	SetVehicleModelIsSuppressed(GetHashKey("technical"), true)
-- 		SetVehicleModelIsSuppressed(GetHashKey("ninef"), true)
-- 		SetVehicleModelIsSuppressed(GetHashKey("comet"), true)
-- 		SetVehicleModelIsSuppressed(GetHashKey("bullet"), true)
-- 		SetVehicleModelIsSuppressed(GetHashKey("carbonizzare"), true)
-- 		SetVehicleModelIsSuppressed(GetHashKey("neon"), true)
-- 		SetVehicleModelIsSuppressed(GetHashKey("tropos"), true)
--         local x = -1170.76
-- 		local y = -878.73
-- 		local z = 14.14
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 20, y - 20, z - 20, x + 20, y + 20, z + 20)

--         RemoveVehiclesFromGeneratorsInArea(-724.46 - 300.0, -1444.03 - 300.0, 5.0 - 300.0, -724.46 + 300.0, -1444.03 + 300.0, 5.0 + 300.0)

--         local x = -505.48
-- 		local y = -1080.15
-- 		local z = 23.18
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 20, y - 20, z - 20, x + 20, y + 20, z + 20)

--         local x = -525.24
-- 		local y = -1118.45
-- 		local z = 21.74 
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 20, y - 20, z - 20, x + 20, y + 20, z + 20)

--         local x = -543.72
-- 		local y = -1049.04
-- 		local z = 22.62
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 20, y - 20, z - 20, x + 20, y + 20, z + 20)

--         local x = -1110.82
-- 		local y = -809.05
-- 		local z = 17.47
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 20, y - 20, z - 20, x + 20, y + 20, z + 20)
-- 		-- tequila -556.81, 285.076, 82.1801
-- 		local x = -556.81
-- 		local y = 285.076
-- 		local z = 82.1801
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 10, y - 10, z - 10, x + 10, y + 10, z + 10)
			
-- 		-- pd
-- 		local x = 441.89
-- 		local y = -991.9
-- 		local z = 29.73
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 50, y - 50, z - 50, x + 50, y + 50, z + 50)
        
--         -- bcso
--         local x = 1843.75
--         local y = 3681.9
--         local z = 48.81
--         ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
--         RemoveVehiclesFromGeneratorsInArea(x - 50, y - 50, z - 50, x + 50, y + 50, z + 50)
	
-- 		-- cardealer
-- 		local x = -41.53
-- 		local y = -1097.93
-- 		local z = 26.42
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 10, y - 10, z - 10, x + 10, y + 10, z + 10)
-- 		--pillbox
-- 		local x = 329.396
-- 		local y = -580.63
-- 		local z = 43.2841
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 20, y - 20, z - 20, x + 20, y + 20, z + 20)
-- 		--bağlanmışlar
-- 		local x = 127.483
-- 		local y = -1072.9
-- 		local z = 29.1923
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 20, y - 20, z - 20, x + 20, y + 20, z + 20)
--         local x = 1837.483
-- 		local y = 3681.9
-- 		local z = 34.1923
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 20, y - 20, z - 20, x + 20, y + 20, z + 20)
--         --coolbean
--         local x = -1201.483
-- 		local y = -1132.9
-- 		local z = 7.1923
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 20, y - 20, z - 20, x + 20, y + 20, z + 20)
--         -- pond
--         local x = 1116.483
-- 		local y = -649.9
-- 		local z = 56.1923
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 20, y - 20, z - 20, x + 20, y + 20, z + 20)
--         -- upnburger
--         local x = 83.91
-- 		local y = 281.24
-- 		local z = 110.21
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 20, y - 20, z - 20, x + 20, y + 20, z + 20)
--         local x = 392.483
-- 		local y = -1621.9
-- 		local z = 29.1923
-- 		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
-- 		RemoveVehiclesFromGeneratorsInArea(x - 20, y - 20, z - 20, x + 20, y + 20, z + 20)
--     end
-- end)

-- local allowpolice = 0
-- local function SetGamePlayVars()
--     Citizen.CreateThread(function()
--         for i = 1, 25 do
--             EnableDispatchService(i, false)
--         end

--         -- enable pvp
--         for i = 0, 255 do
--             if NetworkIsPlayerConnected(i) then
--                 if NetworkIsPlayerConnected(i) and GetPlayerPed(i) ~= nil then
--                     SetCanAttackFriendly(GetPlayerPed(i), true, true)
--                 end
--             end
--         end

--         NetworkSetFriendlyFireOption(true)


        
--         while true do
--             Citizen.Wait(500)

--             local ped = PlayerPedId()
--             local vehicle = GetVehiclePedIsIn(ped, false)            
--             local timer = 0

--             if IsPedInAnyVehicle(ped, false) then
--                 if GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), 0) == ped then
--                     if GetIsTaskActive(ped, 165) then
--                     --    SetPedIntoVehicle(ped, GetVehiclePedIsIn(ped, false), 0)
--                     end
--                 end

--                 timer = 0
--             else
--                 if IsPedWearingHelmet(ped) then
--                     timer = timer + 1

--                     if timer >= 5000 and not IsPedInAnyVehicle(ped, true) then
--                         RemovePedHelmet(ped, false)
--                         timer = 0
--                     end
--                 end
--             end
--         end
--     end)

--     Citizen.CreateThread(function()

--         while true do
--             Wait(2000)

--             local id = PlayerId()
--             if allowpolice == 0 then
--                 SetPlayerWantedLevel(id, 0, false)
--                 SetPlayerWantedLevelNow(id, false)
--             else
--                 if allowpolice == 1 then
--                     for i = 1, 25 do
--                         EnableDispatchService(i, false)
--                     end
--                 else
--                     for i = 1, 25 do
--                         EnableDispatchService(i, true)
--                     end
--                 end

--                 SetPlayerWantedLevel(id, 2, false)
--                 SetPlayerWantedLevelNoDrop(id, 2, false)
--                 SetPlayerWantedLevelNow(id)
--                 print(GetPlayerWantedLevel(id))
--             end
--         end

--     end)
-- end

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(3000)
-- 		local playerPed = PlayerPedId()
-- 		local playerLocalisation = GetEntityCoords(playerPed)
-- 			ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
-- 		end
-- 	end)

-- local gamePlayStarted = false

-- AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
--     if gamePlayStarted then return end
--     gamePlayStarted = true
--     SetGamePlayVars()
--     QBCore.Functions.TriggerCallback('check-npc-on', function(bool)
-- 		npcActive = bool
-- 	end)
-- end)

