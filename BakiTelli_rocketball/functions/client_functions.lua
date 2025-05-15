local Framework, frameworkName = getFramework()


notify = function(text)
    if frameworkName == "esx" then
        TriggerEvent('esx:showNotification', text)
    elseif frameworkName == "qb" then
        TriggerEvent('QBCore:Notify', text)
    end
end

GiveKey = function(plate)
    TriggerEvent("vehiclekeys:client:SetOwner", plate)
    -- enter you key system trigger
end

startGameExports = function()
    -- Enter your start game logic
    -- example : close hud, close stress etc.
end

finishGameExports = function()
    -- Enter your finish game logic
    -- example : open hud, open stress etc.
end

addFuelExports = function(vehicle)
    SetVehicleFuelLevel(vehicle, 100.0)
    if GetResourceState('LegacyFuel') == 'started' then
        exports['LegacyFuel']:SetFuel(vehicle, 100)
    elseif GetResourceState('ps-fuel') == 'started' then
        exports['ps-fuel']:SetFuel(vehicle, 100)
    elseif GetResourceState('cd-fuel') == 'started' then
        exports['cd_fuel']:SetFuel(vehicle, 100)
    elseif GetResourceState('fuel-injection') == 'started' then
        exports['fuel-injection']:SetFuel(vehicle, 100)
    elseif GetResourceState('debux-fuelv3') == 'started' then
        exports['debux-fuelv3']:SetFuel(vehicle, 100)
    elseif GetResourceState("ox_fuel") == "started" then
        Entity(vehicle).state.fuel = 100.0
    else
        print("--------------------------------")
        print("No fuel exports found")
        print("--------------------------------")
        -- Other fuel exports
        -- add here other fuel exports
    end
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
  
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
  end