local playCookScene = function(data)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)

    progressStatus = getProgress()
    if progressStatus == false then

        showNotification(getPhrase("cooking_meth"))

        local animDict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@"

        requestAnim(animDict)

        local wait = (GetAnimDuration(animDict, "chemical_pour_short_cooker")*1000)
        progressBar(getPhrase("cooking_meth_text"), wait, data.itemName, data.itemCount)

    else
        TriggerEvent("QBCore:Notify", "Zaten bir işlem içerisindesin.", "error") 
    end

end

local playHammerScene = function(data)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)

    progressStatus = getProgress()
    if progressStatus == false then

        showNotification(getPhrase("breaking_meth"))

        local animDict = "anim@amb@business@meth@meth_smash_weight_check@"

        requestAnim(animDict)

        local wait = 3000
        progressBar(getPhrase("breaking_meth_text"), wait, data.itemName, data.itemCount)

    else
        TriggerEvent("QBCore:Notify", "Zaten bir işlem içerisindesin.", "error") 
    end
end

local playPackingScene = function(data)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)

    progressStatus = getProgress()
    if progressStatus == false then

        showNotification(getPhrase("packing_meth"))

        local animDict = "anim@amb@business@meth@meth_smash_weight_check@"

        requestAnim(animDict)

        local wait = 3000
        progressBar(getPhrase("packing_meth_text"), wait, data.itemName, data.itemCount)

    else
        TriggerEvent("QBCore:Notify", "Zaten bir işlem içerisindesin.", "error")
    end
end

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local pCoords = GetEntityCoords(playerPed)
        for k,v in pairs(Config.Meth.labs) do
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
                showHelpNotification(getPhrase("enter_meth_lab"))
                if IsControlJustPressed(0, 38) then
                    progressStatus = getProgress()
                    if progressStatus == false then
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
            end

            if exitDst <= 2 then
                showHelpNotification(getPhrase("exit_meth_lab"))
                if IsControlJustPressed(0, 38) then
                    teleportPlayer(v.enterance.enterCoords)
                end
            end

            for _, data in pairs(v.cookScene.coords) do
                local cookDst = #(pCoords - data.coords)

                if cookDst <= 10 then
                    sleep = 1
                    DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
                
                if cookDst <= 2 then
                    showHelpNotification(getPhrase("start_meth_cooking"))
                    if IsControlJustPressed(0, 38) then
                        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == 0 then
                            progressStatus = getProgress()
                            if progressStatus == false then
                                if next(v.cookScene.requiredItems) then
                                    TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                        if not result.status then
                                            return
                                        end
                                        playCookScene(v.cookScene)
                                    end, {items = v.cookScene.requiredItems, remove = v.cookScene.removeItem})
                                else
                                    playCookScene(v.cookScene)
                                end
                            end
                        else
                            QBCore.Functions.Notify("Araçtayken bunu yapamazsın.", "error")
                        end
                    end
                end
            end

            for _, data in pairs(v.hammerScene.coords) do
                local hammerDst = #(pCoords - data.coords)

                if hammerDst <= 10 then
                    sleep = 1
                    DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
                
                if hammerDst <= 2 then
                    showHelpNotification(getPhrase("start_breaking_meth"))
                    if IsControlJustPressed(0, 38) then
                        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == 0 then
                            progressStatus = getProgress()
                            if progressStatus == false then
                                if next(v.hammerScene.requiredItems) then
                                    TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                        if not result.status then
                                            return
                                        end
                                        playHammerScene(v.hammerScene)
                                    end, {items = v.hammerScene.requiredItems, remove = v.hammerScene.removeItem})
                                else
                                    playHammerScene(v.hammerScene)
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
                    showHelpNotification(getPhrase("start_packing_meth"))
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