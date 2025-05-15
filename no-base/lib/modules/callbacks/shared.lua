---@class Callbacks
---@field callbacks function[]
Callbacks = {}
Callbacks.__index = Callbacks

---@return Callbacks
function Callbacks:New()
    return setmetatable({
        callbacks = {}
    }, self)
end

---@param cb function
function Callbacks:Add(cb)
    self.callbacks[#self.callbacks + 1] = cb
end

---@vararg any
function Callbacks:Execute(...)
    local args = {...}
   
    for _, cb in ipairs(self.callbacks) do
        CreateThread(function()
            cb(table.unpack(args))
        end)
    end
end

---@vararg any
---@return boolean
function Callbacks:Validate(...)
    local args = {...}

    return table.ievery(self.callbacks, function(cb) return cb(table.unpack(args)) end)
end

return Callbacks