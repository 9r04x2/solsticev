exports('getPlayerMoney', function()
    return getMoney()
end)

exports('getPlayerName', function()
    return getPlayerName()
end)

exports('pId', function()
    return getPlayerId()
end)

exports('mugShot', function(ped) 
    return GetMugShot(ped)
end)

exports('pJob', function() 
    return getPlayerJob()
end)

exports('setLang', function() 
    return G9_CORE.lang
end)

exports('images', function() 
    return G9_CORE.inventoryImages
end)

exports('getfps', function() 
    return getFps()
end)



exports('getVehProps', function(vehicle) 
    return getVehicleProperties(vehicle)
end)

exports('vehicleKey', function() 
    return vehicleKey()
end)

exports('getFw', function() 
    return G9_CORE.framework
end)

exports('core', function() 
    return G9_CORE.core
end)
