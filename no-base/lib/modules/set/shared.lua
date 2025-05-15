Set = {}

function Set:New(_t)
    local this = setmetatable({
        size = 0,
        entries = {},
        __entries = {}
    }, {
        __len = function(self)
            return self.size
        end,
        __type = function(self)
            return "Set"
        end
    })

    setmetatable(this.entries, {
        __index = function(self, key)
            return this.__entries[key]
        end,
        __newindex = function(self, key, val)
            local prev = this.__entries[key]

            if prev and not val then
                this.size -= 1
            elseif not prev and val then
                this.size += 1
            end

            rawset(this.__entries, key, val)
        end
    })

    if _t and type(_t) == "table" then
        for _, val in pairs(_t) do
            this[val] = true
        end
    end

    setmetatable(this, self)
    self.__index = self

    return this
end

function Set:Add(...)
    local args = {...}

    for _, key in pairs(args) do
        self.entries[key] = true
    end
end

function Set:Delete(key)
    self.entries[key] = nil
end

function Set:Has(key)
    return self.entries[key] ~= nil
end

return Set