function notification(text, error, icon, timeout)
    return BASE:Notification(text, error, icon, timeout)
end

function SetIndicator(data)
    return BASE:SetIndicator(data)
end

function SetIndicators(data)
    return BASE:SetIndicators(data)
end

function CloseIndicator()
    return BASE:CloseIndicator()
end

function CloseIndicators()
    return BASE:CloseIndicators()
end

function RegisterStateBag(name, pType, cb)
    return BASE:RegisterStateBag(name, pType, cb)
end

function SetStateBag(entity, key, value)
    return BASE:SetStateBag(entity, key, value)
end

function RegisterKeyCommand(command, cb)
    return AddEventHandler(("%sno-base:keymapping:%s"):format(command:sub(1, 1), command:sub(2)), cb)
end

function onServerCall(name, cb)
    return BASE:onServerCall(name, cb)
end

function awaitServer(name, ...)
    return BASE:awaitServer(name, ...)
end

function callServer(name, ...)
    return BASE:callServer(name, ...)
end

function callServerWithTimeout(name, timeout, ...)
    return BASE:callServerWithTimeout(name, timeout, ...)
end
