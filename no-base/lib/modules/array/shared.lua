function Array(array)
    local self = {}

    self.isEmpty = function()
        return next(array) ~= nil
    end

    self.concat = function(...)
        local args = table.pack(...)
        for k, v in ipairs(args) do
            for k1, v1 in ipairs(v) do
                table.insert(array, v1)
            end
        end
    end

    self.every = function(condition)
        for k, v in ipairs(array) do
            if not condition(v, k) then
                return false
            end
        end

        return true
    end

    self.includes = function(value, startIndex)
        startIndex = startIndex or 1

        for i = startIndex, #array do
            if value == array[i] then return true end
        end

        return false
    end

    self.indexOf = function(value, startIndex)
        startIndex = startIndex or 1

        for i = startIndex, #array do
            if value == array[i] then return i end
        end

        return -1
    end

    self.join = function(str)
        local newStr = ""
        str = str or ", "

        for k, v in ipairs(array) do
            newStr = newStr .. v .. (k ~= #array and str or "")
        end

        return newStr
    end

    self.lastIndexOf = function(value, startIndex)
        startIndex = startIndex or #array
        for i = startIndex, 1, -1 do
            if #array[i] == value then
                return i
            end
        end

        return -1
    end

    self.pop = function()
        return table.remove(array, #array)
    end

    self.length = function()
        return #array
    end

    self.push = function(item)
        table.insert(array, item)
    end

    self.reduce = function(condition, initialValue)
        initialValue = initialValue or 0

        for i=1, #array do
            initialValue = condition(initialValue, array[i], i, array)
        end

        return initialValue
    end

    self.reduceRight = function(condition, initialValue)
        initialValue = initialValue or 0

        for i = #array, 1, -1 do
            initialValue = condition(initialValue, array[i], i, array)
        end

        return initialValue
    end

    self.reverse = function()
        for i=1, math.floor(#array / 2) do
            array[i], array[#array - i + 1] = array[#array - i + 1], array[i]
        end
    end

    self.shift = function()
        local item = array[1]

        table.remove(array, 1)
        return item
    end

    self.unshift = function(...)
        for i=#arg, 1, -1 do
            table.insert(array, 1, arg[i])
        end
    end

    self.some = function(condition)
        for k, v in ipairs(array) do
            if condition(v, k) then
                return true
            end
        end

        return false
    end

    self.slice = function(startIndex, endIndex)
        startIndex = startIndex < 1 and #array - (startIndex * -1) or 1
        endIndex = endIndex < 1 and #array - (endIndex * -1) or #array

        local newArray = {}
        for i=startIndex, endIndex do
            if array[i] then
                table.insert(newArray, array[i])
            end
        end

        return newArray
    end

    self.splice = function(...)
        startIndex = arg[1] or 1
        removeCount = arg[2] or 0
        
        for i=0, removeCount do
            table.remove(array, startIndex)
        end

        for i=#arg, 3, -1 do
            table.insert(array, startIndex, arg[i])
        end
    end

    self.toString = function()
        local str = ""

        for k, v in ipairs(array) do
            str = str .. v .. (k == #array and "" or ", ")
        end
    end

    self.forEach = function(func)
        for k, v in ipairs(array) do
            func(v, k)
        end
    end

    self.findIndex = function(condition)
        for k, v in ipairs(array) do
            if condition(v, k) then
                return k
            end
        end

        return -1
    end

    self.sort = function(condition)
        table.sort(array, condition)
    end

    self.map = function(func)
        local newArray = {}

        for k, v in ipairs(array) do
            newArray[k] = func(v, k)
        end

        return newArray
    end

    self.find = function(condition)
        for k, v in ipairs(array) do
            if condition(v, k) then
                return array[k]
            end
        end
    end

    self.filter = function(condition)
        local filteredArray = {}

        for k, v in ipairs(array) do
            if condition(v, k) then
                table.insert(filteredArray, v)
            end
        end

        return filteredArray
    end

    return self
end

return Array