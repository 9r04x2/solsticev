local LoadResourceFile = LoadResourceFile
local SaveResourceFile = SaveResourceFile
local WRITE_DELAY <const> = 5000
local allowedExtensions = {
    "txt",
    "json",
    "log"
}

---@class ResourceFile
---@field resource string
---@field path string
---@field extension string
ResourceFile = {}
ResourceFile.__index = ResourceFile
ResourceFile.__tostring = function(self)
    return ("ResourceFile<%s/%s>"):format(self.resource, self.path)
end

---@param resource string
---@param path string
---@return ResourceFile
function ResourceFile:New(resource, path)
    assert(type(resource) == "string", "ResourceFile:New(resource: string, path: string) -> table")
    assert(type(path) == "string", "ResourceFile:New(resource: string, path: string) -> table")

    local extension = path:match("%.([^%.]+)$")

    if not table.contains(allowedExtensions, extension) then
        error("ResourceFile:New(resource: string, path: string) -> table | Invalid file extension: " .. extension)
    end

    return setmetatable({
        resource = resource,
        path = path,
        extension = extension
    }, self)
end

---@return string | table 
function ResourceFile:Read()
    local status, content = pcall(LoadResourceFile, self.resource, self.path)

    if not status then
        return nil
    end

    if self.extension == "json" then
        local status, result = pcall(json.decode, content)

        if not status then
            tracing:error(("[%s] Failed to decode json"):format(self))
            return
        end

        return result
    end

    return content
end

---@param content string | function | table
---@return boolean
function ResourceFile:Write(content)
    assert(type(content) == "string" or isFunction(content) or self.extension == "json" and type(content) == "table", "ResourceFile:Write(content: string | function | table) | Invalid content type (table only allowed for json files).")
    assert(_IS_SERVER, "ResourceFile:Write(content: string) | This function can only be called on the server side.")

    if isFunction(content) then
        local oldContent = self:Read() or (self.extension == "json" and {} or "")
        content = content(oldContent)
    end

    if type(content) == "table" then
        if self.extension ~= "json" then
            tracing:warn(("[%s] Attempted to write a table to a non-json file."):format(self))
            return false
        end
        content = json.encode(content)
    end

    return SaveResourceFile(self.resource, self.path, content, -1)
end

ResourceFile.new = ResourceFile.New
ResourceFile.read = ResourceFile.Read
ResourceFile.write = ResourceFile.Write

return ResourceFile