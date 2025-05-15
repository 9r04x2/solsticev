local table_concat = table.concat
local function createColorFn(color)
    return function(text)
        return table_concat({color, text, "^0"}, "")
    end
end

lightred = createColorFn("^1")
red = createColorFn("^8")
green = createColorFn("^2")
yellow = createColorFn("^3")
darkblue = createColorFn("^4")
blue = createColorFn("^5")
purple = createColorFn("^6")
pink = createColorFn("^9")
