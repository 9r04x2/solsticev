Debug = {}

function Debug:IsEnabled()
    return GetResourceMetadata(_RESOURCE_NAME, "no_enable_debug", 0) ~= nil
end

-- Check if debug is enabled
setmetatable(Debug, {
    __call = Debug:IsEnabled() and function(self, ...)
        print(...)    
    end or function() end
})
