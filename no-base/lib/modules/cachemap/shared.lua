import("cache", "timeout")

---@class CacheMap
---@field map table<string, {cache: Cache, timeoutId: number}>
---@field cb function
---@field timeout number
local CacheMap = {}
CacheMap.__index = CacheMap

---@param cb function
---@param timeout number
---@return CacheMap
function CacheMap:New(cb, timeout)
    return setmetatable({
        map = {},
        cb = cb,
        timeout = timeout
    }, self)
end

---@param key string
---@vararg any
---@return any
function CacheMap:Get(key, ...)
    local cacheRecord = self.map[key]

    if not cacheRecord then
        self.map[key] = {
            cache = UseCache(self.cb, self.timeout),
            timeoutId = setTimeout(function()
                self:Remove(key)
            end, self.timeout)
        }
        return self.map[key].cache:Get(key, ...)
    end

    clearTimeout(cacheRecord.timeoutId)
    cacheRecord.timeoutId = setTimeout(function()
        self:Remove(key)
    end, self.timeout)

    return cacheRecord.cache:Get(key, ...)
end

---@param key string
function CacheMap:Remove(key)
    local cacheRecord = self.map[key]

    if not cacheRecord then return end

    cacheRecord.cache:Clear()
    self.map[key] = nil
end

---@param key string
function CacheMap:Clear(key)
    if not key then
        for _, cacheRecord in pairs(self.map) do
            cacheRecord.cache:Clear()
        end

        return
    end

    local cacheRecord = self.map[key]

    if not cacheRecord then return end

    cacheRecord.cache:Clear()
end

---@param cb function
---@param timeout number
---@return CacheMap
function UseCacheMap(cb, timeout)
    return CacheMap:New(cb, timeout)
end

return UseCacheMap