import "Counter"

local EVENT_PREFIX <const> = ("__no_eventbus_%s"):format(_RESOURCE_NAME:lower())
local id = Counter:New()

EventBus = {}
EventBus.__index = EventBus
EventBus.__tostring = function(self)
    return ("EventBus<%s>"):format(self.id)
end
EventBus.__gc = function(self)
    self:Destroy()
end

---@param options? table
---@return EventBus
function EventBus:New(options)
    local id = options?.id or id:Next()
    return setmetatable({
        id = id,
        prefix = ("%s_%s"):format(EVENT_PREFIX, tostring(id)),
        handlers = {}
    }, self)
end

---@param eventName string
---@param cb fun(...)
---@return table
function EventBus:createHandler(eventName, cb)
    assert(type(eventName) == "string", ("%s | Event name must be a string"):format(self))
    assert(isFunction(cb), ("%s | Event handler must be a function"):format(self))

    return AddEventHandler(("%s_%s"):format(self.prefix, eventName), function(...)
        local success, result = pcall(cb, ...)

        if not success then
            CancelEvent()
            tracing:error(("%s | Error in event handler %s: %s"):format(self, eventName, result))
        end

        return result
    end)
end

---@param eventName string
---@vararg any
---@return EventBus
function EventBus:Emit(eventName, ...)
    TriggerEvent(("%s_%s"):format(self.prefix, eventName), ...)

    return self
end

---@param eventName string
---@param cb fun(...)
---@return EventBus
function EventBus:On(eventName, cb)
    self.handlers[#self.handlers + 1] = self:createHandler(eventName, cb)
    
    return self
end

function EventBus:Destroy()
    for i = 1, #self.handlers do
        RemoveEventHandler(self.handlers[i])
    end

    return self
end

EventBus.new = EventBus.New
EventBus.on = EventBus.On
EventBus.emit = EventBus.Emit
EventBus.destroy = EventBus.Destroy

return EventBus
