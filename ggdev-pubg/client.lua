local QBCore = exports['qb-core']:GetCoreObject()
local eventArea = nil
local isInEvent = false
local eventKitGiven = false
local radius = 1500.0 
local eventCenter = vector3(5261.52, -5397.78, 65.2)
local isEliminated = false 


RegisterNetEvent('pubg:startEventArea', function(center, areaRadius)
    eventCenter = center
    radius = areaRadius
    eventArea = CircleZone:Create(eventCenter, radius, {
        name = "pubg_event_zone",
        debugPoly = true,
    })
    isEliminated = false 
end)


RegisterNetEvent('pubg:shrinkZone', function(shrinkAmount)
    if eventArea and radius > shrinkAmount then
        radius = radius - shrinkAmount
        eventArea:setRadius(radius)
        if isInEvent then
            TriggerEvent('ox_lib:notify', {
                title = 'PUBG Etkinliği',
                description = string.format('Alan %d birim daraltıldı! Kalan Alan: %d birim', shrinkAmount, math.floor(radius)),
                type = 'info',
                position = 'center-left',
                icon = 'fas fa-exclamation-circle'
            })
        end
    else
        if isInEvent then
            TriggerEvent('ox_lib:notify', {
                title = 'PUBG Etkinliği',
                description = 'Alan daha fazla daraltılamaz!',
                type = 'error',
                position = 'center-left',
                icon = 'fas fa-times'
            })
        end
    end
end)


RegisterCommand('pubgkatıl', function()
    QBCore.Functions.TriggerCallback('pubg:isEventActive', function(eventActive)
        if not eventActive then
            TriggerEvent('ox_lib:notify', {
                title = 'PUBG Etkinliği',
                description = 'Etkinlik henüz oluşturulmadı! Bir admin etkinliği başlatmalı.',
                type = 'error',
                position = 'center-left',
                icon = 'fas fa-exclamation-circle'
            })
            return
        end

        local PlayerPed = PlayerPedId()

        if isInEvent then
            TriggerEvent('ox_lib:notify', {
                title = 'PUBG Etkinliği',
                description = 'Zaten etkinliktesiniz!',
                type = 'error',
                position = 'center-left',
                icon = 'fas fa-exclamation-circle'
            })
            return
        end

        if not eventKitGiven then
            TriggerServerEvent('pubg:giveEventKit')
            eventKitGiven = true
        end

        SetEntityCoords(PlayerPed, 4469.88, -4479.16, 4.22, false, false, false, true)
        SetEntityHeading(PlayerPed, 339.11)
        isInEvent = true
        TriggerEvent('ox_lib:notify', {
            title = 'PUBG Etkinliği',
            description = 'Etkinliğe katıldınız!',
            type = 'success',
            position = 'center-left',
            icon = 'fas fa-check'
        })
    end)
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if eventArea and isInEvent and not isEliminated then
            local playerPed = PlayerPedId()
            local playerPos = GetEntityCoords(playerPed)

            if not eventArea:isPointInside(playerPos) then
                local health = GetEntityHealth(playerPed)
                SetEntityHealth(playerPed, health - 3)
                TriggerEvent('ox_lib:notify', {
                    title = 'PUBG Etkinliği',
                    description = 'Alan dışına çıktınız, canınız azalıyor!',
                    type = 'error',
                    position = 'center-left',
                    icon = 'fas fa-exclamation-circle'
                })
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local playerPed = PlayerPedId()
        if IsEntityDead(playerPed) and isInEvent and not isEliminated then
            isEliminated = true
            TriggerEvent('ox_lib:notify', {
                title = 'PUBG Etkinliği',
                description = 'Elenmiş durumdasınız. Alan hasarından etkilenmeyeceksiniz.',
                type = 'error',
                position = 'center-left',
                icon = 'fas fa-exclamation-circle'
            })
        end
    end
end)


AddEventHandler('baseevents:onPlayerSpawned', function()
    if isInEvent then
        isEliminated = false 
    end
end)

RegisterNetEvent('pubg:endEvent', function()
    if eventArea then
        eventArea:destroy() 
        eventArea = nil
    end

    isInEvent = false 
    isEliminated = false 

    TriggerEvent('ox_lib:notify', {
        title = 'PUBG Etkinliği',
        description = 'Etkinlik sona erdi. Artık serbestsiniz!',
        type = 'info',
        position = 'center-left',
        icon = 'fas fa-flag-checkered'
    })
end)