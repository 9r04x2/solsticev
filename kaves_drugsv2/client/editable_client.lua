QBCore = exports['qb-core']:GetCoreObject()

Framework = nil

local onProgress = false

getProgress = function()
    return onProgress
end

Citizen.CreateThread(function()
    while QBCore == nil do 
        Citizen.Wait(100)
    end
    -- for _, data in pairs(iplList) do
    --     loadIpl(data.ipl, data.coords, _)
    -- end
end)

reportPolice = function(coords)
    -- add trigger
end

loadIpl = function(table, interiorCoords, lab)
    -- local interiorID = GetInteriorAtCoords(interiorCoords[1], interiorCoords[2], interiorCoords[3])
    -- if IsValidInterior(interiorID) then
    --     PinInteriorInMemory(interiorID)
    --     for k,v in pairs(table) do
    --         ActivateInteriorEntitySet(interiorID, v)
    --     end
    --     RefreshInterior(interiorID)
    -- end
    -- if lab == "Meth" then
    --     if IsValidInterior(interiorID) then
    --         PinInteriorInMemory(interiorID)
    --         ActivateInteriorEntitySet(interiorID, "meth_lab_empty")
    --     end
    --     RefreshInterior(interiorID)
    -- end
end

getPhrase = function(text)
    return Strings[text] or ""
end
ClearPedTasksImmediately(PlayerPedId())

showHelpNotification = function(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

teleportPlayer = function(coords)
    DoScreenFadeOut(1000)
    Citizen.SetTimeout(1500, function()
        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z - 1)
        SetEntityHeading(PlayerPedId(), coords.w)
        DoScreenFadeIn(1000)
    end)
end

requestObjModel = function(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(10)
    end
end

requestAnim = function(animDict)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(1)
    end
end

progressBar = function(text, time, item, count)
    if not onProgress then
        onProgress = true
        local ped = PlayerPedId()
        FreezeEntityPosition(ped, true)

        QBCore.Functions.Progressbar("drug_action", text, time, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            anim = "machinic_loop_mechandplayer",
            flags = 49,
        }, {}, {}, function() -- onFinish
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            TriggerServerEvent("kaves_drugsv2:server:giveItem", item, count)
            onProgress = false
        end, function() -- onCancel
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            QBCore.Functions.Notify("İşlem iptal edildi", "error")
            onProgress = false
        end)
    else
        QBCore.Functions.Notify("Zaten bir işlem yapıyorsun!", "error")
    end
end

showNotification = function(message, flash)
	BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(message)
	EndTextCommandThefeedPostTicker(flash, 1)
end

DrawText3D = function(x, y, z, scale, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        local factor = (string.len(text)) / 490
    end
end

Citizen.CreateThread(function()
    if Config.Framework == "esx" then
        while Framework == nil do
            TriggerEvent('esx:getSharedObject', function(obj) Framework = obj end)
            Citizen.Wait(0)
        end
    elseif Config.Framework == "qbcore" then
        Framework = exports['qb-core']:GetCoreObject()
    end
end)

TriggerCallback = function(cbName, cb, data)
    if Config.Framework == "esx" then
        Framework.TriggerServerCallback(cbName, function(output)
            if cb then cb(output) else return output end  
        end, data)
    elseif Config.Framework == "qbcore" then
        Framework.Functions.TriggerCallback(cbName, function(output)
            if cb then cb(output) else return output end  
        end, data)
    end
end





