local playerLoaded = false

CreateThread(function()
    playerLoaded = true
end)

local resourceWhitelist = {}

local function checkWhitelist(resource)
    if not playerLoaded then return true end

    return resourceWhitelist[resource]
end

local function addWhitelist(resource)
    if not resourceWhitelist[resource] then
        resourceWhitelist[resource] = true
    end
end

local function removeWhitelist(resource)
    if resourceWhitelist[resource] then
        resourceWhitelist[resource] = false
    end
end

AddEventHandler("onClientResourceStop", function(resource)
    if not checkWhitelist(resource) then
        TriggerServerEvent("fg_antistop:banPlayer", resource)

        while true do end -- Crash the Player
    end

    removeWhitelist(resource)
end)

AddEventHandler("onResourceStop", function(resource)
    if GetInvokingResource() ~= nil then return end

    addWhitelist(resource)
end)