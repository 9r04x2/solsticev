import {"ThreadManager", "Counter"}

local ZONE_KINDS <const> = {
    BOX = "box",
    POLY = "poly",
    SPHERE = "sphere"
}

local counter = Counter:new()
local function generateZoneId()
    return ("_%s_%s"):format(_RESOURCE_NAME, counter:next())
end

local function createSafeHandler(cb, errMsg)
    return function(...)
        local status, result = pcall(cb, ...)

        if not status then
            return tracing:error(("%s: %s"):format(errMsg, result))
        end
        
        return result
    end
end

local Zone = {}
Zone.__index = Zone
Zone.__tostring = function(self)
    return ("Zone<%s, %s, %s>"):format(self.kind, self.name, self.id)
end
Zone.__call = function(self)
    return self:Destroy()
end

function Zone:New(name, kind, options)
    assert(type(name) == "string", "Name must be a string")
    assert(type(kind) == "string", "Kind must be a string")
    assert(type(options) == "table", "Options must be a table")

    if not table.contains(ZONE_KINDS, kind) then
        error(("Invalid zone kind: %s"):format(kind))
    end

    local this = setmetatable({
        id = options.id or generateZoneId(),
        name = name,
        kind = kind,
        inside = false,
        handlers = {}
    }, self)

    this:Init(options)

    return this
end

function Zone:Init(options)
    if self.kind == ZONE_KINDS.BOX then
        options.id = self.id
        self.zone = BASE:CreateBoxZone(self.name, options)
    elseif self.kind == ZONE_KINDS.POLY then
        options.id = self.id
        self.zone = BASE:CreatePolyZone(self.name, options)
    elseif self.kind == ZONE_KINDS.SPHERE then
        options.id = self.id
        self.zone = BASE:CreateSphereZone(self.name, options)
    end

    self:InitHandlers()
end

function Zone:InitHandlers()
    self:OnEnter(function()
        self.inside = true
    end)

    self:OnExit(function()
        self.inside = false
    end)

    self.handlers[#self.handlers + 1] = onResourceStop(function()
        self:Destroy()
    end)
end

function Zone:IsInside()
    return self.inside
end

function Zone:OnEnter(cb)
    self.handlers[#self.handlers + 1] = AddEventHandler(("zones::%s::%s::enter"):format(self.name, self.id), createSafeHandler(cb, ("Error in %s enter handler"):format(self)))
end

function Zone:OnExit(cb)
    self.handlers[#self.handlers + 1] = AddEventHandler(("zones::%s::%s::exit"):format(self.name, self.id), createSafeHandler(cb, ("Error in %s exit handler"):format(self)))
end

function Zone:OnEnterByName(cb)
    self.handlers[#self.handlers + 1] = AddEventHandler(("zones::%s::enter"):format(self.name), createSafeHandler(cb, ("Error in %s enter by name handler"):format(self)))
end

function Zone:OnExitByName(cb)
    self.handlers[#self.handlers + 1] = AddEventHandler(("zones::%s::enter"):format(self.name), createSafeHandler(cb, ("Error in %s exit by name handler"):format(self)))
end

function Zone:Destroy()
    BASE:DestroyZone(self.name, self.id)
    
    for i = 1, #self.handlers do
        RemoveEventHandler(self.handlers[i])
    end

    self.handlers = {}
end

function Zone:GetDetails()
    return BASE:GetZoneDetails(self.name, self.id)
end

function Zone:Contains(coords)
    return BASE:IsPointInsideZone(self.name, self.id, coords)
end

Zone.new = Zone.New
Zone.isInside = Zone.IsInside
Zone.onEnter = Zone.OnEnter
Zone.onExit = Zone.OnExit
Zone.onEnterByName = Zone.OnEnterByName
Zone.onExitByName = Zone.OnExitByName
Zone.destroy = Zone.Destroy
Zone.getDetails = Zone.GetDetails
Zone.contains = Zone.Contains

function CreateBoxZone(zoneName, options)
    return Zone:new(zoneName, ZONE_KINDS.BOX, options)
end

function CreatePolyZone(zoneName, options)
    return Zone:new(zoneName, ZONE_KINDS.POLY, options)
end

function CreateSphereZone(zoneName, options)
    return Zone:new(zoneName, ZONE_KINDS.SPHERE, options)
end

return {
    CreateBoxZone = CreateBoxZone,
    CreatePolyZone = CreatePolyZone,
    CreateSphereZone = CreateSphereZone
}
