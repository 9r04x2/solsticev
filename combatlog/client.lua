local QBCore = exports['qb-core']:GetCoreObject()
local combatlog = true
local sure = true
print('[PropLogger] client overrides loaded')

local _CreateObject                = CreateObject
local _CreateObjectNoOffset        = CreateObjectNoOffset
local _PlaceObjectOnGroundProperly = PlaceObjectOnGroundProperly
local _AttachEntityToEntity        = AttachEntityToEntity

local function logEntity(entity)
    if DoesEntityExist(entity) and IsEntityAnObject(entity) then
        local hash  = GetEntityModel(entity)
        local netID = NetworkGetNetworkIdFromEntity(entity)
        local v     = GetEntityCoords(entity)
        TriggerServerEvent('propLogger:spawned', hash, netID, v.x, v.y, v.z)
    end
end

-- CreateObject override
CreateObject = function(modelHash, x, y, z, dynamic, net, p7)
    local obj = _CreateObject(modelHash, x, y, z, dynamic, net, p7)
    logEntity(obj)
    return obj
end

-- CreateObjectNoOffset override
CreateObjectNoOffset = function(modelHash, x, y, z, dynamic, net, p7)
    local obj = _CreateObjectNoOffset(modelHash, x, y, z, dynamic, net, p7)
    logEntity(obj)
    return obj
end

-- PlaceObjectOnGroundProperly override
PlaceObjectOnGroundProperly = function(entity)
    _PlaceObjectOnGroundProperly(entity)
    logEntity(entity)
end

-- AttachEntityToEntity override (qb-phone gibi attach kullanımlarını yakalar)
AttachEntityToEntity = function(entity1, entity2, boneIndex, x, y, z, xR, yR, zR, p9, softPin, collision, isPed, vertIdx, fixedRot)
    local ok = _AttachEntityToEntity(entity1, entity2, boneIndex, x, y, z, xR, yR, zR, p9, softPin, collision, isPed, vertIdx, fixedRot)
    logEntity(entity1)
    return ok
end
RegisterNetEvent('combatlog')
AddEventHandler('combatlog', function(location, players, clock, discord,reason)
    CreateThread(function()
        Wait(45000)
        sure = false
    end)
    CreateThread(function()
        sure = true
        while sure do
            local dist = #(GetEntityCoords(PlayerPedId()) - location)
            if dist < 20.0 then
                if combatlog then
                DrawMarker(32, location.x, location.y, location.z, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.7, 32, 236, 54, 100, 0, 0, 0, 1, 0, 0, 0)
                if dist < 3 then
                    DrawText3Ds(location.x, location.y, location.z + 0.5, "~r~ "..players.steamid.. "- ~g~"..clock.. " ~w~]")
                    DrawText3Ds(location.x, location.y, location.z + 0.7, "~g~[E] ~w~" ..discord.." ~y~~w~] report için kopyala | Sebep:" ..reason)
                    if IsControlJustReleased(0, 38) then
						CopyToClipboard(discord)
                        QBCore.Functions.Notify("Discord adresi kopyalandı", "success")
					end
                end
            end
            end
            Wait(5)
        end
    end)
end)

RegisterCommand("combatlog", function(_, args)
    if not combatlog then
        combatlog = true
        QBCore.Functions.Notify("Artık çıkış yapan oyuncuları görebilirsin", "success")
    else
        combatlog = false
        QBCore.Functions.Notify("Artık çıkış yapan oyuncuları görmeyeceksin", "error")
    end
end)

 function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function CopyToClipboard(discord)
    SendNUIMessage({
        string = string.format(discord)
    })
end