import {"threadmanager", "eventbus"}
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local listeners = {}
local ZoneListener = {}
ZoneListener.__index = ZoneListener

local function hasActionInEntry(entry)
    return entry.onPressed ~= nil or entry.onHold ~= nil
end

function ZoneListener:New(options)
    return setmetatable({
        active = false,
        entries = options.entries or #options > 0 and options or {},
        availableKeys = {"E", "G", "H", "J", "K", "L"},
        threads = ThreadManager:New()
    }, self)
end

function ZoneListener:Start(data)
    if self.active then return end
    self.active = true
    self.data = data
    self.events = EventBus:New()

    local alerts = {}

    for entryIdx, entry in pairs(self.entries) do
        if not entry.isEnabled or entry.isEnabled(data) then
            alerts[#alerts + 1] = self:GetEntryContext(entry)
            self:ListenEntry(entry, entryIdx)

            if entry.onEnter then
                self.events:On("enter", entry.onEnter)
            end

            if entry.onExit then
                self.events:On("exit", entry.onExit)
            end
        end
    end

    self.events:Emit("enter", self.data)
    self:ShowIndicators(alerts)
end

function ZoneListener:CloseIndicators()
    if not self.indicator then return end

    if self.indicator == "single" then
        return BASE:CloseIndicator()
    end

    BASE:CloseIndicators()
    self.indicator = nil
end

function ZoneListener:ShowIndicators(alerts)
    if #alerts == 0 then return end
    self.indicator = #alerts == 1 and "single" or "group"

    if self.indicator == "single" then
        return BASE:SetIndicator(alerts[1])
    end

    BASE:SetIndicators(alerts)
end

function ZoneListener:ListenEntry(entry, entryIdx)
    if not entry.key then return end
    
    if entry.onPressed then
        self.threads:Add(("entry_listener_%d"):format(entryIdx), function()
            if IsControlJustPressed(0, Keys[entry.key]) and (not entry.isEnabled or entry.isEnabled(self.data)) then
                entry.onPressed(self.data, function()
                    self:Stop()
                end)
            end
        end, 5)
    end
end

function ZoneListener:GetEntryContext(entry)
    entry.key = entry.key or hasActionInEntry(entry) and table.remove(self.availableKeys, 1) or nil

    return {
        key = entry.key,
        text = entry.text or type(entry.label) == "function" and entry.label(self.data) or entry.label,
        icon = entry.icon
    }
end

function ZoneListener:Stop()
    if not self.active then return end

    self.threads:Clear()
    self.events:Emit("exit", self.data)
    self.events:Destroy()
    self.events = nil
    self.data = nil
    self.active = false
    self:CloseIndicators()
end

function UsePolyHook(zoneName, entries)
    if listeners[zoneName] then
        listeners[zoneName]:Stop()
    end

    if #entries == 0 and next(entries) then
        entries = {entries}
    end

    listeners[zoneName] = ZoneListener:New(entries)

    return function()
        listeners[zoneName]:Stop() 
        listeners[zoneName] = nil 
    end
end

AddEventHandler("zones:enter", function(zone, data)
    local listener = listeners[zone]
    
    if not listener then return end

    listener:Start(data)
end)

AddEventHandler("zones:exit", function(zone)
    local listener = listeners[zone]

    if not listener then return end

    listener:Stop()
end)

return UsePolyHook
