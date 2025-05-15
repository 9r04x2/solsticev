local DoesEntityExist = DoesEntityExist
local DeleteEntity = DeleteEntity

function DeleteEntitySafe(entity)
    if not DoesEntityExist(entity) then return end
    DeleteEntity(entity)
end

function Vec3ToObject(vector)
	return {x = vector.x, y = vector.y, z = vector.z}
end

function ToVec3(t)
    if type(t) ~= "table" then return end

    if t.x ~= nil and t.y ~= nil and t.z ~= nil then
        return vector3(t.x, t.y, t.z)
    elseif t[1] ~= nil and t[2] ~= nil and t[3] ~= nil then
        return vector3(t[1], t[2], t[3])
    end
end

ArrayToVec3 = ToVec3

function ValidateObject(pObject, validatedObject)
    local object = table.deepClone(pObject)
	local convertTypes = function(v)
		local types = {}
		if v ~= "table" then
			types[type(v) == "string" and v or type(v)] = true
		else
			if v[1] then
				for i=1, #v do
					types[type(v[i]) == "string" and v[i] or type[v[i]]] = true
				end
			end
		end
		return types
	end

    for k, v in pairs(validatedObject) do
        local valueType = type(object[k])
        if valueType ~= nil and valueType == v or convertTypes(v)[valueType] then
            object[k] = nil
        else
            return false
        end
    end

    return next(object) == nil
end

function roundCoords(coords)
    return {x = round(coords.x, 4), y = round(coords.y, 4), z = round(coords.z, 2)}
end

function parseVector(vector)
    return json.encode(roundCoords(vector))
end

function isFunction(fn)
    local t = type(fn)

    if t == "function" then
        return true
    end

    if t == "table" then
        return isFunction(getmetatable(fn)?.__call) or fn.__cfx_functionReference ~= nil
    end

    return false
end

function onResourceStart(cb)
    return AddEventHandler("onResourceStart", function(resName)
        if resName ~= _RESOURCE_NAME then return end
        cb()
    end)
end

function onResourceStop(cb)
    return AddEventHandler("onResourceStop", function(resName)
        if resName ~= _RESOURCE_NAME then return end
        cb()
    end)
end

function onceEvent(eventName, cb)
    local handler
    handler = AddEventHandler(eventName, function(...)
        RemoveEventHandler(handler)
        cb(...)
    end)
end

function onceNetEvent(eventName, cb)
    local handler
    handler = RegisterNetEvent(eventName, function(...)
        RemoveEventHandler(handler)
        cb(...)
    end)
end

function IsResourceStarted(resource)
    return GetResourceState(resource) == "started"
end

function HasResource(resource)
    return GetResourceState(resource):find("start") ~= nil
end

function Enum(...)
    local enum = {...}

    if type(enum[1]) == "table" then
        enum = enum[1]
    end

    local t = {}

    for i, v in ipairs(enum) do
        t[v] = v
    end

    return t
end

return {
    Vec3ToObject = Vec3ToObject,
    ArrayToVec3 = ArrayToVec3,
    ValidateObject = ValidateObject,
    onResourceStart = onResourceStart,
    onResourceStop = onResourceStop
}