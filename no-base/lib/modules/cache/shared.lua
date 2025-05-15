import("timeout")

---@class Cache
---@field cb function
---@field timeout number
---@field updated boolean
Cache = {}
Cache.__index = Cache

---@param cb function
---@param timeout number
---@return Cache
function Cache:New(cb, timeout)
    return setmetatable({
        cb = cb,
        timeout = timeout,
        updated = false
    }, self)
end

---@vararg any
---@return any
function Cache:Get(...)
    if not self.updated then
        self.data = self.cb(...)
        self.updated = true
        self.timeoutId = setTimeout(self.timeout, function()
            self.updated = false
            self.data = nil
            self.timeoutId = nil
            collectgarbage()
        end)
    end
    
    return self.data
end

function Cache:Clear()
    self.updated = false
    self.data = nil
    self.timeoutId = clearTimeout(self.timeoutId)
    collectgarbage()
end

---@param cb function
---@param timeout number
---@return Cache
function UseCache(cb, timeout)
    return Cache:New(cb, timeout)
end

Cache.new = Cache.New
Cache.get = Cache.Get
Cache.clear = Cache.Clear

return UseCache