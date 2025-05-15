NUIMessager = {}
local KEY = ("__no_nuimessager_%s_"):format(_RESOURCE_NAME:lower())
local interceptors = {}

local function intercept(eventName, data)
    local intercepts = interceptors[eventName]
    if not intercepts then return data end

    for _, interceptor in ipairs(intercepts) do
        data = interceptor(data)
    end

    return data
end

function NUIMessager:Interceptor(eventName, cb)
    if not eventName or not cb then return end
    if not interceptors[eventName] then
        interceptors[eventName] = {cb}
        return
    end

    interceptors[eventName][#interceptors[eventName] + 1] = cb
end

if _IS_SERVER then
    function NUIMessager:Send(target, eventName, data)
        target = tonumber(target)
        if not target or not eventName then return end
        TriggerClientEvent(KEY .. "send", target, eventName, intercept(eventName, data))
    end

    return NUIMessager
end

NUIMessager.ready = promise:new()

RegisterNUICallback("Ready", function(data, cb)
    NUIMessager.ready:resolve(true)
    cb("ok")
end)

function NUIMessager:Send(eventName, data, focus)
    if eventName then
        Await(NUIMessager.ready)
        SendNUIMessage({event = eventName, data = intercept(eventName, data)})
    end
    
    if focus == nil then return end
    SetNuiFocus(focus, focus)
end

RegisterNetEvent(KEY .. "send", function(eventName, data)
    NUIMessager:Send(eventName, data)
end)

return NUIMessager