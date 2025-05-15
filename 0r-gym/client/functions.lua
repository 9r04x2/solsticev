if Config.FrameWork == "ESX" then
    ESX = Config.FrameWorkExport()
elseif Config.FrameWork == "QBCore" then
    QBCore = Config.FrameWorkExport()
elseif Config.FrameWork == "QBX" then
    sharedConfig = Config.FrameWorkExport()
end


local isRange = false
local weightSelected = false
Citizen.CreateThread(function()
    for k, v in pairs(Config.CustomExercises) do
        if v.propCoords then
            for a, b in pairs(v.propCoords) do
                local model = GetHashKey(k)
                if not HasModelLoaded(model) then
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Citizen.Wait(0)
                    end
                end
                b.object = CreateObject(GetHashKey(k), b.coords.x, b.coords.y, b.coords.z, false, true, false)
                FreezeEntityPosition(b.object, true)
                SetEntityHeading(b.object, b.coords.w)
                SetModelAsNoLongerNeeded(GetHashKey(k))
                SetEntityLodDist(b.object, 40)
                PlaceObjectOnGroundProperly(b.object)
                SetEntityCollision(b.object, false, false)
                if Config.Target then
                    if GetResourceState('ox_target') == 'started' or GetResourceState('pa-target') == 'started' then
                        exports['ox_target']:addLocalEntity(b.object, {
                            [1] = {
                                icon = "fas fa-sign-in-alt",
                                label = "Start Exercise",
                                onSelect = function()
                                    TriggerEvent('s-gym:startExercise', k, "Exercises")
                                end,
                                distance = 3.0
                            }
                        })
                    elseif GetResourceState('qb-target') == 'started' then
                        exports['qb-target']:AddTargetEntity(b.object, {
                            options = {
                                {
                                    icon = "fas fa-sign-in-alt",
                                    label = "Start Exercise",
                                    action = function()
                                        TriggerEvent('s-gym:startExercise', k, "Exercises")
                                    end
                                },
                            },
                            distance = 3.0
                        })
                    end
                end
            end
        end
    end
    if Config.Target then
        if GetResourceState('ox_target') == 'started' or GetResourceState('pa-target') == 'started' then
            for key, benchdata in pairs(Config.CustomExercises) do
                if not benchdata["exerciseCoords"] then return end
                for a, b in pairs(benchdata["exerciseCoords"]) do
                    exports.ox_target:addBoxZone({
                        name = key .. "-" .. b,
                        coords = vector3(b.x, b.y, b.z),
                        size = vec3(1.000000, 1.000000, 3.500000),
                        rotation = benchdata["exerciseHeading"],
                        options = {
                            [1] = {
                                type = "client",
                                event = "Start Exercise".. key,
                                icon = "fas fa-sign-in-alt",
                                label = "Bench Press",
                                onSelect = function()
                                    TriggerEvent('s-gym:startExercise', key, "CustomExercises")
                                end,
                            },
                            [2] = {
                                type = "client",
                                event = "Select Weight",
                                icon = "fas fa-sign-in-alt",
                                label = "Select Weight",
                                onSelect = function()
                                    SetNuiFocus(true, true)
                                    SendNUIMessage({
                                        action = 'SELECT_WEIGHT',
                                    })
                                end,
                            },
                        },
                    })
                end
            end
        elseif GetResourceState('qb-target') == 'started' then
            for key, benchdata in pairs(Config.CustomExercises) do
                if not benchdata["exerciseCoords"] then return end
                for a, b in pairs(benchdata["exerciseCoords"]) do
                    exports['qb-target']:AddBoxZone(key .. "-" .. b, vector3(b.x, b.y, b.z), 2.0, 1, {
                        name = key .. "-" .. b,
                        heading = benchdata["exerciseHeading"],
                        debugPoly = false,
                        minZ= b.z - 2.0,
                        maxZ= b.z + 2.0,
                    }, {
                        options = {
                            {
                                type = "client",
                                event = "Start Exercise".. key,
                                icon = "fas fa-sign-in-alt",
                                label = "Bench Press",
                                action = function()
                                    TriggerEvent('s-gym:startExercise', key, "CustomExercises")
                                end,
                            },
                            {
                                type = "client",
                                event = "Select Weight",
                                icon = "fas fa-sign-in-alt",
                                label = "Select Weight",
                                action = function()
                                    SetNuiFocus(true, true)
                                    SendNUIMessage({
                                        action = 'SELECT_WEIGHT',
                                    })
                                end,
                            },
                        },
                        distance = 2.53
                    })
                end
            end
        end
    else
        while true do
            local sleep = 1000
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            for k, v in pairs(Config.Exercises) do
                local closestObj = GetClosestObjectOfType(pedCoords.x, pedCoords.y, pedCoords.z, 1.2, GetHashKey(k), v.missionEntity or false, 0, 0)
                if closestObj then
                    local closestObjCoords = GetEntityCoords(closestObj)
                    local dist = #(pedCoords - closestObjCoords)
                    if dist <= 1.2 then
                        sleep = 0
                        DrawMarker(20, closestObjCoords.x, closestObjCoords.y, closestObjCoords.z + 0.3, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.15, 0.15, 0.15, 207, 36, 36, 100, false, true, 2, true, nil, nil, false) 
                        if IsControlJustPressed(0, 38) then
                            DisableControlAction(0, 38, true)
                            SetNuiFocus(false, false)
                            if Config.Warm then 
                                sleep = 9000
                            else 
                                sleep = 5000
                            end
                            TriggerEvent('s-gym:startExercise', k, "Exercises")
                        end
                        if IsControlJustPressed(0, 311) then
                            DisableControlAction(0, 311, true)
                            SetNuiFocus(true, true)
                            SendNUIMessage({
                                action = 'SELECT_WEIGHT',
                            })
                        end
                    end
                end
            end
            for k, v in pairs(Config.CustomExercises) do
                if type(v.exerciseCoords) == "table" and v.exerciseCoords then
                    for a, b in pairs(v.exerciseCoords) do
                        local dist = #(pedCoords - vector3(b.x, b.y, b.z))
                        if dist <= 1.2 then
                            sleep = 0
                            DrawMarker(20, b.x, b.y, b.z + 0.1, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.15, 0.15, 0.15, 207, 36, 36, 100, false, true, 2, true, nil, nil, false) 
                            if IsControlJustPressed(0, 38) then
                                DisableControlAction(0, 38, true)
                                SetNuiFocus(false, false)
                                if Config.Warm then 
                                    sleep = 9000
                                else 
                                    sleep = 5000
                                end
                                TriggerEvent('s-gym:startExercise', k, "CustomExercises")
                            end
                            if IsControlJustPressed(0, 311) then
                                DisableControlAction(0, 311, true)
                                SetNuiFocus(true, true)
                                SendNUIMessage({
                                    action = 'SELECT_WEIGHT',
                                })
                            end
                        end
                    end
                elseif v.exerciseCoords then
                    local dist = #(pedCoords - vector3(v.exerciseCoords.x, v.exerciseCoords.y, v.exerciseCoords.z))
                    if dist <= 1.2 then
                        sleep = 0
                        DrawMarker(20, v.exerciseCoords.x, v.exerciseCoords.y, v.exerciseCoords.z + 0.1, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.15, 0.15, 0.15, 207, 36, 36, 100, false, true, 2, true, nil, nil, false) 
                        if IsControlJustPressed(0, 38) then
                            DisableControlAction(0, 38, true)
                            SetNuiFocus(false, false)
                            if Config.Warm then 
                                sleep = 9000
                            else 
                                sleep = 5000
                            end
                            TriggerEvent('s-gym:startExercise', k, "CustomExercises")
                        end
                        if IsControlJustPressed(0, 311) then
                            DisableControlAction(0, 311, true)
                            SetNuiFocus(true, true)
                            SendNUIMessage({
                                action = 'SELECT_WEIGHT',
                            })
                        end
                    end
                end
            end
            Citizen.Wait(sleep)
        end
    end
end)

-- Citizen.CreateThread(function()
--     if Config.Target  then 
--         if Config.Library == "qb" then 
--             for key, benchdata in pairs(Config.Exercises) do
--                 exports['qb-target']:AddBoxZone(key, Config.Exercises[key]["exerciseCoords"], 2.0, 1, {
--                     name = key,
--                     heading = Config.Exercises[key]["exerciseHeading"],
--                     debugPoly = false,
--                     minZ= Config.Exercises[key]["exerciseCoords"][3] - 0.80,
--                     maxZ= Config.Exercises[key]["exerciseCoords"][3] + 0.90,
                
--                 }, {
--                     options = {
--                         {
--                             type = "client",
--                             event = "Start Exercise".. key,
--                             icon = "fas fa-sign-in-alt",
--                             label = "Bench Press",
--                             action = function()
--                                 TriggerEvent('s-gym:startExercise', key, "Exercises")
--                             end,
--                         },
--                         {
--                             type = "client",
--                             event = "Select Weight",
--                             icon = "fas fa-sign-in-alt",
--                             label = "Select Weight",
--                             action = function()
--                                 SetNuiFocus(true, true)
--                                 SendNUIMessage({
--                                     action = 'SELECT_WEIGHT',
--                                 })
--                             end,
--                         },
--                     },
--                     distance = 2.53
--                 })
--             end
--         elseif Config.Library == "ox" then 
--             for key, benchdata in pairs(Config.Exercises) do
--                 exports.ox_target:addBoxZone({
--                     name = key,
--                     coords = Config.Exercises[key]["exerciseCoords"],
--                     size = vec3(1.000000, 1.000000, 3.500000),
--                     rotation = Config.Exercises[key]["exerciseHeading"],
--                     options = {
--                         {
--                             type = "client",
--                             event = "Start Exercise".. key,
--                             icon = "fas fa-sign-in-alt",
--                             label = "Bench Press",
--                             onSelect = function()
--                                 TriggerEvent('s-gym:startExercise', key, "Exercises")
--                             end,
--                         },
--                         {
--                             type = "client",
--                             event = "Select Weight",
--                             icon = "fas fa-sign-in-alt",
--                             label = "Select Weight",
--                             onSelect = function()
--                                 SetNuiFocus(true, true)
--                                 SendNUIMessage({
--                                     action = 'SELECT_WEIGHT',
--                                 })
--                             end,
--                         },
--                     },
--                 })
--             end
--         end
--     else 
--         isRange = false
--         while true do
--             isRange = false
--             local wait = 500
--             local ped = PlayerPedId()
--             local pedC = GetEntityCoords(ped)
--             for key, benchdata in pairs(Config.Exercises) do
--                     for i = 1, #Config.Exercises[key]["exerciseCoords"], 1 do
--                         local dist = #(pedC - Config.Exercises[key]["exerciseCoords"])
--                         if dist < 1.2 then
--                             wait = 0
--                             isRange = true
--                             DrawMarker(20, Config.Exercises[key]["exerciseCoords"].x, Config.Exercises[key]["exerciseCoords"].y, Config.Exercises[key]["exerciseCoords"].z + 0.3, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.15, 0.15, 0.15, 207, 36, 36, 100, false, true, 2, true, nil, nil, false) 
                      
--                             if IsControlJustPressed(0, 38) then
--                                 DisableControlAction(0, 38, true)
--                                 SetNuiFocus(false, false)
--                                 if Config.Warm then 
--                                     wait = 9000
--                                 else 
--                                     wait = 5000
--                                 end
                                
--                                 TriggerEvent('s-gym:startExercise', key, "Exercises")
--                                 break
--                             end
--                             if IsControlJustPressed(0, 311) then
--                                 DisableControlAction(0, 311, true)
--                                 SetNuiFocus(true, true)
--                                 SendNUIMessage({
--                                     action = 'SELECT_WEIGHT',
--                                 })
--                                 break
--                             end
                        
--                         end
--                     end
--                 end
--             Citizen.Wait(wait)
--         end
--     end
-- end)

Citizen.CreateThread(function()
    while true do
        isRange = false
        local wait = 500
        local ped = PlayerPedId()
        local pedC = GetEntityCoords(ped)
        
        for i = 1, #Config.Lockers, 1 do
            local dist = #(pedC - Config.Lockers[i])
            if dist < 1.2 then
                wait = 0
                isRange = true
                DrawMarker(20, Config.Lockers[i].x, Config.Lockers[i].y, Config.Lockers[i].z + 0.6, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.15, 0.15, 0.15, 207, 36, 36, 100, false, true, 2, true, nil, nil, false) 
                
                if IsControlJustPressed(0, 38) then
                    Config.ClothingMenu()
                    
                    break
                end
            end
        end

        Citizen.Wait(wait)
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for k, v in pairs(Config.CustomExercises) do
            if v.propCoords then
                for a, b in pairs(v.propCoords) do
                    DeleteEntity(b.object)
                end
            end
        end
    end
end)