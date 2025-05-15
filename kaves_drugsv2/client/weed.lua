local playGatheringScene = function(data, mainData)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)

    progressStatus = getProgress()
    if progressStatus == false then

        showNotification(getPhrase("gathering_weed"))

        local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"

        requestAnim(animDict)

        local wait = (GetAnimDuration(animDict, "weed_spraybottle_stand_kneeling_01_inspector")*1000)
        progressBar(getPhrase("gathering_weed_text"), wait, mainData.itemName, mainData.itemCount)

    else
        TriggerEvent("QBCore:Notify", "Zaten bir işlem içerisindesin.", "error")
    end
    
end

local playPackingScene = function(data, mainData)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)

    progressStatus = getProgress()
    if progressStatus == false then

        showNotification(getPhrase("packing_weed"))

        local animDict = "anim@amb@business@weed@weed_sorting_seated@"

        requestAnim(animDict)

        local wait = (GetAnimDuration(animDict, "sorter_right_sort_v3_sorter02")*1000)
        progressBar(getPhrase("packing_weed_text"), wait, mainData.itemName, mainData.itemCount)

    else
        TriggerEvent("QBCore:Notify", "Zaten bir işlem içerisindesin.", "error")
    end

end

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local pCoords = GetEntityCoords(playerPed)
        for k,v in pairs(Config.Weed.labs) do
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
                showHelpNotification(getPhrase("enter_weed_lab"))
                if IsControlJustPressed(0, 38) then
                    if next(v.enterance.requiredItems) then
                        TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                            if not result.status then
                                return
                            end
                            teleportPlayer(v.enterance.exitCoords)
                        end, {items = v.enterance.requiredItems, remove = v.enterance.removeItem, bucketId = v.enterance.bucketId})
                    else
                        teleportPlayer(v.enterance.exitCoords)
                    end
                end
            end

            if exitDst <= 2 then
                showHelpNotification(getPhrase("exit_weed_lab"))
                if IsControlJustPressed(0, 38) then
                    teleportPlayer(v.enterance.enterCoords)
                end
            end

            for _, data in pairs(v.gatheringScene.coords) do
                local gatherDst = #(pCoords - data.coords)

                if gatherDst <= 10 then
                    sleep = 1
                    DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
                
                if gatherDst <= 1 then
                    showHelpNotification(getPhrase("start_gather_weed"))
                    if IsControlJustPressed(0, 38) then
                        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == 0 then
                            progressStatus = getProgress()
                            if progressStatus == false then
                                if next(v.gatheringScene.requiredItems) then
                                    TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                        if not result.status then
                                            return
                                        end
                                        playGatheringScene(data, v.gatheringScene)
                                    end, {items = v.gatheringScene.requiredItems, remove = v.gatheringScene.removeItem})
                                else
                                    playGatheringScene(data, v.gatheringScene)
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
                
                if packingDst <= 1 then
                    showHelpNotification(getPhrase("start_packing_weed"))
                    if IsControlJustPressed(0, 38) then
                        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == 0 then
                            progressStatus = getProgress()
                            if progressStatus == false then
                                if next(v.packingScene.requiredItems) then
                                    TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                        if not result.status then
                                            return
                                        end
                                        playPackingScene(data, v.packingScene)
                                    end, {items = v.packingScene.requiredItems, remove = v.packingScene.removeItem})
                                else
                                    playPackingScene(data, v.packingScene)
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
