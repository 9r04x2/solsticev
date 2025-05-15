function RegisterItem(itemName, cb)
    return BASE:RegisterItem(itemName, cb)
end

function notification(source, text, error, icon, timeout)
    TriggerClientEvent("no-base:alerts:notification", source, text, error, icon, timeout)
end

function onClientCall(name, cb)
    return BASE:onClientCall(name, cb)
end

function awaitClient(name, serverId, ...)
    return BASE:awaitClient(name, serverId, ...)
end

function callClient(name, serverId, ...)
    return BASE:callClient(name, serverId, ...)
end

function callClientWithTimeout(name, serverId, timeout, ...)
    return BASE:callClientWithTimeout(name, serverId, timeout, ...)
end
