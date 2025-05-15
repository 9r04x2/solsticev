-- -- Please close this file as a comment line if it breaks the npc system on your server. It runs as a zombie thread and uses (0.01ms).

-- local npc = false

-- RegisterNUICallback('g9:npc', function()
--     local admin = lib.callback.await('g9:isAdmin', false)
--     if admin then
--         npc = not npc
--         TriggerServerEvent('g9:setNpc', npc)
--     end
-- end)

-- RegisterNetEvent('g9:setNpc', function(data) 
--     npc = data
--     print(npc)
-- end)

-- RegisterNUICallback('resetNpc', function() 
--     local admin = lib.callback.await('g9:isAdmin', false)
--     if admin then
--         npc = false
--         TriggerServerEvent('g9:setNpc', npc)
--     end
-- end)

-- CreateThread(function() 
--     while true do
--         Wait(1)
--         if npc then
--             SetVehicleDensityMultiplierThisFrame(1.0)
--             SetPedDensityMultiplierThisFrame(1.0)
--             SetRandomVehicleDensityMultiplierThisFrame(1.0)
--             SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
--             SetParkedVehicleDensityMultiplierThisFrame(1.0)
--         else
--             SetVehicleDensityMultiplierThisFrame(0.0)
--             SetPedDensityMultiplierThisFrame(0.0)
--             SetRandomVehicleDensityMultiplierThisFrame(0.0)
--             SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
--             SetParkedVehicleDensityMultiplierThisFrame(0.0)
--         end
--     end
-- end)