import("interval")

---@class Thread
---@field cb function
---@field idle number
Thread = {}
Thread.__index = Thread

---@param cb function
---@param idle? number
---@return Thread
function Thread:New(cb, idle)
    return setmetatable({
        cb = cb,
        idle = idle
    }, self)
end

---@vararg any
function Thread:Start(...)
    self:stop()
    self.id = SetInterval(self.cb, self.id, ...)
end

function Thread:Stop()
    self.id = ClearInterval(self.id)
end

Thread.new = Thread.New
Thread.start = Thread.Start
Thread.stop = Thread.Stop

return Thread