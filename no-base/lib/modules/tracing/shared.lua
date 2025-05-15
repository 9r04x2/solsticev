local KVP_KEY <const> = "no_trace"

if GetResourceKvpInt("tracing_session") ~= _CURRENT_SESSION then
    DeleteResourceKvp(KVP_KEY)
    SetResourceKvpInt("tracing_session", _CURRENT_SESSION)
end

tracing = {}

function tracing:IsEnabled()
    if GetResourceMetadata("no-base", "no_enable_tracing") == nil then return false end

    local status, enabledResources = pcall(json.decode, GetResourceMetadata("no-base", "no_enable_tracing_extra"))

    if not status then return false end

    return table.contains(enabledResources, _RESOURCE_NAME)
end

-- Check if tracing is enabled
if not tracing:IsEnabled() then
    -- Check if debug is enabled or not so we can disable tracing entirely
    if not Debug:IsEnabled() then
        local function noop () end

        tracing.log = noop
        tracing.warn = noop
        tracing.info = noop
        tracing.error = noop

        return
    end

    import "colors"
    local table_concat = table.convertAndConcat
    local red = red
    local yellow = yellow
    local blue = blue

    function tracing:log(...)
        Debug(table_concat({"[LOG]", ...}, " "))
    end

    function tracing:warn(...)
        Debug(yellow(table_concat({"[WARN]", ...}, " ")))
    end

    function tracing:info(...)
        Debug(blue(table_concat({"[INFO]", ...}, " ")))
    end

    function tracing:error(...)
        Debug(red(table_concat({"[ERROR]", ...}, " ")))
    end

    return
end

import "colors"

local WRITE_DELAY <const> = 5000
local table_concat = table.convertAndConcat
local red = red
local yellow = yellow
local blue = blue
local GetResourceKvpString = GetResourceKvpString
local SetResourceKvp = _IS_SERVER and SetResourceKvpNoSync or SetResourceKvp
local GetGameTimer = GetGameTimer
local logs = {}
local writing = false

local function getTrace()
    return GetResourceKvpString(KVP_KEY) or ""
end

local function write()
    local newLogs = table_concat(logs, "\n")
    logs = {}
    writing = false
    local savedLogs = getTrace()
    SetResourceKvp(KVP_KEY, table_concat({savedLogs, newLogs}, "\n"))
end

local function writeDelayed()
    if writing then return end
    writing = true
    SetTimeout(WRITE_DELAY, write)
end

local function addLog(message)
    logs[#logs + 1] = ("%d %s"):format(GetGameTimer(), message)
    writeDelayed()
end

function tracing:log(...)
    local log = table_concat({"[LOG]", ...}, " ")
    Debug(log)
    addLog(log)
end

function tracing:warn(...)
    local log = table_concat({"[WARN]", ...}, " ")
    Debug(yellow(log))
    addLog(log)
end

function tracing:info(...)
    local log = table_concat({"[INFO]", ...}, " ")
    Debug(blue(log))
    addLog(log)
end

function tracing:error(...)
    local log = table_concat({"[ERROR]", ...}, " ")
    Debug(red(log))
    addLog(log)
end

if _IS_SERVER then
    -- Export resource trace to other resources for server
    exports("getTrace", getTrace)
end

AddEventHandler("onResourceStart", function(resName)
    if resName ~= _RESOURCE_NAME then return end
    addLog("[INFO] Starting resource")
end)

AddEventHandler("onResourceStop", function(resName)
    if resName ~= _RESOURCE_NAME then return end
    logs[#logs + 1] = ("%d %s"):format(GetGameTimer(), "[INFO] Stopping resource")
    write()
end)
