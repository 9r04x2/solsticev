import("waituntil")

function loadAnimSet(animSet)
    RequestAnimSet(animSet)
    return waitUntil(function() return HasAnimSetLoaded(animSet) end, 5, 5000)
end

function loadAnimDict(dict)
    RequestAnimDict(dict)
    return waitUntil(function() return HasAnimDictLoaded(dict) end, 5, 5000)
end

function loadModel(model)
    RequestModel(model)
    return waitUntil(function() return HasModelLoaded(model) end, 5, 5000)
end

function loadClipSet(clipSet)
    RequestClipSet(clipSet)
    return waitUntil(function() return HasClipSetLoaded(clipSet) end, 5, 5000)
end

function loadPtfxAsset(ptfx)
    RequestNamedPtfxAsset(ptfx)
    return waitUntil(function() return HasNamedPtfxAssetLoaded(ptfx) end, 5, 5000)
end

function loadAudioBank(audio, networked)
    return waitUntil(function()
        return RequestScriptAudioBank(audio, networked == true, -1)
    end, 5, 5000)
end

function VectorCross(lhs, rhs)
    return vector3(
        lhs.y * rhs.z - lhs.z * rhs.y,
        lhs.z * rhs.x - lhs.x * rhs.z,
        lhs.x * rhs.y - lhs.y * rhs.x
    )
end

function GetMiddleVector(vec1, vec2)
    return (vec1 + vec2) / 2
end

function GetNetworkControlOfEntity(entity)
    if not NetworkGetEntityIsNetworked(entity) then return true end    

    return waitUntil(function()
        NetworkRequestControlOfEntity(entity)
        return NetworkHasControlOfEntity(entity)
    end, 5, 2000)
end

function TeleportPlayer(coords, heading, veh, land)
    StopPlayerTeleport()
    StartPlayerTeleport(PLAYER.ID, coords, heading or GetEntityHeading(PLAYER.PED), veh, land, true)

    return waitUntil(function()
        return not IsPlayerTeleportActive()
    end, 5, 2000)
end

return {
    loadAnimSet = loadAnimSet,
    loadAnimDict = loadAnimDict,
    loadModel = loadModel,
    loadPtfxAsset = loadPtfxAsset
}