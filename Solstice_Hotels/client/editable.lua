InPreview, InHotel = false, false

CreateThread(function()
    for i, v in pairs(Config.Locations) do
        local blip = AddBlipForCoord(v.pedSettings.coord.x, v.pedSettings.coord.y, v.pedSettings.coord.z)
        SetBlipSprite(blip, 475)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.6)
        SetBlipColour(blip, 7)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Hotel")
        EndTextCommandSetBlipName(blip)

        RequestAnimDict("rcmnigel1cnmt_1c")
        while not HasAnimDictLoaded("rcmnigel1cnmt_1c") do
            Wait(0)
        end
        RequestModel(v.pedSettings.model)
        while not HasModelLoaded(v.pedSettings.model) do
            Wait(100)
        end
        local currentNpc = CreatePed(1, v.pedSettings.model, v.pedSettings.coord, false, false)
        SetPedCombatAttributes(currentNpc, 46, true)
        SetPedFleeAttributes(currentNpc, 0, 0)
        SetBlockingOfNonTemporaryEvents(currentNpc, true)
        SetEntityAsMissionEntity(currentNpc, true, true)
        SetEntityInvincible(currentNpc, true)
        FreezeEntityPosition(currentNpc, true)
        TaskPlayAnim(currentNpc, "rcmnigel1cnmt_1c", "base", 8.0, -8.0, -1, 50, 0, false, false, false)
    end
end)

if Config.InteractType["drawtext"].useThis then
    local function drawText3D(x, y, z, text)
        local onScreen,_x,_y=World3dToScreen2d(x,y,z)
        local px,py,pz=table.unpack(GetGameplayCamCoords())
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
    end

    local function GetNearest(playerCoords)
        local currentIndex, currentDistance = 0, 100000
        for xIndex, xCoords in pairs(Config.Locations) do
            local distance = #(playerCoords - vector3(xCoords.pedSettings.coord.x, xCoords.pedSettings.coord.y, xCoords.pedSettings.coord.z))
            if currentDistance > distance then
                currentDistance = distance
                currentIndex = xIndex
            end
        end
        return currentIndex, currentDistance
    end
    
    CreateThread(function()
        local sleep = 1000
        while true do
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local index, distance = GetNearest(coords)
            if distance < 1.5 then
                sleep = 0
                drawText3D(Config.Locations[index].pedSettings.coord.x, Config.Locations[index].pedSettings.coord.y, Config.Locations[index].pedSettings.coord.z + 2, '~g~[E]~w~ '..Locales[Config.Locales]["HotelsMenu"])
                if IsControlJustPressed(0, 38) then
                    TriggerEvent('Jakrino_Hotels:OpenMenu', false, index)
                end
            else
                sleep = 1000
            end
            Wait(sleep)
        end
    end)
elseif Config.InteractType["textui"].useThis then
    local function GetNearest(playerCoords)
        local currentIndex, currentDistance = 0, 100000
        for xIndex, xCoords in pairs(Config.Locations) do
            local distance = #(playerCoords - vector3(xCoords.pedSettings.coord.x, xCoords.pedSettings.coord.y, xCoords.pedSettings.coord.z))
            if currentDistance > distance then
                currentDistance = distance
                currentIndex = xIndex
            end
        end
        return currentIndex, currentDistance
    end

    CreateThread(function()
        local showed = false
        local sleep = 1000

        while true do
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local index, distance = GetNearest(coords)
            if distance < 1.5 then
                sleep = 0
                if not showed then
                    showed = true
                    exports['qb-core']:DrawText('[E] '..Locales[Config.Locales]["HotelsMenu"])
                end
                if IsControlJustPressed(0, 38) then
                    exports['qb-core']:KeyPressed()
                    Wait(100)
                    exports['qb-core']:HideText()
                    TriggerEvent('Jakrino_Hotels:OpenMenu', false, index)
                    showed = false
                end
            else
                if showed then
                    showed = false
                    exports['qb-core']:HideText()
                end
                sleep = 1000
            end
            Wait(sleep)
        end
    end)
elseif Config.InteractType["target"].useThis then
    for index, rentalData in pairs(Config.Locations) do
        local pedSettings = rentalData.pedSettings
        exports["qb-target"]:AddBoxZone("Hotels_" .. index, vector3(pedSettings.coord.x, pedSettings.coord.y, pedSettings.coord.z), 1.25, 1.25, {
            name = "Hotels_"..index,
            heading = pedSettings.coord.w,
            debugPoly = false,
            minZ = pedSettings.coord.z - 1,
            maxZ = pedSettings.coord.z + 2,
        }, {
            options = {
                {
                    type = "client",
                    event = "Jakrino_Hotels:OpenMenu",
                    label = Locales[Config.Locales]["HotelsMenu"],
                    index = index,
                }
            },
            distance = 2.0
        })
    end
end

RegisterNetEvent("Jakrino_Hotels:WhileInPreview")
AddEventHandler("Jakrino_Hotels:WhileInPreview", function(coords)
    InPreview = true
    if Config.InteractType["drawtext"].useThis then
        local function drawText3D(x, y, z, text)
            local onScreen,_x,_y=World3dToScreen2d(x,y,z)
            local px,py,pz=table.unpack(GetGameplayCamCoords())
            SetTextScale(0.35, 0.35)
            SetTextFont(4)
            SetTextProportional(1)
            SetTextColour(255, 255, 255, 215)
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString(text)
            DrawText(_x,_y)
            local factor = (string.len(text)) / 370
            DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
        end

        CreateThread(function()
            local sleep = 1000
            while InPreview do
                local ped = PlayerPedId()
                local pcoords = GetEntityCoords(ped)
                local distance = #(pcoords - vector3(coords.x, coords.y, coords.z))
                if distance < 1.5 then
                    sleep = 0
                    drawText3D(coords.x, coords.y, coords.z, '~g~[E]~w~ '..Locales[Config.Locales]["HotelsExitPreview"])
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent('Jakrino_Hotels:ExitPreview')
                    end
                else
                    sleep = 1000
                end
                Wait(sleep)
            end
        end)
    elseif Config.InteractType["textui"].useThis then
        CreateThread(function()
            local showed = false
            local sleep = 1000
    
            while InPreview do
                local ped = PlayerPedId()
                local pcoords = GetEntityCoords(ped)
                local distance = #(pcoords - vector3(coords.x, coords.y, coords.z))
                if distance < 1.5 then
                    sleep = 0
                    if not showed then
                        showed = true
                        exports['qb-core']:DrawText('[E] '..Locales[Config.Locales]["HotelsExitPreview"])
                    end
                    if IsControlJustPressed(0, 38) then
                        exports['qb-core']:KeyPressed()
                        Wait(100)
                        exports['qb-core']:HideText()
                        TriggerEvent('Jakrino_Hotels:ExitPreview')
                        showed = false
                    end
                else
                    if showed then
                        showed = false
                        exports['qb-core']:HideText()
                    end
                    sleep = 1000
                end
                Wait(sleep)
            end
        end)
    elseif Config.InteractType["target"].useThis then
        exports["qb-target"]:AddBoxZone("Hotels_Preview", vector3(coords.x, coords.y, coords.z), 1.5, 1.5, {
            name = "Hotels_Preview",
            heading = coords.w,
            debugPoly = false,
            minZ = coords.z,
            maxZ = coords.z + 2,
        }, {
            options = {
                {
                    type = "client",
                    event = "Jakrino_Hotels:ExitPreview",
                    label = Locales[Config.Locales]["HotelsExitPreview"]
                }
            },
            distance = 2.0
        })
        while InPreview do
            Wait(0)
        end
        exports['qb-target']:RemoveZone("Hotels_Preview")
    end
end)

RegisterNetEvent("Jakrino_Hotels:WhileInHotel")
AddEventHandler("Jakrino_Hotels:WhileInHotel", function(coords, stashcoords, clothcoords)
    InHotel = true
    if Config.InteractType["drawtext"].useThis then
        local function drawText3D(x, y, z, text)
            local onScreen,_x,_y=World3dToScreen2d(x,y,z)
            local px,py,pz=table.unpack(GetGameplayCamCoords())
            SetTextScale(0.35, 0.35)
            SetTextFont(4)
            SetTextProportional(1)
            SetTextColour(255, 255, 255, 215)
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString(text)
            DrawText(_x,_y)
            local factor = (string.len(text)) / 370
            DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
        end

        CreateThread(function()
            local sleep = 1000
            while InHotel do
                local ped = PlayerPedId()
                local pcoords = GetEntityCoords(ped)
                local distance = #(pcoords - vector3(clothcoords.x, clothcoords.y, clothcoords.z))
                if distance < 1.5 then
                    sleep = 0
                    drawText3D(clothcoords.x, clothcoords.y, clothcoords.z, '~g~[E]~w~ '..Locales[Config.Locales]["Cloth"])
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent('qb-clothing:client:openOutfitMenu')
                    end
                else
                    sleep = 1000
                end
                Wait(sleep)
            end
        end)

        CreateThread(function()
            local sleep = 1000
            while InHotel do
                local ped = PlayerPedId()
                local pcoords = GetEntityCoords(ped)
                local distance = #(pcoords - vector3(stashcoords.x, stashcoords.y, stashcoords.z))
                if distance < 1.5 then
                    sleep = 0
                    drawText3D(stashcoords.x, stashcoords.y, stashcoords.z, '~g~[E]~w~ '..Locales[Config.Locales]["Stash"])
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent('Jakrino_Hotels:OpenStash')
                    end
                else
                    sleep = 1000
                end
                Wait(sleep)
            end
        end)

        CreateThread(function()
            local sleep = 1000
            while InHotel do
                local ped = PlayerPedId()
                local pcoords = GetEntityCoords(ped)
                local distance = #(pcoords - vector3(coords.x, coords.y, coords.z))
                if distance < 1.5 then
                    sleep = 0
                    drawText3D(coords.x, coords.y, coords.z, '~g~[E]~w~ '..Locales[Config.Locales]["HotelManage"])
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent('Jakrino_Hotels:HotelManage')
                    end
                else
                    sleep = 1000
                end
                Wait(sleep)
            end
        end)
    elseif Config.InteractType["textui"].useThis then
        CreateThread(function()
            local showed = false
            local sleep = 1000
    
            while InHotel do
                local ped = PlayerPedId()
                local pcoords = GetEntityCoords(ped)
                local distance = #(pcoords - vector3(clothcoords.x, clothcoords.y, clothcoords.z))
                if distance < 1.5 then
                    sleep = 0
                    if not showed then
                        showed = true
                        exports['qb-core']:DrawText('[E] '..Locales[Config.Locales]["Cloth"])
                    end
                    if IsControlJustPressed(0, 38) then
                        exports['qb-core']:KeyPressed()
                        Wait(100)
                        exports['qb-core']:HideText()
                        TriggerEvent('qb-clothing:client:openOutfitMenu')
                        showed = false
                    end
                else
                    if showed then
                        showed = false
                        exports['qb-core']:HideText()
                    end
                    sleep = 1000
                end
                Wait(sleep)
            end
        end)

        CreateThread(function()
            local showed = false
            local sleep = 1000
    
            while InHotel do
                local ped = PlayerPedId()
                local pcoords = GetEntityCoords(ped)
                local distance = #(pcoords - vector3(stashcoords.x, stashcoords.y, stashcoords.z))
                if distance < 1.5 then
                    sleep = 0
                    if not showed then
                        showed = true
                        exports['qb-core']:DrawText('[E] '..Locales[Config.Locales]["Stash"])
                    end
                    if IsControlJustPressed(0, 38) then
                        exports['qb-core']:KeyPressed()
                        Wait(100)
                        exports['qb-core']:HideText()
                        TriggerEvent('Jakrino_Hotels:OpenStash')
                        showed = false
                    end
                else
                    if showed then
                        showed = false
                        exports['qb-core']:HideText()
                    end
                    sleep = 1000
                end
                Wait(sleep)
            end
        end)

        CreateThread(function()
            local showed = false
            local sleep = 1000
    
            while InHotel do
                local ped = PlayerPedId()
                local pcoords = GetEntityCoords(ped)
                local distance = #(pcoords - vector3(coords.x, coords.y, coords.z))
                if distance < 1.5 then
                    sleep = 0
                    if not showed then
                        showed = true
                        exports['qb-core']:DrawText('[E] '..Locales[Config.Locales]["HotelManage"])
                    end
                    if IsControlJustPressed(0, 38) then
                        exports['qb-core']:KeyPressed()
                        Wait(100)
                        exports['qb-core']:HideText()
                        TriggerEvent('Jakrino_Hotels:HotelManage')
                        showed = false
                    end
                else
                    if showed then
                        showed = false
                        exports['qb-core']:HideText()
                    end
                    sleep = 1000
                end
                Wait(sleep)
            end
        end)
    elseif Config.InteractType["target"].useThis then
        exports["qb-target"]:AddBoxZone("Hotels_Stash", vector3(stashcoords.x, stashcoords.y, stashcoords.z), 1.5, 1.5, {
            name = "Hotels_Stash",
            heading = stashcoords.w,
            debugPoly = false,
            minZ = stashcoords.z - 1,
            maxZ = stashcoords.z + 2,
        }, {
            options = {
                {
                    type = "client",
                    event = "Jakrino_Hotels:OpenStash",
                    label = Locales[Config.Locales]["Stash"]
                }
            },
            distance = 2.0
        })
        exports["qb-target"]:AddBoxZone("Hotels_Cloth", vector3(clothcoords.x, clothcoords.y, clothcoords.z), 1.5, 1.5, {
            name = "Hotels_Cloth",
            heading = clothcoords.w,
            debugPoly = false,
            minZ = clothcoords.z - 1,
            maxZ = clothcoords.z + 2,
        }, {
            options = {
                {
                    type = "client",
                    event = "qb-clothing:client:openOutfitMenu",
                    label = Locales[Config.Locales]["Cloth"]
                }
            },
            distance = 2.0
        })
        exports["qb-target"]:AddBoxZone("Hotels_In", vector3(coords.x, coords.y, coords.z), 1.5, 1.5, {
            name = "Hotels_In",
            heading = coords.w,
            debugPoly = false,
            minZ = coords.z - 1,
            maxZ = coords.z + 2,
        }, {
            options = {
                {
                    type = "client",
                    event = "Jakrino_Hotels:HotelManage",
                    label = Locales[Config.Locales]["HotelManage"]
                }
            },
            distance = 2.0
        })
        while InHotel do
            Wait(0)
        end
        exports['qb-target']:RemoveZone("Hotels_In")
        exports['qb-target']:RemoveZone("Hotels_Stash")
        exports['qb-target']:RemoveZone("Hotels_Cloth")
    end
end)