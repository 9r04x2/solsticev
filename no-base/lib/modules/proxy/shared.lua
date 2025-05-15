---@class Proxy
Proxy = {}

---@param target table
---@param handler table
---@return Proxy
function Proxy:New(target, handler)
    assert(type(target) == "table", "Proxy:New(target: table, handler: table) -> table")
    assert(type(handler) == "table", "Proxy:New(target: table, handler: table) -> table")

    return setmetatable({}, {
        __index = function(_, key)
            -- Allow access to the target table
            if key == "__proxy" then
                return target
            end

            return handler.get and handler.get(target, key) or target[key]
        end,
        __newindex = function(_, key, value)
            if handler.set then
                return handler.set(target, key, value)
            end

            target[key] = value
        end,
        __pairs = function()
            return pairs(target)
        end
    })
end

return Proxy
