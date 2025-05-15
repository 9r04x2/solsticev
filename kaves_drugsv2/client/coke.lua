local playUnpackScene = function(data, mainData)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)

    progressStatus = getProgress()
    if progressStatus == false then

        showNotification(getPhrase("unpacking_coke"))

        local animDict = "anim@amb@business@coc@coc_unpack_cut@"

        requestAnim(animDict)

        local wait = (GetAnimDuration(animDict, "fullcut_cycle_v2_cokepacker")*1000)
        progressBar(getPhrase("unpacking_coke_text"), wait, mainData.itemName, mainData.itemCount)
    else
        TriggerEvent("QBCore:Notify", "Zaten bir işlem içerisindesin.", "error") 
    end

end

local playCutterScene = function(data, mainData)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)

    progressStatus = getProgress()
    if progressStatus == false then

        showNotification(getPhrase("cutting_coke"))

        local animDict = "anim@amb@business@coc@coc_unpack_cut_left@"

        requestAnim(animDict)

        local wait = (GetAnimDuration(animDict, "coke_cut_v5_coccutter")*1000)
        progressBar(getPhrase("cutting_coke_text"), wait, mainData.itemName, mainData.itemCount)
    else
        TriggerEvent("QBCore:Notify", "Zaten bir işlem içerisindesin.", "error") 
    end
    
end

local playPackingScene = function(data)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)

    progressStatus = getProgress()
    if progressStatus == false then

        showNotification(getPhrase("packing_coke"))

        local animDict = "anim@amb@business@coc@coc_packing_hi@"

        requestAnim(animDict)

        local wait = (GetAnimDuration(animDict, "full_cycle_v3_pressoperator")*1000)
        progressBar(getPhrase("packing_coke_text"), wait, data.itemName, data.itemCount)
    else
        TriggerEvent("QBCore:Notify", "Zaten bir işlem içerisindesin.", "error") 
    end

end

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local pCoords = GetEntityCoords(playerPed)
        for k,v in pairs(Config.Coke.labs) do
            local enterDst = #(pCoords - vector3(v.enterance.enterCoords.x, v.enterance.enterCoords.y, v.enterance.enterCoords.z))
            local exitDst = #(pCoords - vector3(v.enterance.exitCoords.x, v.enterance.exitCoords.y, v.enterance.exitCoords.z))

            if enterDst <= 20 then
                sleep = 0
                if v.enterance.showMarker then
                    DrawMarker(2, v.enterance.enterCoords.x, v.enterance.enterCoords.y, v.enterance.enterCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
            end

            if exitDst <= 5 then
                sleep = 0
                if v.enterance.showMarker then
                    DrawMarker(2, v.enterance.exitCoords.x, v.enterance.exitCoords.y, v.enterance.exitCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
            end

            if enterDst <= 2 then
                showHelpNotification(getPhrase("enter_coke_lab"))
                if IsControlJustPressed(0, 38) then
                    if next(v.enterance.requiredItems) then
                        TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                            if not result.status then
                                return
                            end
                            progress = true
                            teleportPlayer(v.enterance.exitCoords)
                            progress = false
                        end, {items = v.enterance.requiredItems, remove = v.enterance.removeItem, bucketId = v.enterance.bucketId})
                    else
                        progress = true
                        teleportPlayer(v.enterance.exitCoords)
                        progress = false
                    end
                end
            end

            if exitDst <= 2 then
                showHelpNotification(getPhrase("exit_coke_lab"))
                if IsControlJustPressed(0, 38) then
                    teleportPlayer(v.enterance.enterCoords)
                end
            end

            for _, data in pairs(v.unpackScene.coords) do
                local unpackDst = #(pCoords - data.coords)

                if unpackDst <= 10 then
                    sleep = 1
                    DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
                
                if unpackDst <= 1 then
                    showHelpNotification(getPhrase("start_unpacking_coke"))
                    if IsControlJustPressed(0, 38) and not progress then

                        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == 0 then
                            progressStatus = getProgress()
                            if progressStatus == false then
                                if next(v.unpackScene.requiredItems) then
                                    TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                        if not result.status then
                                            return
                                        end
                                        playUnpackScene(data, v.unpackScene)
                                    end, {items = v.unpackScene.requiredItems, remove = v.unpackScene.removeItem})
                                else
                                    playUnpackScene(data, v.unpackScene)
                                end
                            end
                        else
                            QBCore.Functions.Notify("Araçtayken bunu yapamazsın.", "error")
                        end
                    end
                end
            end

            for _, data in pairs(v.cutterScene.coords) do
                local cutterDst = #(pCoords - data.coords)

                if cutterDst <= 10 then
                    sleep = 1
                    DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
                
                if cutterDst <= 1 then
                    showHelpNotification(getPhrase("start_cutting_coke"))
                    if IsControlJustPressed(0, 38) then
                        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == 0 then
                            progressStatus = getProgress()
                            if progressStatus == false then
                                if next(v.cutterScene.requiredItems) then
                                    TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                        if not result.status then
                                            return
                                        end
                                        playCutterScene(data, v.cutterScene)
                                    end, {items = v.cutterScene.requiredItems, remove = v.cutterScene.removeItem})
                                else
                                    playCutterScene(data, v.cutterScene)
                                end
                            end
                        else
                            QBCore.Functions.Notify("Araçtayken bunu yapamazsın.", "error")
                        end
                    end
                end
            end

            for _, data in pairs(v.packingScene.coords) do
                local packingDst = #(pCoords - data.coords)

                if packingDst <= 10 then
                    sleep = 1
                    DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
                
                if packingDst <= 2 then
                    showHelpNotification(getPhrase("start_packing_coke"))
                    if IsControlJustPressed(0, 38) then
                        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == 0 then
                            progressStatus = getProgress()
                            if progressStatus == false then
                                if next(v.packingScene.requiredItems) then
                                    TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                        if not result.status then
                                            return
                                        end
                                        playPackingScene(v.packingScene)
                                    end, {items = v.packingScene.requiredItems, remove = v.packingScene.removeItem})
                                else
                                    progress = true
                                    playPackingScene(v.packingScene)
                                end
                            end
                        else
                            QBCore.Functions.Notify("Araçtayken bunu yapamazsın.", "error")
                        end
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)