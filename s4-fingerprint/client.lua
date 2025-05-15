MenuIsOpen = false
CacheId = 0 -- for the fingerprint source   
FastCache = 0  
Gunshot = false

PlayerData = {}

OpenMenu = function()
    PlayerData = Framework.GetPlayerData()
  
    access = false
    for k,v in pairs(Config.AccessJobList) do
        if PlayerData.job.name == v then
            access = true
        end
    end

    if not access then
        Notify('Fingerprint', 'Bu sisteme erişimin yok.', 'error')
        return
    end
 
    SetNuiFocus(1, 1)
    SendNUIMessage({ action = 'open'})
    SetCursorLocation(0.87, 0.7)
    SetNuiFocusKeepInput(1)
    MenuIsOpen = true
    DisablePunch()
end

RegisterNetEvent('s4-fingerprint:client:openMenu')
AddEventHandler('s4-fingerprint:client:openMenu', OpenMenu)
 
if Config.EnableCommand then
    RegisterCommand(Config.Command, OpenMenu)
end

if Config.EnableControl then
    RegisterKeyMapping(Config.Command, 'Open Fingerprint Menu', 'keyboard', Config.Key)
end

RegisterNUICallback('allowShareMyData', function(data, cb)
    TriggerServerEvent('s4-fingerprint:server:allowShareMyData', GetPlayerServerId(PlayerId()), CacheId)
end)

RegisterNUICallback('scan', function(data, cb)
    local closestPlayer, closestDistance = Framework.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 2.0 then
        FastCache = GetPlayerServerId(closestPlayer)
        TriggerServerEvent('s4-fingerprint:server:requestScan', GetPlayerServerId(PlayerId()), FastCache)
    else
        Notify('Handcuff', 'Yakınlarda kimse yok.', 'error')
        return cb('error')
    end
end)

RegisterNetEvent('s4-fingerprint:client:scanResult')
AddEventHandler('s4-fingerprint:client:scanResult', function(data)
    SendNUIMessage({ action = 'scanResult', result = data})
end)

RegisterNetEvent('s4-fingerprint:server:requestScan')
AddEventHandler('s4-fingerprint:server:requestScan', function(source)
    CacheId = source
    SetNuiFocus(1, 1)
    SendNUIMessage({ action = 'fingerprint'})
    SetCursorLocation(0.87, 0.7)
    SetNuiFocusKeepInput(1)
    MenuIsOpen = true
    DisablePunch()
end)

RegisterNUICallback('refuse', function(data, cb)
    TriggerServerEvent('s4-fingerprint:server:refuse', CacheId)
end)

RegisterNetEvent('s4-fingerprint:client:refuse')
AddEventHandler('s4-fingerprint:client:refuse', function()
    SendNUIMessage({ action = 'refused'})
    Notify('Fingerprint', 'The person refused to scan fingerprint data!', 'error')
end)

RegisterNUICallback('notify', function(data, cb)
    Notify(data.title, data.message, data.type)
end)

RegisterNUICallback('playerList', function(data, cb)
    Framework.TriggerServerCallback('s4-fingerprint:server:getPlayerList', function(players)
        return cb(players)
    end)
end)

RegisterNUICallback('wantedList', function(data, cb)
    Framework.TriggerServerCallback('s4-fingerprint:server:wantedList', function(players)
        return cb(players)
    end)
end)

RegisterNUICallback('disableFullNui', function()
    SetNuiFocusKeepInput(0)
end)

RegisterNUICallback('enableNui', function()
    SetNuiFocusKeepInput(1)
end)

RegisterNUICallback('addToWanted', function(data, cb)
    TriggerServerEvent('s4-fingerprint:server:addToWanted', data)
end)

RegisterNUICallback('removeWanted', function(data, cb)
    TriggerServerEvent('s4-fingerprint:server:removeWanted', data)
end)

RegisterNUICallback('cancelScan', function(data, cb)
    TriggerServerEvent('s4-fingerprint:server:cancelScan', FastCache)
end)

RegisterNetEvent('s4-fingerprint:client:cancelScan')
AddEventHandler('s4-fingerprint:client:cancelScan', function()
    SetNuiFocus(0, 0)
    SetNuiFocusKeepInput(0)
    SendNUIMessage({ action = 'close'})
    Wait(200)
    MenuIsOpen = false
    DisablePunch()
end)

RegisterNUICallback('history', function(data, cb)
    Framework.TriggerServerCallback('s4-fingerprint:server:historyList', function(players)
        return cb(players)
    end)
end)

RegisterNUICallback('close', function()
    SetNuiFocus(0, 0)
    SetNuiFocusKeepInput(0)
    Wait(200)
    MenuIsOpen = false
    DisablePunch()
end)
 
DisablePunch = function()
    Citizen.CreateThread(function()
        while MenuIsOpen do
            Citizen.Wait(0)
            DisablePlayerFiring(PlayerId(), true)
            DisableControlAction(0, 21, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 200, true)
            DisableControlAction(0, 199, true)
            DisableControlAction(0, 14, true)
            DisableControlAction(0, 15, true)
            DisableControlAction(0, 16, true)
            DisableControlAction(0, 17, true)
        end
    end)
end

Notify = function(title, description, typeX)
    lib.notify({  title = title, description = description, type = typeX })
end

RegisterNetEvent('s4:fingerprint:client:notify')
AddEventHandler('s4:fingerprint:client:notify', Notify)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)	 
        if NetworkIsPlayerActive(PlayerId()) then
            TriggerServerEvent('s4:fingerprint:server:request')
            break
        end
    end
end)
 
haveThread = true
GunshotThread = function()
    Citizen.CreateThread(function()
        while haveThread == true do 
            Citizen.Wait(Config.TimeoutGunshot)
            Gunshot = false
            haveThread = false
            TriggerServerEvent('s4-fingerprint:server:gunshot', false)
        end  
    end)
end

-- AddEventHandler('CEventGunShot', function(entities, eventEntity, args)
--     if eventEntity == PlayerPedId() then 
--         Gunshot = true
--         haveThread = true
--         TriggerServerEvent('s4-fingerprint:server:gunshot', true)
--         GunshotThread() 
--     end
-- end)

local WhitelistedWeapons = {
    `weapon_unarmed`,
    `weapon_snowball`,
    `weapon_stungun`,
    `weapon_petrolcan`,
    `weapon_hazardcan`,
    `weapon_fireextinguisher`
}
local shotAmount = 0
local sleep = 1000

CreateThread(function()
    while true do
        Wait(10000)
        if LocalPlayer.state.isLoggedIn then
            if shotAmount > 0 then
                shotAmount = 0
            end
        end
    end
end)


local function WhitelistedWeapon(weapon)
    for i=1, #WhitelistedWeapons do
        if WhitelistedWeapons[i] == weapon then
            return true
        end
    end
    return false
end

CreateThread(function()
    while true do
        Wait(sleep)
        if GetCurrentPedWeapon(PlayerPedId(), false) then
            sleep = 1
            local ped = PlayerPedId()
            if IsPedShooting(ped) or IsPedDoingDriveby(ped) then
                local weapon = GetSelectedPedWeapon(ped)
                if not WhitelistedWeapon(weapon) then
                    shotAmount = shotAmount + 1
                    if shotAmount > 5 and not Gunshot then
                        if math.random(1, 10) <= 7 then
                            Gunshot = true
                            haveThread = true
                            TriggerServerEvent('s4-fingerprint:server:gunshot', true)
                            TriggerEvent("QBCore:Notify", "Barut kıyafete geçti!", "error")
                            GunshotThread() 
                        end
                    end
                end
            end
        else
            sleep = 1000
        end
    end
end)
 
Citizen.CreateThread(function()
    while true do
        if Gunshot == true then
            Citizen.Wait(1000)
        else
            Citizen.Wait(10000)
        end
        if IsPedSwimming(PlayerPedId()) then
            TriggerServerEvent('s4-fingerprint:server:gunshot', false)
        end
    end
end) 

RegisterNetEvent('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdade', function(job)
    PlayerData.job = job
end)
