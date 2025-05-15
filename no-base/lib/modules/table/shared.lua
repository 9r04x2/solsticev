local pairs = pairs
local ipairs = ipairs
local tostring = tostring
local table_clone = table.clone
local table_concat = table.concat

function table.toMap(t, mapFn)
    local map = {}

    if mapFn then
        for key, value in pairs(t) do
            map[mapFn(value)] = value
        end
    else
        for key, value in pairs(t) do
            map[value] = value
        end
    end

    return map
end

function table.map(t, mapFn)
    local map = {}

    for key, value in pairs(t) do
        map[key] = mapFn(value, key)
    end

    return map
end

function table.imap(t, mapFn)
    local map = {}

    for key, value in ipairs(t) do
        map[key] = mapFn(value, key)
    end

    return map
end

function table.filter(t, filterFn)
    local map = {}

    for key, value in pairs(t) do
        if filterFn(value, key) then
            map[key] = value
        end
    end

    return map
end

function table.ifilter(t, filterFn)
    local arr = {}

    for idx, value in ipairs(t) do
        if filterFn(value, idx) then
            arr[#arr + 1] = value
        end
    end

    return arr
end

function table.hasKey(t, key)
    return t[key] ~= nil
end

function table.deepClone(t)
    t = table_clone(t)

    for k, v in pairs(t) do
        if type(v) == "table" then
            t[k] = table.deepClone(v)
        end
    end

    return t
end

function table.contains(t, val)
    for _, value in pairs(t) do
        if value == val then
            return true
        end
    end

    return false
end

function table.icontains(t, val)
    for _, value in ipairs(t) do
        if value == val then
            return true
        end
    end

    return false
end

function table.merge(t1, t2, ...)
    assert(type(t1) == "table", "table.merge: t1 is not a table")
    assert(type(t2) == "table", "table.merge: t2 is not a table")

    for key, value in pairs(t2) do
        t1[key] = value
    end

    if ... then
        return table.merge(t1, ...)
    end

    return t1
end

function table.imerge(t1, t2, ...)
    assert(type(t1) == "table", "table.imerge: t1 is not a table")
    assert(type(t2) == "table", "table.imerge: t2 is not a table")

    for _, value in ipairs(t2) do
        t1[#t1 + 1] = value
    end

    if ... then
        return table.imerge(t1, ...)
    end

    return t1
end

function table.every(t, predicate)
    assert(type(t) == "table", "table.every: t is not a table")
    assert(type(predicate) == "function", "table.every: predicate is not a function")

    for key, value in pairs(t) do
        if not predicate(value, key) then
            return false
        end
    end

    return true
end

function table.ievery(t, predicate)
    assert(type(t) == "table", "table.ievery: t is not a table")
    assert(type(predicate) == "function", "table.ievery: predicate is not a function")

    for key, value in ipairs(t) do
        if not predicate(value, key) then
            return false
        end
    end

    return true
end

function table.some(t, predicate)
    assert(type(t) == "table", "table.some: t is not a table")
    assert(type(predicate) == "function", "table.some: predicate is not a function")

    for key, value in pairs(t) do
        if predicate(value, key) then
            return true
        end
    end

    return false
end

function table.isome(t, predicate)
    assert(type(t) == "table", "table.isome: t is not a table")
    assert(type(predicate) == "function", "table.isome: predicate is not a function")

    for key, value in ipairs(t) do
        if predicate(value, key) then
            return true
        end
    end

    return false
end

function table.find(t, predicate)
    assert(type(t) == "table", "table.find: t is not a table")
    assert(type(predicate) == "function", "table.find: predicate is not a function")

    for key, value in pairs(t) do
        if predicate(value, key) then
            return value, key
        end
    end

    return nil
end

function table.ifind(t, predicate)
    assert(type(t) == "table", "table.ifind: t is not a table")
    assert(type(predicate) == "function", "table.ifind: predicate is not a function")

    for key, value in ipairs(t) do
        if predicate(value, key) then
            return value, key
        end
    end

    return nil
end

function table.findKey(t, predicate)
    assert(type(t) == "table", "table.findKey: t is not a table")
    assert(type(predicate) == "function", "table.findKey: predicate is not a function")

    for key, value in pairs(t) do
        if predicate(value, key) then
            return key
        end
    end

    return nil
end

function table.findIndex(t, predicate)
    assert(type(t) == "table", "table.findIndex: t is not a table")
    assert(type(predicate) == "function", "table.findIndex: predicate is not a function")

    for key, value in ipairs(t) do
        if predicate(value, key) then
            return key
        end
    end

    return nil
end

function table.keyOf(t, value)
    for key, val in pairs(t) do
        if val == value then
            return key
        end
    end
    
    return nil
end

function table.indexOf(t, value)
    for key, val in ipairs(t) do
        if val == value then
            return key
        end
    end
    
    return nil
end

function table.convertAndConcat(t, sep)
    local buffer = {}

    for i, value in ipairs(t) do
        buffer[i] = tostring(value)
    end

    return table_concat(buffer, sep)
end

function table.keys(t)
    assert(type(t) == "table", "table.keys: t is not a table")
    local keys = {}
    
    for key in pairs(t) do
        keys[#keys + 1] = key
    end

    return keys
end

function table.entries(t)
    assert(type(t) == "table", "table.entries: t is not a table")
    local entries = {}
    
    for key, value in pairs(t) do
        entries[#entries + 1] = { key, value }
    end

    return entries
end

function table.values(t)
    assert(type(t) == "table", "table.values: t is not a table")
    local values = {}
    
    for _, value in pairs(t) do
        values[#values + 1] = value
    end

    return values
end

function table.reduce(t, reducer, initialValue)
    assert(type(t) == "table", "table.reduce: t is not a table")
    assert(isFunction(reducer), "table.reduce: reducer is not a function")
    local accumulator = initialValue
    
    for key, value in pairs(t) do
        accumulator = reducer(accumulator, value, key)
    end

    return accumulator
end

function table.ireduce(t, reducer, initialValue)
    assert(type(t) == "table", "table.ireduce: t is not a table")
    assert(isFunction(reducer), "table.ireduce: reducer is not a function")
    local accumulator = initialValue
    
    for key, value in ipairs(t) do
        accumulator = reducer(accumulator, value, key)
    end

    return accumulator
end
