---@class Counter
---@field value number
Counter = {}
Counter.__index = Counter

---@param initialValue? number
function Counter:New(initialValue)
    return setmetatable({
        value = tonumber(initialValue) or 0
    }, self)
end

---@return number
function Counter:Get()
    return self.value
end

---@return number
function Counter:Next()
    self:Increase()
    return self.value
end

function Counter:Increase()
    self.value += 1
end

function Counter:Decrease()
    self.value -= 1
end

---@param newValue number
function Counter:Set(newValue)
    assert(type(newValue) == "number", "Counter:Set(newValue: number) -> void")
    self.value = newValue
end

Counter.new = Counter.New
Counter.get = Counter.Get
Counter.next = Counter.Next
Counter.increase = Counter.Increase
Counter.decrease = Counter.Decrease
Counter.set = Counter.Set

return Counter
