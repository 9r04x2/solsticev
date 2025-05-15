QBCore = exports['qb-core']:GetCoreObject()
isHandcuffed = false
cuffType = 1
isEscorted = false
PlayerJob = {}
onDuty = false

RegisterCommand('mesai', function()
	TriggerServerEvent('QBCore:ToggleDuty')
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = QBCore.Functions.GetPlayerData()
    PlayerJob = player.job
    onDuty = player.job.onduty
    isHandcuffed = false
    TriggerServerEvent('police:server:SetHandcuffStatus', false)
end)

RegisterNetEvent('freezePlayerClient', function(freeze)
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, freeze)
end)

RegisterNetEvent('police:client:putInVehicle', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle ~= 0 then
        local seats = GetVehicleMaxNumberOfPassengers(vehicle)
        for seat = -1, seats - 1 do
            if IsVehicleSeatFree(vehicle, seat) then
                TaskWarpPedIntoVehicle(ped, vehicle, seat)
                break
            end
        end
    end
end)


-- Sunucudaki tüm oyuncuları al
function GetPlayers()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        table.insert(players, player)
    end
    return players
end



RegisterCommand('yindir', function(source, args)
    local playerPed = PlayerPedId() -- Oyuncunun Ped ID'sini al
    local players, closestDistance, closestPlayer = GetPlayers(), -1, -1
    local coords = GetEntityCoords(playerPed) -- Oyuncunun konumunu al

    -- En yakın oyuncuyu bulma fonksiyonu
    for _, playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(coords - targetCoords)
            if closestDistance == -1 or distance < closestDistance then
                closestPlayer = playerId
                closestDistance = distance
            end
        end
    end

    -- Eğer bir oyuncu bulunduysa ve yeterince yakınsa
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        local targetServerId = GetPlayerServerId(closestPlayer)
        -- Manuel olarak sunucu eventini tetikleyelim
        TriggerServerEvent('police:server:SetPlayerOutVehicle', targetServerId)
        QBCore.Functions.Notify('Oyuncu araçtan çıkarıldı.', 'success')
    else
        QBCore.Functions.Notify('Yakınlarda uygun bir oyuncu yok!', 'error')
    end
end)

-- Sunucudaki tüm oyuncuları al
function GetPlayers()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        table.insert(players, player)
    end
    return players
end



RegisterNetEvent('ambulance:client:takeOutVehicle', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        TaskLeaveVehicle(ped, GetVehiclePedIsIn(ped, false), 16)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerServerEvent('police:server:SetHandcuffStatus', false)
    TriggerServerEvent('police:server:UpdateCurrentCops')
    isHandcuffed = false
    isEscorted = false
    onDuty = false
    ClearPedTasks(PlayerPedId())
    DetachEntity(PlayerPedId(), true, false)
end)