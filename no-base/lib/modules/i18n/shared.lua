local LOCALE = {}

function _(text, format)
    local text = LOCALE[text] or text

    if not format then return text end

    for prefix, val in pairs(format) do
        text = text:gsub("{" .. prefix .. "}", val)
    end

    return text
end

local lang = GetResourceMetadata(_RESOURCE_NAME, "locale") or "en"
local file = LoadResourceFile(_RESOURCE_NAME, "locales/" .. lang .. ".json")
local success = pcall(function() LOCALE = json.decode(file) end)

LOCALE = success and LOCALE or {}

local function removeEmpty(t)
    if not t then return end
    for k, v in pairs(t) do
        if type(v) == "string" and v:len() == 0 then t[k] = nil end
    end

    return t
end

LOCALE = removeEmpty(LOCALE)
LOCALE.ui = removeEmpty(LOCALE.ui)

if _IS_SERVER then return end

CreateThread(function()
    if LOCALE.ui and type(LOCALE.ui) == "table" then
        import("NUIMessager")
        NUIMessager:Send("onSetLocale", LOCALE.ui)
        LOCALE.ui = nil
    end
end)
