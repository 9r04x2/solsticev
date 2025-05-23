local random = math.random

function uuid()
    local template ="xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"

    return template:gsub("[xy]", function (c)
        local v = (c == "x") and random(0, 0xf) or random(8, 0xb)
        return string.format("%x", v)
    end)
end

return {
    uuid = uuid
}