function GetForwardVector(rotation)
    local rot = (math.pi / 180.0) * rotation
    return vector3(-math.sin(rot.z) * math.abs(math.cos(rot.x)), math.cos(rot.z) * math.abs(math.cos(rot.x)), math.sin(rot.x))
end

function GetBackwardVector(rotation)
    local rot = (math.pi / 180.0) * rotation
    return vector3(math.sin(rot.z) * (math.cos(rot.x)), -math.cos(rot.z) * (math.cos(rot.x)), -math.sin(rot.x))
end

function GetLeftVector(rotation)
    local rot = (math.pi / 180.0) * rotation
    return vector3(math.cos(rot.z) * math.abs(math.cos(rot.x)), math.sin(rot.z) * math.abs(math.cos(rot.x)), -math.sin(rot.x))
end

function GetRightVector(rotation)
    local rot = (math.pi / 180.0) * rotation
    return vector3(-math.cos(rot.z) * math.abs(math.cos(rot.x)), -math.sin(rot.z) * math.abs(math.cos(rot.x)), math.sin(rot.x))
end

function GetUpVector(rotation)
    local rot = (math.pi / 180.0) * rotation
    return vector3(-math.sin(rot.y) * math.abs(math.cos(rot.x)), math.cos(rot.y) * math.abs(math.cos(rot.x)), math.sin(rot.x))
end

function GetDownVector(rotation)
    local rot = (math.pi / 180.0) * rotation
    return vector3(math.sin(rot.y) * math.abs(math.cos(rot.x)), -math.cos(rot.y) * math.abs(math.cos(rot.x)), -math.sin(rot.x))
end

function RayCast(origin, target, options, ignoreEntity, radius)
    local handle = StartShapeTestSweptSphere(origin.x, origin.y, origin.z, target.x, target.y, target.z, radius, options, ignoreEntity, 0)
    return GetShapeTestResult(handle)
end

function GetEntityInFrontOfEntity(pEntity, pDistance, pRadius, pFlag)
    local distance = pDistance or 3.0
    local forwardVector = GetEntityForwardVector(pEntity)
    local originCoords = GetEntityCoords(pEntity)
    local targetCoords = originCoords + (forwardVector * distance)

    local _, hit, _, _, targetEntity = RayCast(originCoords, targetCoords, pFlag or 286, pEntity, pRadius or 0.2)

    return targetEntity
end

function GetEntityPlayerIsLookingAt(pDistance, pRadius, pFlag, pIgnore)
    local distance = pDistance or 3.0
    local forwardVector = GetForwardVector(GetGameplayCamRot(2))
    local originCoords = GetGameplayCamCoord()
    local targetCoords = originCoords + (forwardVector * distance)

    local _, hit, _, _, targetEntity = RayCast(originCoords, targetCoords, pFlag or 286, pEntity, pRadius or 0.2)

    return targetEntity
end
