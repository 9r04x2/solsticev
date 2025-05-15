import "interval"

---@class ThreadManager
---@field intervals table<string, number>
ThreadManager = {}
ThreadManager.__index = ThreadManager

---@return ThreadManager
function ThreadManager:New()
    return setmetatable({
        intervals = {}
    }, self)
end

---@param key string
---@param cb function
---@param idle? number
function ThreadManager:Add(key, cb, idle)
    if self.intervals[key] then return end
    self.intervals[key] = SetInterval(cb, idle)
end

---@param key string
function ThreadManager:Remove(key)
    local intervalId = self.intervals[key]

    if not intervalId then return end
    self.intervals[key] = nil
    ClearInterval(intervalId)
end

function ThreadManager:Clear()
    for key, intervalId in pairs(self.intervals) do
        self.intervals[key] = ClearInterval(intervalId)
    end
end

ThreadManager.new = ThreadManager.New
ThreadManager.add = ThreadManager.Add
ThreadManager.remove = ThreadManager.Remove
ThreadManager.clear = ThreadManager.Clear

return ThreadManager
