local timeouts = {}

function setTimeout(msec, cb)
    local timeoutId

    CreateThreadNow(function(threadRef)
        timeoutId = threadRef
        timeouts[timeoutId] = true

        Wait(msec)
        if not timeouts[timeoutId] then return end
        cb()
    end)

    return timeoutId
end

function clearTimeout(timeoutId)
    if not timeoutId then return end
    timeouts[timeoutId] = nil
end

return {
    set = setTimeout,
    clear = clearTimeout
}
