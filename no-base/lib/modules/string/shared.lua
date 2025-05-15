function string:split(sep)
    sep = sep or "%s"
    local t = {}
    for _str in self:gmatch("([^"..sep.."]+)") do
        t[#t + 1] = _str
    end
    return t
end

function string:at(index)
    return self:sub(index, index)
end

function string:replace(old, new)
    return self:gsub(old, new)
end

function string:startsWith(prefix)
    return self:sub(1, #prefix) == prefix
end

function string:endsWith(suffix)
    return self:sub(-#suffix) == suffix
end

function string:capitalize()
    return self:at(1):upper() .. self:sub(2):lower()
end

function string:decapitalize()
    return self:at(1):lower() .. self:sub(2):lower()
end
