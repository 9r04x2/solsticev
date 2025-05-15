if not Config.UseSeatbelt then return debugPrint('[^2ADDON^7] Disabling initialization of seatbelt [/]') end
local initialized = false
Citizen.CreateThread(function()
    Wait(1000)
    LocalPlayer.state:set('seatbeltActive', false)
end)
Seatbelt = {}
Seatbelt.CanSwap = true
Seatbelt.Thread = function()
    Seatbelt.CanSwap = false
    Wait(250)
    if Threads.Vehicles.Data['vehicle'] == 0 then return end
    local class = GetVehicleClass(Threads.Vehicles.Data['vehicle'])
    if class == 8 or class == 13 then return end
    if not LocalPlayer.state['seatbeltActive'] then
        -- SEATBELT / CRASH
        Citizen.CreateThread(function()
            local speed = 0
            local velocity = 0
            local health = GetVehicleBodyHealth(Threads.Vehicles.Data['vehicle'])
            Seatbelt.CanSwap = true
            while not LocalPlayer.state['seatbeltActive'] and Threads.Vehicles.Data['vehicle'] ~= 0 do
                local prevSpeed = speed
                local prevVelocity = velocity
                local prevHealth = health
                local vector = GetEntitySpeedVector(Threads.Vehicles.Data['vehicle'], true).y

                speed = GetEntitySpeed(Threads.Vehicles.Data['vehicle']) * (Config.Metrics == 'mph' and 2.236936 or 3.6)
                health = GetVehicleBodyHealth(Threads.Vehicles.Data['vehicle'])
                velocity = GetEntityVelocity(Threads.Vehicles.Data['vehicle'], true) 
                
                local acceleration = (prevSpeed - speed) / GetFrameTime()

                if vector > 1.0 and 
                acceleration >= Config.Seatbelts.MinimalAcceleration and 
                prevSpeed >= Config.Seatbelts.MinSpeed and
                prevHealth > health and (prevHealth - health) >= Config.Seatbelts.MinimumDamage then
                    SetEntityCoords(Threads.Players.Data['ped'], Threads.Players.Data['coords'].x, Threads.Players.Data['coords'].y, Threads.Players.Data['coords'].z - 0.47, true, true, true)
                    SetPedToRagdoll(Threads.Players.Data['ped'], 1000, 1000, 0, 0, 0, 0)
                    SetEntityVelocity(Threads.Players.Data['ped'], prevVelocity.x, prevVelocity.y, prevVelocity.z)
                    Workers.Seatbelts.OnCrash(Threads.Vehicles.Data['vehicle'], Threads.Players.Data['ped'])
                    break
                end
                Wait(100)
            end
        end)
    else
        -- SEATBELTS / PREVENT FROM GETTING OUT
        Citizen.CreateThread(function()
            Seatbelt.CanSwap = true
            while LocalPlayer.state['seatbeltActive'] and Threads.Vehicles.Data['vehicle'] ~= 0 do
                DisableControlAction(0, 75, true)
                Wait(3)
            end
        end)
    end
end

Seatbelt.SwitchState = function()
    if not Seatbelt.CanSwap then return end
    local lastState = LocalPlayer.state['seatbeltActive']
    LocalPlayer.state:set('seatbeltActive', not lastState)
    NUI.SendMessage('SET_CARHUD_SEATBELT', {
        state = lastState,
        sfx = true
    })
end

RegisterCommand('seatbelt', Seatbelt.SwitchState)
RegisterKeyMapping('seatbelt', Config.KeyBinds['seatbelt'].description, 'KEYBOARD', Config.KeyBinds['seatbelt'].key)


--[[
    Event example
]]

--local seatbeltSerial = -1
local hasSeatbeltOn = false
Lib.OnEventTick('onVehicleStateChange', function(isInVehicle, entity)
    Seatbelt.Thread()
    if isInVehicle then
        SetUserRadioControlEnabled(false)
        SetVehRadioStation(Threads.Vehicles.Data['vehicle'], 'OFF')
        local class = GetVehicleClass(entity)
        if class ~= 8 and class ~= 13 then
            --[[if seatbeltSerial ~= -1 then
                DefaultNotifies.Update(seatbeltSerial, hasSeatbeltOn and 'SEATBELT |green=ON|' or 'SEATBELT |red=OFF|')
            else
                seatbeltSerial = DefaultNotifies.Add({
                    text = hasSeatbeltOn and 'SEATBELT |green=ON|' or 'SEATBELT |red=OFF|',
                    persistent = true
                })
            end]]

        end
    elseif not isInVehicle then
        LocalPlayer.state:set('seatbeltActive', false)
        --[[if seatbeltSerial ~= -1 then
            DefaultNotifies.Remove(seatbeltSerial)
            seatbeltSerial = -1
        end]]
        NUI.SendMessage('SET_CARHUD_SEATBELT', {
            state = false
        })
    end
end)

AddStateBagChangeHandler('seatbeltActive', ('player:%s'):format(GetPlayerServerId(PlayerId())), function(_, _, value)
    hasSeatbeltOn = value
    Seatbelt.Thread()
    NUI.SendMessage('SET_CARHUD_SEATBELT', {
        state = hasSeatbeltOn,
        sfx = false
    })
    -- if not seatbeltSerial then return end
    -- DefaultNotifies.Update(seatbeltSerial, hasSeatbeltOn and 'SEATBELT |green=ON|' or 'SEATBELT |red=OFF|')
end)