local intervals = {}

function SetInterval(cb, idle, ...)
    local threadId
    local args = {...}

    CreateThreadNow(function(ref)
        idle = idle or 0
        threadId = ref
        intervals[threadId] = true

        repeat
            cb(table.unpack(args))
            Wait(idle)
        until not intervals[threadId]
    end)

    return threadId
end

function ClearInterval(id)
    if not id then return end
    intervals[id] = nil
end

return {
    set = SetInterval,
    clear = ClearInterval
}