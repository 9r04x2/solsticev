import "waituntil"

function SpawnObject(hash, coords, rotation)
    local object = CreateObjectNoOffset(hash, coords, true, true, false)
    
    waitUntil(function()
        return DoesEntityExist(object)
    end)

    SetEntityRotation(object, rotation)

    return object
end

function GetOffsetFromParamsInWorldCoords(coords, rotation, offset)
    local rx, ry, rz = math.rad(rotation.x), math.rad(rotation.y), math.rad(rotation.z)
    local matrix = {}

    matrix[1] = {}
    matrix[1][1] = math.cos(rz)*math.cos(ry) - math.sin(rz)*math.sin(rx)*math.sin(ry)
    matrix[1][2] = math.cos(ry)*math.sin(rz) + math.cos(rz)*math.sin(rx)*math.sin(ry)
    matrix[1][3] = -math.cos(rx)*math.sin(ry)
    matrix[1][4] = 1
    
    matrix[2] = {}
    matrix[2][1] = -math.cos(rx)*math.sin(rz)
    matrix[2][2] = math.cos(rz)*math.cos(rx)
    matrix[2][3] = math.sin(rx)
    matrix[2][4] = 1
	
    matrix[3] = {}
    matrix[3][1] = math.cos(rz)*math.sin(ry) + math.cos(ry)*math.sin(rz)*math.sin(rx)
    matrix[3][2] = math.sin(rz)*math.sin(ry) - math.cos(rz)*math.cos(ry)*math.sin(rx)
    matrix[3][3] = math.cos(rx)*math.cos(ry)
    matrix[3][4] = 1
	
    matrix[4] = {}
    matrix[4][1], matrix[4][2], matrix[4][3] = coords.x, coords.y, coords.z - 1.0
    matrix[4][4] = 1
    
    local x = offset.x * matrix[1][1] + offset.y * matrix[2][1] + offset.z * matrix[3][1] + matrix[4][1]
    local y = offset.x * matrix[1][2] + offset.y * matrix[2][2] + offset.z * matrix[3][2] + matrix[4][2]
    local z = offset.x * matrix[1][3] + offset.y * matrix[2][3] + offset.z * matrix[3][3] + matrix[4][3]
    
    return vector3(x, y, z)
end

function GetOffsetFromEntityInWorldCoords(entity, offset)
    return GetOffsetFromRotationInWorldCoords(GetEntityCoords(entity), GetEntityRotation(entity), offset)
end
